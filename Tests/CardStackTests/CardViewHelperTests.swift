//
//  CardViewHelperTests.swift
//  TestTests
//
//  Created by Niels Hoogendoorn on 13/03/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import XCTest
@testable import CardStack

@available(iOS 13.0, *)
class CardViewHelperTests: XCTestCase {
    let cardSize = CGSize(width: 200, height: 200)
    
    func test_getCardBaseOffset_size200cardsShown3currentIndex0_itemIdx0_return0X0() {
        let sut = CardViewHelper.getCardBaseOffset(cardSize: cardSize,
                                                   cardsShown: 3,
                                                   currentIndex: 0,
                                                   items: MockCardData.items,
                                                   currentItem: MockCardData.items[0])
        XCTAssertEqual(sut, .zero)
    }
    
    func test_getCardBaseOffset_size200cardsShown3currentIndex1_itemIdx0_returnMinScreenwidthPlus200X0() {
        let sut = CardViewHelper.getCardBaseOffset(cardSize: cardSize,
                                                   cardsShown: 3,
                                                   currentIndex: 1,
                                                   items: MockCardData.items,
                                                   currentItem: MockCardData.items[0])
        let expectedResult = CGSize(width: -(.screenWidth + cardSize.width),
                                    height: .zero)
        XCTAssertEqual(sut, expectedResult)
    }
    
    func test_getCardBaseOffset_size200cardsShown3currentIndex2_itemIdx1_returnMinScreenwidthPlus200X0() {
        let sut = CardViewHelper.getCardBaseOffset(cardSize: cardSize,
                                                   cardsShown: 3,
                                                   currentIndex: 2,
                                                   items: MockCardData.items,
                                                   currentItem: MockCardData.items[1])
        let expectedResult = CGSize(width: -(.screenWidth + cardSize.width),
                                    height: .zero)
        XCTAssertEqual(sut, expectedResult)
    }
    
    func test_getCardBaseOffset_size200cardsShown3currentIndex0_itemIdx1_returnCardDistancex0() {
        let sut = CardViewHelper.getCardBaseOffset(cardSize: cardSize,
                                                   cardsShown: 3,
                                                   currentIndex: 0,
                                                   items: MockCardData.items,
                                                   currentItem: MockCardData.items[1])
        let expectedResult = CGSize(width: .cardDistance,
                                    height: .zero)
        XCTAssertEqual(sut, expectedResult)
    }
    func test_getCardBaseOffset_size200cardsShown3currentIndex0_itemIdx2_returnCardDistancex2X0() {
        let sut = CardViewHelper.getCardBaseOffset(cardSize: cardSize,
                                                   cardsShown: 3,
                                                   currentIndex: 0,
                                                   items: MockCardData.items,
                                                   currentItem: MockCardData.items[2])
        let expectedResult = CGSize(width: .cardDistance * 2,
                                    height: .zero)
        XCTAssertEqual(sut, expectedResult)
    }
    
    func test_shouldShowOffscreen_curIndexIs0ItemIndexIs1_returnFalse() {
        let sut = CardViewHelper.shouldShowOffscreen(currentIndex: 0, itemIndex: 1)
        XCTAssertFalse(sut)
    }
    
    func test_shouldShowOffscreen_curIndexIs1ItemIndexIs1_returnFalse() {
        let sut = CardViewHelper.shouldShowOffscreen(currentIndex: 1, itemIndex: 1)
        XCTAssertFalse(sut)
    }
    
    func test_shouldShowOffscreen_curIndexIs1ItemIndexIs0_returnTrue() {
        let sut = CardViewHelper.shouldShowOffscreen(currentIndex: 1, itemIndex: 0)
        XCTAssertTrue(sut)
    }
    
    func test_getTheVisibleIndexRange_curIndexIs0cardsShownIs3_return0Range2() {
        let sut = CardViewHelper.getTheVisibleIndexRange(currentIndex: 0, cardsShown: 3)
        let expectedResult = 0...2
        XCTAssertEqual(sut, expectedResult)
    }
    
    func test_getTheVisibleIndexRange_curIndexIs1cardsShownIs3_return1Range3() {
        let sut = CardViewHelper.getTheVisibleIndexRange(currentIndex: 1, cardsShown: 3)
        let expectedResult = 1...3
        XCTAssertEqual(sut, expectedResult)
    }
    
    func test_getLastShownIndexFrom_curIndexIs0cardsShownIs3_return3() {
        let sut = CardViewHelper.getLastShownIndexFrom(currentIndex: 0, cardsShown: 3)
        XCTAssertEqual(sut, 3)
    }
    
    func test_getLastShownIndexFrom_curIndexIs1cardsShownIs3_return4() {
        let sut = CardViewHelper.getLastShownIndexFrom(currentIndex: 1, cardsShown: 3)
        XCTAssertEqual(sut, 4)
    }
    
    func test_getCardDraggingOffset_cardsIdxsDoesNotContainCurrentIndex_return0X0() {
        let dragInfo = DragInformation(currentIndex: MockCardData.items.count,
                                       items: MockCardData.items,
                                       item: MockCardData.items[0],
                                       dragValue: .zero)
        let sut = CardViewHelper.getCardDraggingOffset(dragInfo: dragInfo)
        XCTAssertEqual(sut, .zero)
    }
    
    func test_getCardDraggingOffset_itemIsNotCardForCurIdx_return0X0() {
        let dragInfo = DragInformation(currentIndex: 1,
                                       items: MockCardData.items,
                                       item: MockCardData.items[0],
                                       dragValue: .zero)
        let sut = CardViewHelper.getCardDraggingOffset(dragInfo: dragInfo)
        XCTAssertEqual(sut, .zero)
    }
    
