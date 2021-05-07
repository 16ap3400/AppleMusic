//
//  ContentView.swift
//  AppleMusic
//
//  Created by Alex Peterson on 4/27/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm = AlbumViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach (0..<vm.albums.count, id: \.self) { i in
                    Text("\(i) : \(vm.albums[i].name)")
                }
            }
            .navigationBarTitle("Top 25 Albums")
            
        }
        .onAppear(perform: {
            vm.fetchTopAlbums()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
