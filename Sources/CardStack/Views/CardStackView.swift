//
//  CardStackView.swift
//  CardStack
//
//  Created by Niels Hoogendoorn on 08/02/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public struct CardStackView<Content: CardView, Data: CardData>: View {
    var configuration: StackConfiguration?
    let items: [Data]

    public init(configuration: StackConfiguration? = nil, items: [Data]) {
        self.configuration = configuration
        self.items = items
    }
    
    public var body: some View {
        CardStackMainView<Content, Data>(configuration: configuration)
            .animation(.default)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .environmentObject(CardNavigation(items: items,
                                              startIndex: configuration?.startIndex ?? 0))
    }
}
