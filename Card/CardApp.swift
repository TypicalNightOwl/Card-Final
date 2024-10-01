//
//  CardApp.swift
//  Card
//
//  Created by Ryan Westhoelter on 9/9/24.
//

import SwiftUI

@main
struct CardApp: App {
    @StateObject var store = CardStore(defaultData: false)
    
    var body: some Scene {
        WindowGroup {
            AppLoadingView()
                .onAppear {
                    print(URL.documentsDirectory)
                }
                .environmentObject(store)
        }
    }
}

