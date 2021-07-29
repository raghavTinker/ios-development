//
//  DetailView.swift
//  HackerNews
//
//  Created by Raghav Sharma on 29/07/21.
//

import SwiftUI
import WebKit

struct DetailView: View {
    let postObject: Post
    var body: some View {
        WebView(post: postObject)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(postObject: Post(objectID: "1", points: 12, title: "test", url: "https://www.google.com"))
    }
}
