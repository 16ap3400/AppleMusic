//
//  ContentView.swift
//  AppleMusic
//
//  Created by Alex Peterson on 4/27/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm = RSSViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                List(vm.albums){ album in
                    HStack {
                        Text(album.name)
                    }
                }
            }
            
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
