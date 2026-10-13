//
//  StackConfiguration.swift
//  CardStack
//
//  Created by Niels Hoogendoorn on 08/02/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import CoreGraphics

/// Settings for a ``CardStackView``.
public struct StackConfiguration: Sendable, Equatable {
    /// The index of the card shown first. Setting it to 3 shows the card at index 3 when the view loads. Default value is `0`.
    public var startIndex: Int

    /// How far, in points, a card needs to be dragged before letting go moves to the next or previous card. Default value is `0`.
    public var minimumSwipingDistance: CGFloat

    /// The number of cards shown at the same time. Default value is `3`.
    public var numberOfCardsShown: Int

    public init(startIndex: Int = 0,
                minimumSwipingDistance: CGFloat = 0,
                numberOfCardsShown: Int = 3) {
        self.startIndex = startIndex
        self.minimumSwipingDistance = minimumSwipingDistance
        self.numberOfCardsShown = numberOfCardsShown
    }
}
