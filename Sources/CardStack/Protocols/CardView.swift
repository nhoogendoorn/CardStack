//
//  Card.swift
//  CardStack
//
//  Created by Niels Hoogendoorn on 14/03/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import SwiftUI

public protocol CardView: View {
    init<Data: CardData>(data: Data)
}
