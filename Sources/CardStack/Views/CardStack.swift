//
//  CardStack.swift
//  CardStack
//
//  Created by Niels Hoogendoorn on 08/02/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public struct CardStack<Content: Card, CardData: CardInformation>: View {
    @EnvironmentObject var navigation: CardNavigation<CardData>
    @State var dragValue: CGPoint = .zero
    var configuration: StackConfiguration?
    
    init(configuration: StackConfiguration? = nil) {
        self.configuration = configuration
    }
    
    public var body: some View {
        ZStack(alignment: .trailing) {
            // Reverse the item list so the first item in the list
            // will show in front.
            ForEach(navigation.reversedList, id: \.id) { item in
                CardView<Content, CardData>(info: item,
                                            configuration: self.configuration ?? StackConfiguration.shared,
                                            dragValue: self.$dragValue)
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            // We need to adjust the offset for the current index after flipping
            // the cards otherwise it will stay in the same position. We want to
            // have every list item on the place of the first index in the list.
            .offset(x: getOffsetForStackedView(), y: .zero)
            .gesture(DragGesture()
                .onChanged({ (value: DragGesture.Value) in
                    self.handleHorizontalDragging(value)
                })
                .onEnded({ (value: DragGesture.Value) in
                    self.handleDraggingEnd(value)
                })
        )
    }
    
    fileprivate func getOffsetForStackedView() -> CGFloat {
        return CardViewHelper.getListOffset(currentIndex: navigation.currentIndex)
    }
    
    fileprivate func handleHorizontalDragging(_ value: DragGesture.Value) {
        self.dragValue = CGPoint(x: value.horizontalDistance(), y: .zero)
    }
    
    fileprivate func handleDraggingEnd(_ value: DragGesture.Value) {
        self.handleSwipeDirection(value)
        
        // Reset dragvalue after moving so that the card is at its base position.
        self.dragValue = .zero
    }
    
    fileprivate func handleSwipeDirection(_ value: DragGesture.Value) {
        let minDistance = configuration?.minimumSwipingDistance ?? StackConfiguration.shared.minimumSwipingDistance
        
        let swipeDirection = value.getSwipeDirection(minimumDistance: minDistance)
        switch swipeDirection {
        case .forward:
            self.navigation.move(.forward)
        case .backward:
            self.navigation.move(.backward)
        case .none:
            break
        }
    }
}
