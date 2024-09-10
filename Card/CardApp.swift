//
//  CardApp.swift
//  Card
//
//  Created by Ryan Westhoelter on 9/9/24.
//

import SwiftUI

@main
struct CardApp: App {
    @StateObject var store = CardStore(defaultData: true)
    
    var body: some Scene {
        WindowGroup {
            CardListView()
                .environmentObject(store)
        }
    }
}
