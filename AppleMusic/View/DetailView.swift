//
//  DetailView.swift
//  AppleMusic
//
//  Created by Alex Peterson on 5/7/21.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.Google.com")
    }
}
