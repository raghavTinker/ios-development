//
//  WebView.swift
//  HackerNews
//
//  Created by Raghav Sharma on 29/07/21.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable{
    let post: Post
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = post.url{
            print(safeString)
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
        else{
            //Search the title on google
            let title: String = post.title.replacingOccurrences(of: " ", with: "+")
            let url = "https://www.google.com/search?q=\(title)"
            print(url)
            if let validUrl = URL(string: url){
                uiView.load(URLRequest(url: validUrl))
                print(validUrl)
            }
        }
    }
}
