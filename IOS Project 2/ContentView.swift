//
//  ContentView.swift
//  IOS Project 2
//
//  Created by Student on 4/28/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(DataManager.self) private var dataManager: DataManager
    var body: some View {
        VStack {
            Text("placeholder")
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(DataManager())
}
