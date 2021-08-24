//
//  NavigationHelperTests.swift
//  TestTests
//
//  Created by Niels Hoogendoorn on 12/03/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import XCTest
@testable import CardStack

class NavigationHelperTests: XCTestCase {
    
    func test_canMoveForward_currentIndexIsLowerThanTotalItems_returnTrue() {
        let items: [Int] = [1, 2, 3, 4]
        let currentIndex = 1
        XCTAssertTrue(NavigationHelper.canMoveForward(items: items, currentIndex: currentIndex))
    }
    
    func test_canMoveForward_currentIndexIsEqualToLastItemIndex_returnFalse() {
        let items: [Int] = [1, 2, 3, 4]
        let currentIndex = items.count - 1
        XCTAssertFalse(NavigationHelper.canMoveForward(items: items, currentIndex: currentIndex))
    }
    
    func test_canMoveBackward_currentIndexIsGreaterThanZero_returnTrue() {
        let currentIndex = 1
        XCTAssertTrue(NavigationHelper.canMoveBackward(currentIndex: currentIndex))
    }
    
    func test_canMoveBackward_currentIndexIsZero_returnFalse() {
        let currentIndex = 0
        XCTAssertFalse(NavigationHelper.canMoveBackward(currentIndex: currentIndex))
    }
    
    func test_allowedToMove_itemsIsEmpty_returnFalse() {
        XCTAssertFalse(NavigationHelper.allowedToMove(direction: .forward, items: [], currentIndex: 0))
    }
}
