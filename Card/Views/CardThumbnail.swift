//
//  CardThumbnail.swift
//  Card
//
//  Created by Ryan Westhoelter on 9/9/24.
//

import SwiftUI

struct CardThumbnail: View {
    let card: Card
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundColor(card.backgroundColor)
            .frame(
                width: Settings.thumbnailSize.width,
                height: Settings.thumbnailSize.height)
    }
}

#Preview {
    CardThumbnail(card: initialCards[0])
}
