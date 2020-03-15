//
//  CardStack.swift
//  CardStack
//
//  Created by Niels Hoogendoorn on 08/02/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public struct CardStack<Content: Card, CardData: CardInformation>: View {
    var configuration: StackConfiguration?
    let items: [CardData]

    public init(configuration: StackConfiguration? = nil, items: [CardData]) {
        self.configuration = configuration
        self.items = items
    }
    
    @available(OSX 10.15.0, *)
    public var body: some View {
        CardStackMainView<Content, CardData>(configuration: configuration)
            .animation(.default)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .environmentObject(CardNavigation(items: items))
    }
}
