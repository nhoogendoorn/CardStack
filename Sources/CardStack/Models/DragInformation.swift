//
//  DragInformation.swift
//  CardStack
//
//  Created by Niels Hoogendoorn on 08/02/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import SwiftUI

struct DragInformation<Data: CardData> {
    let currentIndex: Int
    let items: [Data]
    let item: Data
    let dragValue: CGPoint
}
