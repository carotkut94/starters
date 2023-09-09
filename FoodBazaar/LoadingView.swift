//
//  LoadingView.swift
//  FoodBazaar
//
//  Created by Deathcode on 09/09/23.
//

import Foundation
import SwiftUI

struct ActivityIndicator : UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.brandPriamry
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}

struct LoadingView : View {
    var body: some View{
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            ProgressView("Loading...")
                .progressViewStyle(CircularProgressViewStyle(tint: .brandPriamry))
                .scaleEffect(2)
        }
    }
}
