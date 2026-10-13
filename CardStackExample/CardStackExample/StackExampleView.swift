//
//  StackExampleView.swift
//  CardStackExample
//
//  Created by Niels Hoogendoorn on 15/03/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import SwiftUI
import CardStack

struct StackExampleView: View {
    private let items = [Color.red, .blue, .yellow, .green, .orange].map { DataExample(color: $0) }

    var body: some View {
        CardStackView(items) { item in
            CardExampleView(data: item)
        }
    }
}

#Preview {
    StackExampleView()
}
