//
//  LoadingView.swift
//  GameDB
//
//  Created by Andika on 03/01/20.
//  Copyright © 2020 Andika. All rights reserved.
//

import SwiftUI
import UIKit

struct LoadingView: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<LoadingView>) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        return activityIndicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<LoadingView>) {
        uiView.startAnimating()
    }
}
