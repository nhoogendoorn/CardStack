//
//  CardStackView.swift
//  CardStack
//
//  Created by Niels Hoogendoorn on 08/02/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import SwiftUI

/// A stack of cards you swipe through. Swipe left for the next card and right for the previous one.
///
/// ```swift
/// CardStackView(items) { item in
///     CardExampleView(data: item)
/// }
/// ```
public struct CardStackView<Content: View, Item: Identifiable>: View {
    private let items: [Item]
    private let configuration: StackConfiguration
    private let content: (Item) -> Content

    @State private var currentIndex: Int
    @GestureState(resetTransaction: Transaction(animation: .default))
    private var dragOffset: CGFloat = 0

    public init(_ items: [Item],
                configuration: StackConfiguration = StackConfiguration(),
                @ViewBuilder content: @escaping (Item) -> Content) {
        self.items = items
        self.configuration = configuration
        self.content = content
        _currentIndex = State(initialValue: CardStackLayout.clampedIndex(configuration.startIndex, count: items.count))
    }

    public var body: some View {
        ZStack {
            // Later views draw on top, so go backwards to put the current card in front.
            ForEach(renderedCards.reversed()) { card in
                content(card.item)
                    .modifier(CardPlacementModifier(
                        placement: CardStackLayout.placement(index: card.index,
                                                             currentIndex: currentIndex,
                                                             cardsShown: configuration.numberOfCardsShown),
                        dragOffset: card.index == currentIndex ? dragOffset : 0))
                    .accessibilityHidden(card.index != currentIndex)
                    // Cards enter and leave while covered or off screen, so they shouldn't fade.
                    .transition(.identity)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .gesture(swipeGesture)
        .accessibilityElement(children: .combine)
        .accessibilityValue(accessibilityPosition)
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                move(to: currentIndex + 1)
            case .decrement:
                move(to: currentIndex - 1)
            @unknown default:
                break
            }
        }
        .onChange(of: items.count) { _, count in
            currentIndex = CardStackLayout.clampedIndex(currentIndex, count: count)
        }
    }

    private var renderedCards: [IndexedItem<Item>] {
        CardStackLayout
            .renderedIndices(currentIndex: currentIndex,
                             cardsShown: configuration.numberOfCardsShown,
                             count: items.count)
            .map { IndexedItem(index: $0, item: items[$0]) }
    }

    private var swipeGesture: some Gesture {
        DragGesture()
            .updating($dragOffset) { value, dragOffset, _ in
                dragOffset = value.translation.width
            }
            .onEnded { value in
                move(to: CardStackLayout.index(afterSwipe: value.translation.width,
                                               minimumDistance: configuration.minimumSwipingDistance,
                                               currentIndex: currentIndex,
                                               count: items.count))
            }
    }

    private var accessibilityPosition: Text {
        guard !items.isEmpty else { return Text(verbatim: "") }
        return Text("Card \(currentIndex + 1) of \(items.count)", bundle: .module)
    }

    private func move(to index: Int) {
        let index = CardStackLayout.clampedIndex(index, count: items.count)
        guard index != currentIndex else { return }
        withAnimation {
            currentIndex = index
        }
    }
}

private struct IndexedItem<Item: Identifiable>: Identifiable {
    let index: Int
    let item: Item

    var id: Item.ID { item.id }
}

private struct CardPlacementModifier: ViewModifier {
    let placement: CardPlacement
    let dragOffset: CGFloat

    func body(content: Content) -> some View {
        content
            .scaleEffect(placement.scale)
            .offset(x: placement.offset + dragOffset)
            .visualEffect { [isOffscreen = placement.isOffscreen] effect, proxy in
                // Move the card's right edge past the left edge of the screen, with some room to spare.
                let frame = proxy.frame(in: .global)
                return effect.offset(x: isOffscreen ? -(frame.maxX + frame.width) : 0)
            }
    }
}
