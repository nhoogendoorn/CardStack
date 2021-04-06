//
//  SwipableStackConfiguration.swift
//  CardStack
//
//  Created by Niels Hoogendoorn on 08/02/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import SwiftUI

open class StackConfiguration {
    public init(startIndex: Int = 0,
                minimumSwipingDistance: CGFloat = 0,
                numberOfCardsShown: Int = 3) {
        self.startIndex = startIndex
        self.minimumSwipingDistance = minimumSwipingDistance
        self.numberOfCardsShown = numberOfCardsShown
    }

    /// Sets the index the card list should start with. Setting it to 3, would show the card for index 3 for example when the View loads. Default value is `0`..
    var startIndex: Int = 0

    /// The minimum swiping distance before the dragging starts.
    var minimumSwipingDistance: CGFloat = 0

    /// The number of cards shown in the View at the same time.
    var numberOfCardsShown: Int = 3

    /// Set the style for stacking. Default is decreasing height, where every next card is 30 points smaller. The other option is .sameHeight.
    // This last option is not yet implemented.
//    var stackStyle: StackStyle = .decreasingHeight

    /// Access the default configuration
    static var shared = StackConfiguration()
}
