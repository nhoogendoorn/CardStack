//
//  MainContainer.swift
//  CardStack
//
//  Created by Niels Hoogendoorn on 22/02/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct MainContainer<Content: Card, CardData: CardInformation>: View {
    var configuration: StackConfiguration?
    let items: [CardData]

    init(configuration: StackConfiguration? = nil, items: [CardData]) {
        self.configuration = configuration
        self.items = items
    }
    
    @available(OSX 10.15.0, *)
    var body: some View {
        CardStack<Content, CardData>(configuration: configuration)
            .animation(.default)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .environmentObject(CardNavigation(items: items))
    }
}
