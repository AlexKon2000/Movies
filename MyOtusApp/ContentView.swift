//
//  ContentView.swift
//  MyOtusApp
//
//  Created by Alex on 05.03.2023.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel: ViewModel

    @State var selection = 0
    @State var detailNumber: Int? = nil

    var body: some View {
        TabView(selection: $selection) {
            FeaturesScreen(
                selection: $selection,
                detailNumber: $detailNumber
            ).tabItem {
                Label("Features", systemImage: "heart.text.square.fill")
            }.tag(0)

            ListScreen(
                viewModel: viewModel,
                detailNumber: $detailNumber
            ).tabItem {
                Label("List", systemImage: "play.rectangle.fill")
            }.tag(1)

            SettingsScreen()
                .tabItem {
                    Label("Features", systemImage: "gear")
                }.tag(2)
        }
    }
}
