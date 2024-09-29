//
//  Transform.swift
//  Card
//
//  Created by Ryan Westhoelter on 9/9/24.
//

import SwiftUI

struct Transform {
    var size = CGSize(
        width: Settings.defaultElementSize.width,
        height: Settings.defaultElementSize.height)
    var rotation: Angle = .zero
    var offset: CGSize = .zero 
}
