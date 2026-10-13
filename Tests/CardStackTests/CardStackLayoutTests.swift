//
//  CardStackLayoutTests.swift
//  CardStackTests
//
//  Created by Niels Hoogendoorn on 13/03/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import CoreGraphics
import Testing
@testable import CardStack

struct CardStackLayoutTests {
    private let distance = CardStackLayout.cardDistance

    // MARK: - placement

    @Test func currentCardIsInFrontAtFullSize() {
        let placement = CardStackLayout.placement(index: 2, currentIndex: 2, cardsShown: 3)
        #expect(placement == CardPlacement(offset: 0, scale: 1, isOffscreen: false))
    }

    @Test(arguments: [1, 2])
    func visibleCardsStepBack(stepsBack: Int) {
        let placement = CardStackLayout.placement(index: 1 + stepsBack, currentIndex: 1, cardsShown: 3)
        #expect(placement.offset == 2 * CGFloat(stepsBack) * distance)
        #expect(isClose(placement.scale, 1 - CGFloat(stepsBack) * 0.15))
        #expect(!placement.isOffscreen)
    }

    @Test(arguments: [3, 4, 10])
    func cardsAfterTheVisibleOnesWaitInOneSpot(index: Int) {
        let placement = CardStackLayout.placement(index: index, currentIndex: 0, cardsShown: 3)
        #expect(placement.offset == 5 * distance)
        #expect(isClose(placement.scale, 0.55))
        #expect(!placement.isOffscreen)
    }

    @Test(arguments: [0, 1])
    func cardsBeforeTheCurrentOneAreOffscreen(index: Int) {
        let placement = CardStackLayout.placement(index: index, currentIndex: 2, cardsShown: 3)
        #expect(placement.isOffscreen)
        #expect(isClose(placement.scale, 0.55))
    }

    @Test(arguments: [0, -1])
    func showsAtLeastOneCard(cardsShown: Int) {
        #expect(CardStackLayout.placement(index: 0, currentIndex: 0, cardsShown: cardsShown).scale == 1)
        #expect(CardStackLayout.placement(index: 1, currentIndex: 0, cardsShown: cardsShown).offset == distance)
    }

    // MARK: - renderedIndices

    @Test(arguments: [
        (currentIndex: 0, count: 10, expected: 0..<5),
        (currentIndex: 4, count: 10, expected: 3..<9),
        (currentIndex: 9, count: 10, expected: 8..<10),
        (currentIndex: 0, count: 2, expected: 0..<2),
        (currentIndex: 0, count: 0, expected: 0..<0)
    ])
    func rendersOnlyCardsNearTheTop(currentIndex: Int, count: Int, expected: Range<Int>) {
        #expect(CardStackLayout.renderedIndices(currentIndex: currentIndex, cardsShown: 3, count: count) == expected)
    }

    // MARK: - clampedIndex

    @Test(arguments: [
        (index: -1, count: 5, expected: 0),
        (index: 2, count: 5, expected: 2),
        (index: 7, count: 5, expected: 4),
        (index: 3, count: 0, expected: 0)
    ])
    func clampsIndexToItems(index: Int, count: Int, expected: Int) {
        #expect(CardStackLayout.clampedIndex(index, count: count) == expected)
    }

    // MARK: - index(afterSwipe:)

    @Test(arguments: [
        (translation: -20.0, currentIndex: 1, expected: 2),
        (translation: 20.0, currentIndex: 1, expected: 0),
        (translation: -5.0, currentIndex: 1, expected: 1),
        (translation: 5.0, currentIndex: 1, expected: 1),
        (translation: -20.0, currentIndex: 4, expected: 4),
        (translation: 20.0, currentIndex: 0, expected: 0)
    ])
    func swipeMovesOneCard(translation: CGFloat, currentIndex: Int, expected: Int) {
        let index = CardStackLayout.index(afterSwipe: translation, minimumDistance: 10, currentIndex: currentIndex, count: 5)
        #expect(index == expected)
    }

    @Test func swipeOnEmptyStackStaysAtZero() {
        #expect(CardStackLayout.index(afterSwipe: -20, minimumDistance: 0, currentIndex: 0, count: 0) == 0)
    }

    private func isClose(_ lhs: CGFloat, _ rhs: CGFloat) -> Bool {
        abs(lhs - rhs) < 0.0001
    }
}
