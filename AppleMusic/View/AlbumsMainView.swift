//
//  ContentView.swift
//  AppleMusic
//
//  Created by Alex Peterson on 4/27/21.
//

import SwiftUI

struct AlbumsMainView: View {
    
    @ObservedObject private var vm = AlbumViewModel()
    
    let wid = UIScreen.main.bounds.width * 0.4
    @State var showFavorites: Bool = false
    
    private var gridItems: [GridItem] = [
        GridItem(.fixed(UIScreen.main.bounds.width * 0.4), spacing: UIScreen.main.bounds.width * 0.05),
        GridItem(.fixed(UIScreen.main.bounds.width * 0.4), spacing: UIScreen.main.bounds.width * 0.05)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Toggle(isOn: $showFavorites, label: {
                        Text(showFavorites ? "Favorites" : "All")
                    })
                }
                .padding()
                LazyVGrid (columns: gridItems,
                           alignment: .center,
                           spacing: 20,
                           pinnedViews: [.sectionHeaders, .sectionFooters]
                ) {
                    ForEach (0..<(vm.albums.count), id: \.self) { i in
                        if showFavorites {
                            if vm.albums[i].isFavorited {
                                NavigationLink(
                                    destination: DetailView(url: vm.albums[i].url),
                                    label: {
                                        SingleAlbumView(viewmodel: vm, index: i)
                                        .frame(width: 150)
                                        .accessibilityIdentifier("item\(i)")
                                    })
                            }
                        } else {
                            NavigationLink(
                                destination: DetailView(url: vm.albums[i].url),
                                label: {
                                    SingleAlbumView(viewmodel: vm, index: i)
                                    .frame(width: 150)
                                    .accessibilityIdentifier("item\(i)")
                                })
                        }
                    }
                    
                        
                }
                    .accessibilityIdentifier("albumGrid")
            }
            .navigationBarTitle("Top 25 Albums")

        }
        .onAppear(perform: {
//            vm.handleOnAppear()
            vm.handleTestDataOnAppear()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumsMainView()
    }
}
