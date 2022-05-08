//
//  NewsController.swift
//  GymCore
//
//  Created by Teodor Radu on 08.05.2022.
//

import Foundation
import UIKit
import WebKit

class NewsController: UIViewController, WKNavigationDelegate {
    
    let webView = WKWebView()
    var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.addSubview(webView)
        
        guard let url = URL(string: "https://www.puregym.com/blog/") else {
            return
        }
        webView.load(URLRequest(url:url))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }

  

    
}


