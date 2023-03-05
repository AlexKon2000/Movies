//
//  ContentView.swift
//  MyOtusApp
//
//  Created by Alex on 05.03.2023.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        TabView {
            FeaturesScreen()
                .tabItem {
                    Label("Features", systemImage: "play.rectangle.fill")
                }.tag(0)
            ListScreen(viewModel: viewModel)
                .tabItem {
                    Label("List", systemImage: "play.rectangle.fill")
                }.tag(1)
            SettingsScreen()
                .tabItem {
                    Label("Features", systemImage: "play.rectangle.fill")
                }.tag(2)
        }
    }
}

struct FeaturesScreen: View {
    var body: some View {
        Button {
            print("Tap")
        } label: {
            Label("Tap me", systemImage: "play.rectangle.fill")
        }
    }
}

struct ListScreen: View {



    
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        NavigationView {
            List(viewModel.top250List) { item in
                NavigationLink {
                    ListItem(item: item)
                } label: {
                    ListItem(item: item)
                }

            }
            .navigationTitle(Text("Top 250 IMDB Movies"))
            .onAppear {
                loadData()
            }
            .refreshable {
                loadData()
            }
        }
    }

    private func loadData() {
        viewModel.fetch250list()
    }
}

struct ListItem: View {

    let item: Top250DataDetail

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: item.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color.gray
            }
            .frame(width: 64, height: 88)
            .clipShape(RoundedRectangle(cornerRadius: 5))

            Text(item.title)
        }
    }
}

struct SettingsScreen: View {
    var body: some View {
        Button {
            print("Tap")
        } label: {
            Label("Tap me", systemImage: "play.rectangle.fill")
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
