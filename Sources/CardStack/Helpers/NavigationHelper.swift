//
//  NavigationHelper.swift
//  CardStack
//
//  Created by Niels Hoogendoorn on 08/02/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import SwiftUI

enum NavigationHelper {    
    static func allowedToMove(direction: HorizontalDirection, items: [Any], currentIndex: Int) -> Bool {
        guard listIsNotEmpty(items) else { return false }
        switch direction {
        case .forward:
            return canMoveForward(items: items, currentIndex: currentIndex)
        case .backward:
            return canMoveBackward(currentIndex: currentIndex)
        case .none:
            return false
        }
    }
    
    static func canMoveForward(items: [Any], currentIndex: Int) -> Bool {
        currentIndex + 1 < items.count
    }
    
    static func canMoveBackward(currentIndex: Int) -> Bool {
        currentIndex - 1 >= .zero
    }
    
    static func listIsNotEmpty(_ list: [Any]) -> Bool {
        list.indices.count > .zero
    }
}
