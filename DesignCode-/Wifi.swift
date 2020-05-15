//
//  Wifi.swift
//  DesignCode-
//
//  Created by Samwel Charles on 03/04/2020.
//  Copyright © 2020 Samwel Charles. All rights reserved.
//

import SwiftUI

struct Wifi: View {
    @State var animate = true
    @State var cardPosition = CGSize.zero
    var body: some View {
        
        ZStack{
            Rectangle()
                .background(Color.black)
                .opacity(animate ? 0.2 : 0)
                .animation(.linear)
            
            VStack{
                Image("Background1-Dark")
                Spacer()
            }
            
            VStack{
                VStack{
                    Rectangle()
                        .background(Color.black)
                        .frame(width:40,height:5)
                        .opacity(0.1)
                        .padding(.bottom,30)
                        .padding(.top,10)
                    HStack{
                        Spacer()
                        Text("Wi-Fi Password")
                            .font(.title)
                            .fontWeight(.light)
                        Spacer()
                        Button(action: {
                            self.cardPosition = CGSize(width: 0, height: 550)
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(Color("gley"))
                        }
                        
                    }
                .padding()
                    
                }
                
                
                
                Image(systemName: "wifi")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:90)
                    .foregroundColor(Color("gley"))
                
                Text("Do you want to share the Wi-Fi password for samjunior with Sammwel's MacBook Pro ? ")
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                
                HStack{
                    ActivityIndicator(shouldAnimate: $animate)
                    Text("Sharing")
                        .font(.headline)
                }
                .padding(.bottom, 50)
            }
            .padding(.top)
            .frame(maxWidth:.infinity)
            .frame(height:400)
            .background(Color.white)
            .cornerRadius(20)
            .offset(x:0, y: cardPosition.height)
            .padding()
            .onTapGesture {
                self.cardPosition = .zero
                self.animate = false
            }
        .gesture(
            DragGesture()
                .onChanged{ value in
                    self.animate = true
                    self.cardPosition = value.translation
                    if value.translation.height < 300 {
                        self.cardPosition = CGSize(width: 0, height: 550)
                    }
                    if value.translation.height >  100 {
                        self.cardPosition = .zero
                        self.animate = true
                    }
            }.onEnded{ event in
//                self.cardPosition = .zero
//                self.animate = false
            }
            )
            .animation(.easeInOut(duration: 0.3))
            
            
        }.edgesIgnoringSafeArea(.vertical)
        
        
        
        
    }
}

struct Wifi_Previews: PreviewProvider {
    static var previews: some View {
        Wifi()
    }
}
