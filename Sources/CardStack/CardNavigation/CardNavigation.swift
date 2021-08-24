//
//  CardNavigation.swift
//  CardStack
//
//  Created by Niels Hoogendoorn on 08/02/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import Foundation

open class CardNavigation<Data: CardData>: ObservableObject {
    @Published var currentIndex: Int = .zero
    @Published var items: [Data] = []
    
    var reversedList: [Data] {
        items.reversed()
    }

    init(items: [Data], startIndex: Int) {
        guard items.indices.contains(startIndex) else {
            assertionFailure("Start index out of bounds")
            return
        }
        self.items = items
        self.currentIndex = startIndex
    }
    
    func move(_ direction: HorizontalDirection) {
        let allowedToMove = NavigationHelper.allowedToMove(direction: direction,
                                                           items: items,
                                                           currentIndex: currentIndex)
        guard allowedToMove else { return }
        switch direction {
        case .forward:
            currentIndex += 1
        case .backward:
            currentIndex -= 1
        case .none:
            break
        }
    }
}
