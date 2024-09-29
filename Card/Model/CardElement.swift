//
//  CardElement.swift
//  Card
//
//  Created by Ryan Westhoelter on 9/9/24.
//

import SwiftUI

protocol CardElement{
    var id: UUID { get }
    var transform: Transform { get set }
}

struct ImageElement: CardElement {
    let id = UUID()
    var transform = Transform()
    var image: Image {
        Image(uiImage: uiImage ??
              UIImage(named: "error-image") ??
        UIImage())
    }
    var uiImage: UIImage?
}

struct TextElement: CardElement {
    let id = UUID()
    var transform = Transform()
    var text = ""
    var textColor = Color.black
    var textFont = "Gill Sans"
}

extension CardElement {
    func index(in array: [CardElement]) -> Int? {
        array.firstIndex {$0.id == id}
    }
}
