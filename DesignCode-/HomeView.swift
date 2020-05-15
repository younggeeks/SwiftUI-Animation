//
//  HomeView.swift
//  DesignCode-
//
//  Created by Samwel Charles on 05/04/2020.
//  Copyright © 2020 Samwel Charles. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile:Bool
    @State var showUpdate = false
    @Binding var showContent: Bool
    var body: some View {
        
        ScrollView {
            VStack {
                HStack {
                    Text("Watching")
                                            .font(.system(size: 28, weight: .bold))
    //                    .modifier(CustomFontModifier(size: 40))
                    Spacer()
                    AvatarView(showProfile: $showProfile)
                    Button(action: {
                        self.showUpdate.toggle()
                    }) {
                        Image(systemName: "bell")
                            .renderingMode(.original)
                            .font(.system(size: 16, weight:.medium))
                            .frame(width:36,height:36)
                            .background(Color.white)
                            .clipShape(Circle())
                            .modifier(ShadowModifier())
                    }
                    .sheet(isPresented: $showUpdate){
                        UpdateList()
                    }
                    
                }
                .padding(.horizontal)
                .padding(.top,30)
                .padding(.leading, 14)
                
                
                ScrollView(.horizontal,showsIndicators: false) {
                    WatchRatingsView()
                        .padding(.horizontal,30)
                        .padding(.bottom,30)
                        .onTapGesture {
                            self.showContent.toggle()
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing:20) {
                        ForEach(sectionData)  { item in
                            GeometryReader { geometry in
                                SectionView(section: item)
                                    .rotation3DEffect(
                                        .degrees(Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x: 0, y: 10, z: 0))
                            }
                            .frame(width:275,height:275)
                        }
                    }
                    .padding(30)
                    .padding(.bottom, 30)
                }
                .offset(y: -30)
                
                HStack {
                    Text("Courses")
                        .font(.title)
                        .bold()
                    
                  
                    Spacer()
                }
                .padding(.leading,30)
                .offset(y: -60)
                  SectionView(width:screen.width-60 , height:275 , section: sectionData[2])
                .offset(y: -60)
                
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false), showContent: .constant(false))
    }
}

struct SectionView: View {
    var width : CGFloat = 275
    var height : CGFloat = 275
    
    var section:Section
    var body: some View {
        VStack {
            HStack(alignment:.top){
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width:160, alignment: .leading)
                    .foregroundColor(.white)
                
                Spacer()
                Image(section.logo)
            }
            
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:210)
        }
        .padding(.top,20)
        .padding(.horizontal, 20)
        .frame(width:width,height:height)
        .background(section.color)
        .cornerRadius(20)
        .shadow(color:section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}


struct Section : Identifiable {
    var id =  UUID()
    var title:String
    var text:String
    var logo:String
    var image:Image
    var color:Color
    
    
}


let sectionData = [
    Section( title: "Prototype designs in SwiftUI", text: "18 sections", logo: "Logo1", image: Image("Card1"), color: Color("card1")),
    Section( title: "Build a SwiftUI APP", text: "20 sections", logo: "Logo1", image: Image("Card2"), color: Color("card2")),
    Section( title: "SwiftUI Advanced", text: "21 sections", logo: "Logo1", image: Image("Card3"), color: Color("card3")),
    
]

struct WatchRatingsView: View {
    var body: some View {
        HStack(spacing:30) {
            HStack(alignment: .top, spacing: 12.0) {
                RingView(color1: Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)), color2: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)), width: 44, height: 44, percentage: 63, show: .constant(true))
                
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("6 Minutes left")
                        .bold()
                        .modifier(FontModifier(style: .subheadline))
                    
                    Text("Watched 10 minutes today")
                        .modifier(FontModifier(style: .caption))
                    
                }
                
                
                
                
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            
            HStack(alignment: .top, spacing: 12.0) {
                RingView(color1: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)), color2: Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)), width: 32, height: 32, percentage: 40, show: .constant(true))
                
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            
            HStack(alignment: .top, spacing: 12.0) {
                RingView(color1: Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)), color2: Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)), width: 32, height: 32, percentage: 40, show: .constant(true))
                
            }
            .padding(8)
            .background(Color.white)
            .cornerRadius(20)
            .modifier(ShadowModifier())
            
            
        }
    }
}
