//
//  BottomToolbar.swift
//  Card
//
//  Created by Ryan Westhoelter on 9/9/24.
//

import SwiftUI

struct ToolbarButton: View {
    let modal: ToolbarSelection
    private let modalButton: [
        ToolbarSelection: (text: String, imageName: String)
    ] = [
        .photoModal: ("Photos", "photo"),
        .frameModal: ("Frames", "square.on.circle"),
        .stickerModal: ("Stickers", "heart.circle"),
        .textModal: ("Text", "textformat")
    ]
    
    var body: some View {
        if let text = modalButton[modal]?.text,
           let imageName = modalButton[modal]?.imageName {
            VStack {
                Image(systemName: imageName)
                    .font(.largeTitle)
                Text("Stickers")
            }
            .padding(.top)
        }
    }
}

struct BottomToolbar: View {
    @Binding var modal: ToolbarSelection?
    
    var body: some View {
        HStack{
            ForEach(ToolbarSelection.allCases) {selection in
                Button{
                    modal = .stickerModal
                } label: {
                    ToolbarButton(modal: selection)
                }
            }
        }
    }
}

#Preview {
    BottomToolbar(modal: .constant(.stickerModal))
        .padding()
}
