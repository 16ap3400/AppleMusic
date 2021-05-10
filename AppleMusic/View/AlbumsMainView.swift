//
//  ContentView.swift
//  AppleMusic
//
//  Created by Alex Peterson on 4/27/21.
//

import SwiftUI
import URLImage

struct AlbumsMainView: View {
    
    @ObservedObject private var vm = AlbumViewModel()
    
    private var gridItems: [GridItem] = [
        GridItem(.fixed(150), spacing: 30),
        GridItem(.fixed(150), spacing: 30)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid (columns: gridItems,
                           alignment: .center,
                           spacing: 20,
                           pinnedViews: [.sectionHeaders, .sectionFooters]
                ) {
                    ForEach (0..<(vm.albums.count>0 ? 25 : 0), id: \.self) { i in
                        NavigationLink(
                            destination: DetailView(url: vm.albums[i].url),
                            label: {
                                VStack{
                                    URLImage(url: URL(string: vm.albums[i].artworkUrl100)!,
                                             content: { image in
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .cornerRadius(10)
                                             })
                                        .frame(width: 150, height: 150)
                                    HStack {
                                        Text("\(i+1)")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                            
                                        VStack(alignment: .leading){
                                            Text("\(vm.albums[i].name)")
                                                .lineLimit(1)
                                                .font(.system(size: 16, weight: .regular, design: .rounded))
                                                .foregroundColor(.black)
                                            HStack {
                                                Text("\(vm.albums[i].artistName)")
                                                    .lineLimit(1)
                                                    .font(.system(size: 14, weight: .light, design: .rounded))
                                                    .foregroundColor(.gray)
                                                Spacer()
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        
                                    }
                                    
                                    
                                }
                                .frame(width: 150)
                                .accessibilityIdentifier("item\(i)")
                            })
                    }
                }
                    .accessibilityIdentifier("albumGrid")
            }
            .navigationBarTitle("Top 100 Albums")

        }
        .onAppear(perform: {
            vm.handleOnAppear()
//            vm.handleTestDataOnAppear()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumsMainView()
    }
}
