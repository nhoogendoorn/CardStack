//
//  CardStackLayout.swift
//  CardStack
//
//  Created by Niels Hoogendoorn on 08/02/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import CoreGraphics

/// Where a card sits, relative to the card on top of the stack.
struct CardPlacement: Equatable {
    /// Horizontal offset from the top card.
    var offset: CGFloat
    var scale: CGFloat
    /// Cards before the current one are moved off the screen to the left.
    var isOffscreen: Bool
}

/// The math behind the stack. Kept free of SwiftUI so it's easy to test.
enum CardStackLayout {
    /// The horizontal gap between stacked cards. Every step back also shrinks a card by this many percent.
    static let cardDistance: CGFloat = 15

    static func placement(index: Int, currentIndex: Int, cardsShown: Int) -> CardPlacement {
        let cardsShown = max(cardsShown, 1)
        let distance = index - currentIndex

        if distance < 0 {
            return CardPlacement(offset: 0, scale: scale(stepsBack: cardsShown), isOffscreen: true)
        }
        if distance < cardsShown {
            return CardPlacement(offset: 2 * CGFloat(distance) * cardDistance,
                                 scale: scale(stepsBack: distance),
                                 isOffscreen: false)
        }
        // Every card after the visible ones waits in the same spot, peeking out just behind the last visible card.
        return CardPlacement(offset: CGFloat(2 * cardsShown - 1) * cardDistance,
                             scale: scale(stepsBack: cardsShown),
                             isOffscreen: false)
    }

    /// The cards worth rendering: the one just off screen (so it can slide back in), the visible ones,
    /// and the first two waiting behind them. Anything further away is covered or off screen anyway.
    static func renderedIndices(currentIndex: Int, cardsShown: Int, count: Int) -> Range<Int> {
        let lower = min(max(currentIndex - 1, 0), count)
        let upper = min(currentIndex + max(cardsShown, 1) + 2, count)
        return lower..<max(lower, upper)
    }

    static func clampedIndex(_ index: Int, count: Int) -> Int {
        min(max(index, 0), max(count - 1, 0))
    }

    /// The index to move to after a drag ends. A negative translation is a swipe to the left, which moves forward.
    static func index(afterSwipe translation: CGFloat, minimumDistance: CGFloat, currentIndex: Int, count: Int) -> Int {
        let target: Int
        if -translation > minimumDistance {
            target = currentIndex + 1
        } else if translation > minimumDistance {
            target = currentIndex - 1
        } else {
            target = currentIndex
        }
        return clampedIndex(target, count: count)
    }

    private static func scale(stepsBack: Int) -> CGFloat {
        1 - CGFloat(stepsBack) * cardDistance / 100
    }
}
