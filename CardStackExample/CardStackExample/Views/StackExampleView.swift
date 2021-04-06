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
    let items: [DataExample] = [DataExample(id: UUID().uuidString, color: .red),
                 DataExample(id: UUID().uuidString, color: .blue),
                 DataExample(id: UUID().uuidString, color: .yellow),
                 DataExample(id: UUID().uuidString, color: .green),
                 DataExample(id: UUID().uuidString, color: .orange)
    ]
    
    let configuration = StackConfiguration()
    
    var body: some View {
        CardStackView<CardExampleView, DataExample>(configuration: configuration, items: items)
    }
}

struct StackExampleView_Previews: PreviewProvider {
    static var previews: some View {
        StackExampleView()
    }
}
