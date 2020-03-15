//
//  MockCardData.swift
//  TestTests
//
//  Created by Niels Hoogendoorn on 13/03/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import Foundation
@testable import CardStack

struct MockCardInformation: CardInformation {
    var id: String = UUID().uuidString
}

class MockCardData {
    static let items: [MockCardInformation] = [MockCardInformation(),
                                               MockCardInformation(),
                                               MockCardInformation(),
                                               MockCardInformation(),
                                               MockCardInformation()]
}
