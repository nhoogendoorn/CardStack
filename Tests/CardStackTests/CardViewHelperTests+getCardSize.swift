//
//  CardViewHelperTests+getCardSize.swift
//  
//
//  Created by Niels Hoogendoorn on 13/04/2020.
//

import XCTest
@testable import CardStack

@available(iOS 13.0, *)
extension CardViewHelperTests {
    func test_getCardSize_size200cardsShown3currentIndex0_itemIdx0_return200() {
        let sut = CardViewHelper.getCardSize(cardSize: cardSize,
                                             cardsShown: 3,
                                             currentIndex: 0,
                                             items: MockCardData.items,
                                             item: MockCardData.items[0])
        XCTAssertEqual(sut, cardSize)
    }
    
    func test_getCardSize_size200cardsShown3currentIndex1_itemIdx0_return200MinCardDistancex4() {
        let sut = CardViewHelper.getCardSize(cardSize: cardSize,
                                             cardsShown: 3,
                                             currentIndex: 1,
                                             items: MockCardData.items,
                                             item: MockCardData.items[0])
        let expectedResult = CGSize(width: cardSize.width - (.cardDistance * 4),
                                    height: cardSize.height - (.cardDistance * 4))
        XCTAssertEqual(sut, expectedResult)
    }
    
    func test_getCardSize_size200cardsShown3currentIndex1_itemIdx1_return200() {
        let sut = CardViewHelper.getCardSize(cardSize: cardSize,
                                             cardsShown: 3,
                                             currentIndex: 1,
                                             items: MockCardData.items,
                                             item: MockCardData.items[1])
        XCTAssertEqual(sut, cardSize)
    }
    
    func test_getCardSize_size200cardsShown3currentIndex1_itemIdx2_return200MinCardDistancex2() {
        let sut = CardViewHelper.getCardSize(cardSize: cardSize,
                                             cardsShown: 3,
                                             currentIndex: 1,
                                             items: MockCardData.items,
                                             item: MockCardData.items[2])
        let expectedResult = CGSize(width: 200 - (.cardDistance * 2),
                                    height: 200 - (.cardDistance * 2))
        XCTAssertEqual(sut, expectedResult)
    }
    
    func test_getCardSize_size200cardsShown3currentIndex1_itemIdx3_return200MinCardDistancex4() {
        let sut = CardViewHelper.getCardSize(cardSize: cardSize,
                                             cardsShown: 3,
                                             currentIndex: 1,
                                             items: MockCardData.items,
                                             item: MockCardData.items[3])
        let expectedResult = CGSize(width: 200 - (.cardDistance * 4),
                                    height: 200 - (.cardDistance * 4))
        XCTAssertEqual(sut, expectedResult)
    }
    
    func test_getCardSize_size200cardsShown3currentIndex2_itemIdx0_return200MinCardDistancex4() {
        let sut = CardViewHelper.getCardSize(cardSize: cardSize,
                                             cardsShown: 3,
                                             currentIndex: 2,
                                             items: MockCardData.items,
                                             item: MockCardData.items[0])
        let expectedResult = CGSize(width: 200 - (.cardDistance * 4),
                                    height: 200 - (.cardDistance * 4))
        XCTAssertEqual(sut, expectedResult)
    }
    
    func test_getCardSize_size200cardsShown3currentIndex2_itemIdx2_return200() {
        let sut = CardViewHelper.getCardSize(cardSize: cardSize,
                                             cardsShown: 3,
                                             currentIndex: 2,
                                             items: MockCardData.items,
                                             item: MockCardData.items[2])
        XCTAssertEqual(sut, cardSize)
    }
    
    func test_getCardSize_size200cardsShown3currentIndex2_itemIdx3_return200MinCardDistancex2() {
        let sut = CardViewHelper.getCardSize(cardSize: cardSize,
                                             cardsShown: 3,
                                             currentIndex: 2,
                                             items: MockCardData.items,
                                             item: MockCardData.items[3])
        let expectedResult = CGSize(width: 200 - (.cardDistance * 2),
                                    height: 200 - (.cardDistance * 2))
        XCTAssertEqual(sut, expectedResult)
    }
    
    func test_getCardSize_size200cardsShown2currentIndex2_itemIdx2_return200() {
        let sut = CardViewHelper.getCardSize(cardSize: cardSize,
                                             cardsShown: 2,
                                             currentIndex: 2,
                                             items: MockCardData.items,
                                             item: MockCardData.items[2])
        XCTAssertEqual(sut, cardSize)
    }
    
    func test_getCardSize_size200cardsShown2currentIndex0_itemIdx1_return200MinCardDistancex2() {
        let sut = CardViewHelper.getCardSize(cardSize: cardSize,
                                             cardsShown: 2,
                                             currentIndex: 0,
                                             items: MockCardData.items,
                                             item: MockCardData.items[1])
        let expectedResult = CGSize(width: 200 - (.cardDistance * 2),
                                    height: 200 - (.cardDistance * 2))
        XCTAssertEqual(sut, expectedResult)
    }
    
    func test_getCardSize_size200cardsShown2currentIndex0_itemIdx2_return200MinCardDistancex2() {
        let sut = CardViewHelper.getCardSize(cardSize: cardSize,
                                             cardsShown: 2,
                                             currentIndex: 0,
                                             items: MockCardData.items,
                                             item: MockCardData.items[2])
        let expectedResult = CGSize(width: 200 - (.cardDistance * 2),
                                    height: 200 - (.cardDistance * 2))
        XCTAssertEqual(sut, expectedResult)
    }

}
