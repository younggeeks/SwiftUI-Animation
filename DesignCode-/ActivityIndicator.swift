//
//  ActivityIndicator.swift
//  DesignCode-
//
//  Created by Samwel Charles on 03/04/2020.
//  Copyright © 2020 Samwel Charles. All rights reserved.
//

import Foundation
import SwiftUI

struct ActivityIndicator : UIViewRepresentable {
    @Binding var shouldAnimate:Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if self.shouldAnimate{
            uiView.startAnimating()
        }else{
            uiView.stopAnimating()
        }
    }
}
