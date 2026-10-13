//
//  Deprecated.swift
//  CardStack
//
//  Created by Niels Hoogendoorn on 14/03/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import SwiftUI

/// The data shown on a card.
@available(*, deprecated, message: "Any Identifiable type works now. Use CardStackView(_:configuration:content:).")
public protocol CardData: Identifiable {
    var id: String { get }
}

/// A view that shows a single card.
@available(*, deprecated, message: "Pass a view builder to CardStackView(_:configuration:content:) instead.")
public protocol CardView: View {
    init<Data: CardData>(data: Data)
}

extension CardStackView {
    @available(*, deprecated, message: "Use CardStackView(_:configuration:content:) instead.")
    public init(configuration: StackConfiguration? = nil, items: [Item]) where Content: CardView, Item: CardData {
        self.init(items, configuration: configuration ?? StackConfiguration()) { item in
            Content(data: item)
        }
    }
}
