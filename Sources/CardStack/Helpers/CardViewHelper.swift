//
//  CardViewHelper.swift
//  CardStack
//
//  Created by Niels Hoogendoorn on 08/02/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
enum CardViewHelper {
    static func getSmallestItemSize(cardSize: CGSize, itemsShown: Int) -> CGSize {
        guard cardSize != .zero, itemsShown > .zero else { return .zero }
        let width: CGFloat = cardSize.width + (CGFloat(itemsShown) * -.cardDistance * 2)
        let height: CGFloat = cardSize.height + (CGFloat(itemsShown) * -.cardDistance * 2)
        return CGSize(width: width, height: height)
    }
    
    
    static func getCardSize<CardData: CardInformation>(
        cardSize: CGSize,
        cardsShown: Int,
        currentIndex: Int,
        items: [CardData],
        item: CardData) -> CGSize
    {
        let index = items.firstIndex(where: { $0.id == item.id })
        guard let foundIndex = index else { return .zero }
        let smallestItemSize = getSmallestItemSize(cardSize: cardSize,
                                                   itemsShown: cardsShown - 1)
        
        if shouldShowOffscreen(currentIndex: currentIndex, itemIndex: foundIndex) {
            return smallestItemSize
        }
                
        switch foundIndex {
        case getTheVisibleIndexRange(currentIndex: currentIndex, cardsShown: cardsShown):
            
            let indexDistance: CGFloat = CGFloat(foundIndex - currentIndex)
            let itemOffset = (indexDistance * -.cardDistance) * 2
            print("abc foundIndex: \(foundIndex)")
            let width = cardSize.width + itemOffset
            let height = cardSize.height + itemOffset
            return CGSize(width: width, height: height)
        default:
            print("abc Not foundindex: \(foundIndex)")
            return smallestItemSize
        }
    }
    

    
    static func getCardBaseOffset<CardData: CardInformation>(
        cardSize: CGSize,
        cardsShown: Int,
        currentIndex: Int,
        items: [CardData],
        currentItem: CardData) -> CGSize
    {
        guard
            let index = items.firstIndex(where: {
                $0.id == currentItem.id })
            else { return .zero }
        
        if shouldShowOffscreen(currentIndex: currentIndex, itemIndex: index) {
            print("Index \(index): \(CGSize(width: -(.screenWidth + cardSize.width), height: .zero))")
            return CGSize(width: -(.screenWidth + cardSize.width), height: .zero)
        }
                
        switch index {
        case getTheVisibleIndexRange(currentIndex: currentIndex, cardsShown: cardsShown):
            let offset = CGFloat(index) * .cardDistance
            print("Index \(index): \(CGSize(width: offset, height: .zero))")
            return CGSize(width: offset, height: .zero)
        default:
            let lastShownIndex = getLastShownIndexFrom(currentIndex: currentIndex,
                                                       cardsShown: cardsShown)
            let offset = CGFloat(lastShownIndex) * .cardDistance
            print("Index \(index): \(CGSize(width: offset, height: .zero))")
            return CGSize(width: offset, height: .zero)
        }
    }
    
    
    static func shouldShowOffscreen(currentIndex: Int, itemIndex: Int) -> Bool {
        // If the index is lower than the current index it should move to the
        // left side of the screen so that it is invisible.
        itemIndex < currentIndex
    }
    
    
    static func getTheVisibleIndexRange(currentIndex: Int, cardsShown: Int) -> ClosedRange<Int> {
        let lastShownIndex = getLastShownIndexFrom(currentIndex: currentIndex, cardsShown: cardsShown) - 1
        return currentIndex...lastShownIndex
    }
    
    static func getLastShownIndexFrom(currentIndex: Int, cardsShown: Int) -> Int {
        currentIndex + cardsShown
    }
    
    
    static func getCardDraggingOffset<CardData: CardInformation>(dragInfo: DragInformation<CardData>) -> CGSize {
        guard
            dragInfo.items.indices.contains(dragInfo.currentIndex),
            dragInfo.items[dragInfo.currentIndex].id == dragInfo.item.id
            else { return .zero }
        return CGSize(width: -dragInfo.dragValue.x, height: 0)
    }
    
    
    static func getListOffset(currentIndex: Int) -> CGFloat {
        return CGFloat(currentIndex) * -.cardDistance
    }
        
    
    static func getCardScaleSize<CardData: CardInformation>(
        cardsShown: Int,
        currentIndex: Int,
        items: [CardData],
        item: CardData) -> CGSize {
                
        let index = items.firstIndex(where: { $0.id == item.id })
        guard let foundIndex = index else { return .zero }

        switch foundIndex {
        case getTheVisibleIndexRange(currentIndex: currentIndex, cardsShown: cardsShown):
            let indexDistance: CGFloat = CGFloat(foundIndex - currentIndex)
            let factor: CGFloat = (.cardDistance / 100) * indexDistance
            return CGSize(width: 1 - factor, height: 1 - factor)
        default:
            let smallestFactor: CGFloat = (.cardDistance / 100) * CGFloat(cardsShown)
            return CGSize(width: 1 - smallestFactor, height: 1 - smallestFactor)
        }
    }
    
}
