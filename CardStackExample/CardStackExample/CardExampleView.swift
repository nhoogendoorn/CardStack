//
//  CardExampleView.swift
//  CardStackExample
//
//  Created by Niels Hoogendoorn on 15/03/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import SwiftUI

struct CardExampleView: View {
    let data: DataExample

    var body: some View {
        data.color
            .frame(width: 200, height: 200)
            .clipShape(.rect(cornerRadius: 8))
            .shadow(color: .black.opacity(0.1), radius: 3)
    }
}

#Preview {
    CardExampleView(data: DataExample(color: .red))
}
