//
//  ContentView.swift
//  HackerNews
//
//  Created by Raghav Sharma on 29/07/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView{
            List(networkManager.posts){ post in
                NavigationLink(
                    destination: DetailView(postObject: post),
                    label: {
                        HStack{
                            Text(String(post.points))
                            Text(post.title)
                        }
                    })
            }
            .navigationTitle("Hacker News")
        }
        .onAppear(perform: {
            self.networkManager.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
