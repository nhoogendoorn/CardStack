//
//  CGFloat.swift
//  CardStack
//
//  Created by Niels Hoogendoorn on 08/02/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

#if !os(macOS)
import UIKit

extension CGFloat {
    static let screenWidth: CGFloat = UIScreen.main.bounds.width
    static let cardDistance: CGFloat = 15
}
#endif