    func test_getCardDraggingOffset_itemIsCardForCurIdxDragValXIsMin20_returnMin20X0() {
        let dragInfo = DragInformation(currentIndex: 0,
                                       items: MockCardData.items,
                                       item: MockCardData.items[0],
                                       dragValue: CGPoint(x: 20, y: 0))
        let sut = CardViewHelper.getCardDraggingOffset(dragInfo: dragInfo)
        XCTAssertEqual(sut, CGSize(width: -20, height: 0))
    }
    
    func test_getListOffset_curIdxIs0_return0xMinCardOffsetInStack() {
        let sut = CardViewHelper.getListOffset(currentIndex: 0)
        XCTAssertEqual(sut, 0 * -.cardDistance)
    }
    
    func test_getListOffset_curIdxIs1_return1xMinCardOffsetInStack() {
        let sut = CardViewHelper.getListOffset(currentIndex: 1)
        XCTAssertEqual(sut, 1 * -.cardDistance)
    }
    
    func test_getListOffset_curIdxIs2_return2xMinCardOffsetInStack() {
        let sut = CardViewHelper.getListOffset(currentIndex: 2)
        XCTAssertEqual(sut, 2 * -.cardDistance)
    }
    
    func test_getCardScaleSize_itemIdxIs0CurIdxIs0CardsShownIs3_return1() {
        let sut = CardViewHelper.getCardScaleSize(cardsShown: 3,
                                                  currentIndex: 0,
                                                  items: MockCardData.items,
                                                  item: MockCardData.items[0])
        XCTAssertEqual(sut, CGSize(width: 1, height: 1))
    }
    
    func test_getCardScaleSize_itemIdxIs1CurIdxIs0CardsShownIs3_return1MinCardDistanceDiv100() {
        let sut = CardViewHelper.getCardScaleSize(cardsShown: 3,
                                                  currentIndex: 0,
                                                  items: MockCardData.items,
                                                  item: MockCardData.items[1])
        XCTAssertEqual(sut, CGSize(width: 1 - CGFloat.cardDistance / 100,
                                   height: 1 - CGFloat.cardDistance / 100))
    }
    func test_getCardScaleSize_itemIdxIs2CurIdxIs0CardsShownIs3_return1MinCardDistanceDiv100xCardsShownMinOne() {
        let currentIndex = 0
        let itemIndex = 2
        let itemDistance = itemIndex - currentIndex
        let sut = CardViewHelper.getCardScaleSize(cardsShown: 3,
                                                  currentIndex: currentIndex,
                                                  items: MockCardData.items,
                                                  item: MockCardData.items[itemIndex])
        let factor = (CGFloat.cardDistance / 100) * CGFloat(itemDistance)
        let expectedResult = CGSize(width: 1 - factor,
                                    height: 1 - factor)
        XCTAssertEqual(sut, expectedResult)
    }
    
    func test_getCardScaleSize_itemIdxIs3CurIdxIs0CardsShownIs3_return1MinCardDistanceDiv100xCardsShownMinOne() {
        let currentIndex = 0
        let itemIndex = 3
        let itemDistance = itemIndex - currentIndex
        let sut = CardViewHelper.getCardScaleSize(cardsShown: 3,
                                                  currentIndex: currentIndex,
                                                  items: MockCardData.items,
                                                  item: MockCardData.items[itemIndex])
        let factor = (CGFloat.cardDistance / 100) * CGFloat(itemDistance)
        let expectedResult = CGSize(width: 1 - factor,
                                    height: 1 - factor)
        XCTAssertEqual(sut, expectedResult)
    }
    
    func test_getCardScaleSize_itemIdxIs2CurIdxIs0CardsShownIs2_return1MinCardDistanceDiv100xCardsShownMinOne() {
        let currentIndex = 0
        let itemIndex = 2
        let itemDistance = itemIndex - currentIndex
        let sut = CardViewHelper.getCardScaleSize(cardsShown: 2,
                                                  currentIndex: currentIndex,
                                                  items: MockCardData.items,
                                                  item: MockCardData.items[itemIndex])
        let factor = (CGFloat.cardDistance / 100) * CGFloat(itemDistance)
        let expectedResult = CGSize(width: 1 - factor,
                                    height: 1 - factor)
        XCTAssertEqual(sut, expectedResult)
        XCTAssertEqual(sut, expectedResult)
    }
    
    func test_getCardScaleSize_itemIdxIs2CurIdxIs1CardsShownIs2_return1MinCardDistanceDiv100() {
        let cardsShown = 2
        let sut = CardViewHelper.getCardScaleSize(cardsShown: cardsShown,
                                                  currentIndex: 1,
                                                  items: MockCardData.items,
                                                  item: MockCardData.items[2])
        let expectedResult = CGSize(width: 1 - CGFloat.cardDistance / 100,
                                    height: 1 - CGFloat.cardDistance / 100)
        XCTAssertEqual(sut, expectedResult)
    }
    
    func test_getCardScaleSize_itemIdxIs2CurIdxIs2CardsShownIs2_return1() {
        let cardsShown = 2
        let sut = CardViewHelper.getCardScaleSize(cardsShown: cardsShown,
                                                  currentIndex: 2,
                                                  items: MockCardData.items,
                                                  item: MockCardData.items[2])
        let expectedResult = CGSize(width: 1, height: 1)
        XCTAssertEqual(sut, expectedResult)
    }
    
}
