//
//  SingleCardView.swift
//  Card
//
//  Created by Ryan Westhoelter on 9/9/24.
//

import SwiftUI

struct SingleCardView: View {
    @Binding var card: Card
    @State private var currentModal: ToolbarSelection?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            CardDetailView(card: $card)
                .modifier(CardToolbar(
                    currentModal: $currentModal,
                    card: $card))
            }
        }
    var content: some View {
        card.backgroundColor
        /*ZStack {
            Group{
                Capsule()
                    .foregroundColor(.yellow)
                    .resizableView()
                Text("Resize Me!")
                    .fontWeight(.bold)
                    .font(.system(size: 500))
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
            }
                .resizableView()
            
            Circle()
                .resizableView()
                .offset(CGSize(width: 50, height: 200))
        }*/
    }
    
    }

#Preview {
    SingleCardView(card: .constant(initialCards[0]))
}
