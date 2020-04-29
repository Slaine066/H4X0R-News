//
//  ContentView.swift
//  H4X0R News
//
//  Created by Giuseppe Gioi on 22/03/2020.
//  Copyright © 2020 Giuseppe Gioi. All rights reserved.
//

import SwiftUI

//MARK: - View
struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager() // This is the ObservedObject (the ObservedObject must be Observable)
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text("\(post.points)")
                        Text(post.title)
                    }
                }
                
            } // SwiftUI List is like the UIKit TableView
                .navigationBarTitle("H4X0R News")
        }
            .onAppear { // SwiftUI onAppear() is like the UIKit viewDidLoad()
                self.networkManager.fetchData() // Executed when the body property appear on the screen
        }
    }
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
