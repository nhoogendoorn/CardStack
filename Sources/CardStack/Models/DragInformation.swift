//
//  DragInformation.swift
//  CardStack
//
//  Created by Niels Hoogendoorn on 08/02/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import SwiftUI

struct DragInformation<CardData: CardInformation> {
    let currentIndex: Int
    let items: [CardData]
    let item: CardData
    let dragValue: CGPoint
}
