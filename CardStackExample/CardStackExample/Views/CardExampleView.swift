//
//  CardExampleView.swift
//  CardStackExample
//
//  Created by Niels Hoogendoorn on 15/03/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import SwiftUI
import CardStack

struct CardExampleView: CardView {
    var data: DataExample?
    
    init<CardData>(data: CardData) where CardData: CardData {
        if let infoData = data as? DataExample {
            self.data = infoData
        }
    }
    
    var body: some View {
        data?.color
            .frame(width: 200, height: 200)
            .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 0)
            .cornerRadius(8)
    }
}

struct CardExampleView_Previews: PreviewProvider {
    static var previews: some View {
        CardExampleView(data: DataExample(id: UUID().uuidString, color: .red))
    }
}
