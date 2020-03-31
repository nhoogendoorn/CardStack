//
//  CardData.swift
//  CardStack
//
//  Created by Niels Hoogendoorn on 14/03/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import SwiftUI

public protocol CardData: Identifiable {
    var id: String { get }
}
