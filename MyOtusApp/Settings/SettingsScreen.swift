//
//  SettingsScreen.swift
//  MyOtusApp
//
//  Created by Alex on 07.03.2023.
//

import SwiftUI

struct SettingsScreen: View {

    @State var isPresented = false
    
    var body: some View {
        Button {
            isPresented.toggle()
        } label: {
            Label("About", systemImage: "person.fill.questionmark")
        }
        .buttonStyle(.borderedProminent)
        .sheet(isPresented: $isPresented) {
            Text("😉")
                .font(.system(size: 256))
            Text("Created by: Aleksey Kondratev ©")
        }
    }
}

