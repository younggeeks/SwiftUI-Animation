//
//  TabBar.swift
//  DesignCode-
//
//  Created by Samwel Charles on 06/04/2020.
//  Copyright © 2020 Samwel Charles. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home()
                .tabItem{
                    Image(systemName: "play.circle.fill")
                    Text("Home")
            }
            ContentView()
                .tabItem{
                    Image(systemName: "rectangle.stack.fill")
                    Text("Certificates")
            }
            
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
        .previewDevice("iPhone 8")
    }
}
