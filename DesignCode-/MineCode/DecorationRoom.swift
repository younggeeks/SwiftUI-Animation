//
//  DecorationRoom.swift
//  DesignCode-
//
//  Created by Samwel Charles on 09/04/2020.
//  Copyright © 2020 Samwel Charles. All rights reserved.
//

import SwiftUI

struct DecorationRoom: View {
    
    @State var show = false
    @State var cardLocation = CGSize.zero
    var body: some View {
        
        ZStack {
            VStack {
                
                if !show {
                    HeaderView()
                        .padding(.top, 40)
                        .transition(AnyTransition.move(edge: .top).animation(Animation.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0).delay(10)))
                    
                    
                }
                
                
                MenuCard(showInfo: $show)
                    .frame(maxHeight: show ? .infinity : 320)
                
                if !show {
                    SectionHeader()
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(recommendedData){ item in
                                RecommendedItemView(recItem: item)
                            }
                        }
                    }
                    .animation(Animation.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0).delay(0.3))
                    .offset(x: show ? -1000 : 0)
                    Spacer()
                }
            }
            .background(Color.white)
            
            
            ProductList(show: $show, cardLocation: $cardLocation)
            
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    
    
}


struct DecorationRoom_Previews: PreviewProvider {
    static var previews: some View {
        DecorationRoom()
    }
}

struct HeaderView: View {
    var body: some View {
        HStack(alignment: .center) {
            
            Image("sam")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width:60, height:60)
                .overlay(Circle().stroke(Color.black.opacity(0.4), lineWidth: 2))
            
            VStack(alignment: .leading) {
                Text("Decoration")
                    .font(.system(size: 30, weight: .bold))
                    .bold()
                
                Text("Room")
                    .font(.system(size:25, weight: .regular))
                
            }
            Spacer()
        }
        .foregroundColor(.black)
        .padding(.horizontal, 30)
    }
}

struct IconView: View {
    @Binding var show:Bool
    var icon:String
    var title:String
    var body: some View {
        VStack {
            VStack {
                Image(systemName: icon)
                    .font(.system(size:22, weight: .medium))
                    .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)).opacity(0.9))
            }
            .frame(width:55,height:55)
            .background(Color.white)
            .clipShape(Circle())
            
            Text(title)
                .font(.system(size: 13, weight: .regular))
                .foregroundColor(.white)
        }
        .animation(Animation.spring(response: 0.5, dampingFraction: 0.9, blendDuration: 0).delay(2))
        .onTapGesture {
            withAnimation{
                self.show.toggle()
            }
        }
        
        
    }
    
}


struct MenuItem : Identifiable {
    var id = UUID()
    var icon:String
    var title:String
}


let menuData = [
    MenuItem(icon: "paperclip.circle", title: "Office"),
    MenuItem(icon: "alarm", title: "Alarm"),
    MenuItem(icon: "camera.circle", title: "Pictures"),
    MenuItem(icon: "tag.circle", title: "Shopping"),
    MenuItem(icon: "book.circle", title: "Books")
]

struct MenuCard: View {
    @Binding var showInfo : Bool
    var body: some View {
        ZStack {
            VStack{
                if showInfo {
                    Button(action: {
                        self.showInfo = false
                    }){
                        HStack {
                            Image(systemName: "arrow.left")
                                .font(.system(size: 19, weight : .semibold))
                            Spacer()
                        }.padding(.leading, 30)
                            .padding(.bottom,10)
                            .padding(.top, showInfo ? 60 : 0)
                    }
                }
                else{
                    HStack(alignment: .center) {
                        VStack(alignment: .leading){
                            HStack(alignment: .top) {
                                Image(systemName: "cloud.sun.fill")
                                    .font(.system(size:22, weight:.bold))
                                
                                Text("32 C")
                                    .foregroundColor(Color.white.opacity(0.8))
                            }
                            Text("24")
                                .font(.system(size: 50, weight: .semibold))
                            Text("January")
                                .font(Font.headline.weight(.regular))
                        }
                        Spacer()
                    }
                    .padding(30)
                }
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(alignment: .center) {
                        ForEach(menuData){ (item : MenuItem) in
                            IconView(show: self.$showInfo, icon: item.icon, title: item.title)
                                .padding(.leading,20)
                            
                        }
                        
                        
                    }
                }
                .padding(.top ,  showInfo ? 10 : 0 )
                
                
                
                Spacer()
                
            }
            .foregroundColor(.white)
            .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .padding(.horizontal, showInfo ? 0 : 20)
            .shadow(color:Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3) , radius: 20, x: 0, y: 20)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            
            
            
            HStack{
                Spacer()
                Image("builder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:100)
            }
            .padding(.horizontal, 30)
            .offset(y: showInfo ? -820 : -150)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            
            
            
            
        }
        
        
    }
    
}

