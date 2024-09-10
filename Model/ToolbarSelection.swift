//
//  ToolbarSelection.swift
//  Card
//
//  Created by Ryan Westhoelter on 9/9/24.
//

import Foundation

enum ToolbarSelection: CaseIterable, Identifiable {
    var id: Int {
        hashValue
    }
    case photoModal, frameModal, stickerModal, textModal
}
