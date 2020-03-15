//
//  CardView.swift
//  CardStack
//
//  Created by Niels Hoogendoorn on 08/02/2020.
//  Copyright © 2020 Nihoo. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct CardView<Content: Card, CardData: CardInformation>: View {
    @EnvironmentObject var navigation: CardNavigation<CardData>
    let info: CardData
    let configuration: StackConfiguration
    
    @State var didAppear: Bool = false
    @State var isActive: Bool = false
    @State var originalItemSize: CGSize = .zero
    
    var itemSize: CGSize {
        getItemSize(geoSize: originalItemSize)
    }
    @Binding var dragValue: CGPoint
    
    init(info: CardData, configuration: StackConfiguration, dragValue: Binding<CGPoint>) {
        self.info = info
        self.configuration = configuration
        self._dragValue = dragValue
    }
    
    var body: some View {
        ZStack {
            Content(data: info)
                .background(GeometryReader { geo in
                    Color.clear
                        .onAppear {
                            self.originalItemSize = geo.size
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity))
                
                // Add animation to show correct scrolling speed.
                .scaleEffect(getScaleSize())
                .animation(.easeInOut(duration: didAppear ? 0.3 : .zero))
                
                // Base offset should always be set first, otherwise the
                // dragging offset will give an incorrect value.
                .offset(getCardBaseOffset())
                .offset(getCardDraggingOffset())
                .onAppear {
                    self.didAppear = true
            }
            .onTapGesture {
                self.isActive.toggle()
            }
        }
        .frame(width: itemSize.width, height: itemSize.height)
    }
    
    func getScaleSize() -> CGSize {
        CardViewHelper.getCardScaleSize(cardsShown: configuration.numberOfCardsShown,
                                         currentIndex: navigation.currentIndex,
                                         items: navigation.items,
                                         item: info)
    }
    
    func getItemSize(geoSize: CGSize) -> CGSize {
        let size = CardViewHelper.getCardSize(cardSize: geoSize,
                                    cardsShown: configuration.numberOfCardsShown,
                                    currentIndex: navigation.currentIndex,
                                    items: navigation.items,
                                    item: info)
        print("xxx SIZE: \(size)")
        return size
    }
    
    func getCardBaseOffset() -> CGSize {
        CardViewHelper.getCardBaseOffset(cardSize: itemSize,
                                               cardsShown: configuration.numberOfCardsShown,
                                               currentIndex: navigation.currentIndex,
                                               items: navigation.items,
                                               currentItem: info)
    }
    
    func getCardDraggingOffset() -> CGSize {
        let dragInfo = DragInformation(currentIndex: navigation.currentIndex,
                                       items: navigation.items,
                                       item: info,
                                       dragValue: dragValue)
        return CardViewHelper.getCardDraggingOffset(dragInfo: dragInfo)
    }
}
