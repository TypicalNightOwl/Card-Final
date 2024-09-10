//
//  ColorExtensions.swift
//  Card
//
//  Created by Ryan Westhoelter on 9/9/24.
//

import SwiftUI

extension Color {
    static func random() -> Color {
        colors.randomElement() ?? .black
    }
    static let colors: [Color] = [
        .green, .red, .blue, .gray, .yellow, .pink, .orange, .purple
    ]
}
