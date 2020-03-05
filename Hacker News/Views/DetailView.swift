//
//  DetailView.swift
//  Hacker News
//
//  Created by Itay Garbash on 21/01/2020.
//  Copyright © 2020 Lazy Bear Apps. All rights reserved.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    var url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}

struct WebView: UIViewRepresentable {
    
    var urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
}

//TODO
// pass url as string? //
//provide value in detailview_preview //
//create navlink in original view //
//import webkit //
//create webview struct: UIViewRepresentable //
//pass urlString as String? //
//conform to all protocols (makeuiview, updateuiview) //
//1 - WKWebView() //
//2- if let, if let, URLRequest, UIView.load(request) //
//move to WebView.swift
