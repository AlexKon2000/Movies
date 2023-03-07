//
//  FeaturesScreen.swift
//  MyOtusApp
//
//  Created by Alex on 07.03.2023.
//

import SwiftUI

struct FeaturesScreen: View {
    
    @Binding var selection: Int
    @Binding var detailNumber: Int?

    var body: some View {
        Button {
            selection = 1
            detailNumber = 0
        } label: {
            Label("Click to see the best Movie!", systemImage: "play.rectangle.fill")
        }
    }
}
