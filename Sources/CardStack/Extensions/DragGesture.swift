//
//  DragGesture.swift
//  CardStack
//
//  Created by Niels Hoogendoorn on 08/02/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
extension DragGesture.Value {
    func getSwipeDirection(minimumDistance: CGFloat = .zero) -> HorizontalDirection {
        if isSwipingForward(minimumDistance: minimumDistance) {
            return .forward
        } else if isSwipingBackward(minimumDistance: minimumDistance) {
            return .backward
        } else {
            return .none
        }
    }
    
    func isSwipingForward(minimumDistance: CGFloat = .zero) -> Bool {
        let distance = self.startLocation.x - self.location.x
        return distance > minimumDistance
    }
    
    func isSwipingBackward(minimumDistance: CGFloat = .zero) -> Bool {
        let distance = self.location.x - self.startLocation.x
        return distance > minimumDistance
    }
    
    func horizontalDistance() -> CGFloat {
        return self.startLocation.x - self.location.x
    }
}
