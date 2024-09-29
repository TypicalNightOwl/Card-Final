//
//  CardListView.swift
//  Card
//
//  Created by Ryan Westhoelter on 9/9/24.
//

import SwiftUI

struct CardListView: View {
    @State private var selectedCard: Card?
    @EnvironmentObject var store: CardStore
    
    var body: some View {
        list
            .fullScreenCover(item: $selectedCard) { card in
                if let index = store.index(for: card) {
                    SingleCardView(card: $store.cards[index])
                } else {
                    fatalError("Unable to locate selected card")
                }
            }
    }
    
    var list: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(store.cards) { card in
                    CardThumbnail(card: card)
                        .contextMenu {
                            Button(role: .destructive) {
                                store.remove(card)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        .onTapGesture {
                            selectedCard = card
                        }
                }
            }
        }
    }
}


#Preview {
    CardListView()
        .environmentObject(CardStore(defaultData: true))
    
}
