//
//  SwipableStackConfiguration.swift
//  CardStack
//
//  Created by Niels Hoogendoorn on 08/02/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import SwiftUI

open class StackConfiguration {
    
    public init() {}
    
    
    
    var minimumSwipingDistance: CGFloat = 0
    var numberOfCardsShown: Int = 3
    var stackStyle: StackStyle = .decreasingHeight
    
    static var shared = StackConfiguration()
}