struct SectionHeader: View {
    var body: some View {
        HStack(alignment: .center) {
            Text("Recommended")
                .font(.system(size:16, weight: .semibold))
            
            
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 16, weight: .semibold))
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 30)
        .foregroundColor(.black)
    }
}

struct RecommendedItemView: View {
    var recItem : RecommendedItem
    var body: some View {
        
        VStack {
            Image(recItem.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:140)
            
        }
            
        .padding(20)
        .background(recItem.color)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: recItem.color.opacity(0.5), radius: 10, x: 0, y: 10)
        .padding(.bottom, 25)
        .padding(.leading,15)
    }
}


struct RecommendedItem : Identifiable {
    var id = UUID()
    var image: String
    var color: Color
}


let recommendedData = [
    RecommendedItem(image: "kiti", color: Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.7681708068, alpha: 0.6318496919))),
    RecommendedItem(image: "kabati", color: Color(#colorLiteral(red: 0.9568627477, green: 0.616927643, blue: 0.5450980663, alpha: 0.5905864877))),
    RecommendedItem(image: "kiti", color: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
]

struct Tabu: View {
    var body: some View {
        HStack {
            Image(systemName: "waveform.path.ecg")
                .font(.system(size: 25, weight: .regular))
                .foregroundColor( Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.7681708068, alpha: 0.6318496919)).opacity(0.4))
            Spacer()
            Image(systemName: "magnifyingglass")
                .font(.system(size: 25, weight: .regular))
                .foregroundColor(Color.black.opacity(0.2))
            Spacer()
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 30, weight: .regular))
                .foregroundColor(Color.black.opacity(0.4))
            Spacer()
            Image(systemName: "alarm")
                .font(.system(size: 25, weight: .regular))
                .foregroundColor(Color.black.opacity(0.2))
            Spacer()
            Image(systemName: "person")
                .font(.system(size: 25, weight: .regular))
                .foregroundColor(Color.black.opacity(0.2))
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .frame(height:55)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(color: Color.black.opacity(0.11), radius: 2, x: 0, y: 2)
        .padding(.horizontal,20)
    }
}

struct ProductList: View {
    @Binding var show : Bool
    @Binding var cardLocation: CGSize
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Rectangle()
                    .frame(width:40,height:5)
                    .background(Color.black)
                    .opacity(0.2)
                    .cornerRadius(3)
                    .padding(.vertical,10)
                    .gesture(
                        DragGesture()
                            .onChanged{ value in
                                self.cardLocation = value.translation
                        }.onEnded{_ in
                            if(self.cardLocation.height > 50){
                                self.cardLocation = .zero
                                self.show = false
                            }else{
                                self.cardLocation = .zero
                                self.show = true
                            }
                            
                        }
                )
                
                //                Spacer()
                
                ScrollView{
                    VStack{
                        ForEach(0..<5){ index in
                            ProductCard()
                        }
                    }
                    
                    
                }
                
                
                
                
                
                Spacer()
            }
            .padding(.top,14)
            .frame(maxWidth:.infinity)
            .frame(height:700)
            .background(Color.white.opacity(0.97))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .offset(x:0,y: show ? 0 : 1000)
            .offset(y: cardLocation.height)
            .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            
        }
    }
}

struct ProductCard: View {
    var body: some View {
        VStack{
            Image("kiti")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:100)
                .padding(.vertical, 10)
            
            Group {
                Text("Kiti cha kivivu")
                    .font(.system(size: 18, weight:.regular))
                    .foregroundColor(Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)))
                Text("Kama huna mpango wa kulala")
                    .font(.system(size:12, weight: .regular))
                    .foregroundColor(Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)).opacity(0.5))
                
                Text("Ksh 3,500")
                    .font(.headline)
                    .bold()
                    .padding()
                    .foregroundColor(Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)))
            }
            
            
            HStack(alignment: .center){
                Button(action: {
                    
                }) {
                    Text("Add To Cart")
                        .foregroundColor(Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)))
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    HStack {
                        Text("Buy Now")
                    }
                    .frame(width:100, height:50)
                    .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .foregroundColor(.white)
                }
            }
            .padding(.horizontal, 40)
            .padding(.top,30)
            
            
            
            
        }
        .padding()
        .frame(maxWidth:.infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(.horizontal, 20)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
    }
}
