//
//  WebView.swift
//  H4X0R News
//
//  Created by Giuseppe Gioi on 24/03/2020.
//  Copyright © 2020 Giuseppe Gioi. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit // Need to use WebView

//MARK: - WebView
struct WebView: UIViewRepresentable { // A SwiftUI View which represents a UIKit View
    
    let urlString: String?
    
    // Needs these two Protocol Methods to works
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrlString = urlString {
            if let url = URL(string: safeUrlString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
