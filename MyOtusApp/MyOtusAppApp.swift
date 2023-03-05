//
//  MyOtusAppApp.swift
//  MyOtusApp
//
//  Created by Alex on 05.03.2023.
//

import SwiftUI

@main
struct MyOtusAppApp: App {

    let viewModel = ViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
