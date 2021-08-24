//
//  CardViewHelperTests+getSmallestItemSize.swift
//  
//
//  Created by Niels Hoogendoorn on 13/04/2020.
//

import XCTest
@testable import CardStack

extension CardViewHelperTests {
    func test_getSmallestItemSize_cardSizeIs200ItemsShownIsMin1_return0() {
        let sut = CardViewHelper.getSmallestItemSize(cardSize: cardSize, itemsShown: -1)
        XCTAssertEqual(sut, .zero)
    }
    
    func test_getSmallestItemSize_cardSizeIs200ItemsShownIs0_return0() {
        let sut = CardViewHelper.getSmallestItemSize(cardSize: cardSize, itemsShown: 0)
        XCTAssertEqual(sut, .zero)
    }
    
    func test_getSmallestItemSize_cardSizeIs200ItemsShownIs1_return200MinCardDistancex2() {
        let sut = CardViewHelper.getSmallestItemSize(cardSize: cardSize, itemsShown: 1)
        let expectedResult = CGSize(width: cardSize.width - (.cardDistance * 2),
                                    height: cardSize.height - (.cardDistance * 2))
        XCTAssertEqual(sut, expectedResult)
    }
    
    func test_getSmallestItemSize_cardSizeIs200ItemsShownIs2_return200MinCardDistancex4() {
        let sut = CardViewHelper.getSmallestItemSize(cardSize: cardSize, itemsShown: 2)
        let expectedResult = CGSize(width: cardSize.width - (.cardDistance * 4),
                                    height: cardSize.height - (.cardDistance * 4))
        XCTAssertEqual(sut, expectedResult)
    }
    func test_getSmallestItemSize_cardSizeIs0ItemsShownIs0_return0() {
        let sut = CardViewHelper.getSmallestItemSize(cardSize: .zero, itemsShown: .zero)
        XCTAssertEqual(sut, .zero)
    }
    func test_getSmallestItemSize_cardSizeIs0ItemsShownIs1_return0() {
        let sut = CardViewHelper.getSmallestItemSize(cardSize: .zero, itemsShown: 1)
        XCTAssertEqual(sut, .zero)
    }

}
