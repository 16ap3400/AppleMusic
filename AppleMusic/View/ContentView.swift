//
//  ContentView.swift
//  AppleMusic
//
//  Created by Alex Peterson on 4/27/21.
//

import SwiftUI
import URLImage

struct ContentView: View {
    
    @ObservedObject var vm = AlbumViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach (0..<vm.albums.count, id: \.self) { i in
                    VStack{
                        Text("\(i+1) : \(vm.albums[i].name)")
                        URLImage(url: URL(string: vm.albums[i].artworkUrl100)!,
                                 content: { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                 })
                            .frame(width: 100, height: 100)
                    }
                    
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
