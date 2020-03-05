//
//  ContentView.swift
//  Hacker News
//
//  Created by Itay Garbash on 21/01/2020.
//  Copyright © 2020 Lazy Bear Apps. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView{
            List(networkManager.posts) { post in
                
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                            .foregroundColor(.orange)
                            .bold()
                        Text(post.title)
                    }
                }
                
            }
        .navigationBarTitle("News")
      }
        .onAppear {
            self.networkManager.getFrontNews()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
