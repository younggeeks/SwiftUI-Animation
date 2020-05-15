//
//  Ramotion.swift
//  DesignCode-
//
//  Created by Samwel Charles on 05/04/2020.
//  Copyright © 2020 Samwel Charles. All rights reserved.
//

import SwiftUI

struct Ramotion: View {
    var body: some View {
        VStack {
            HStack {
                Text("Hello, Sam!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Spacer()
                Image("sam")
                    .resizable()
                    .frame(width:40,height:40)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.gray)
                )
            }
            .padding(.leading)
            
            
            HStack {
                Text("Your Progress")
                    .font(.headline)
                Spacer()
            }.padding()
            
            
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(cards){ card in
                        GeometryReader { geo in
                            
                            
                            CardZ(item: card)
                                .padding(.leading, 16)
                                .offset(y: geo.frame(in: .global).minX / 23)
                            
                            
                        }
                        .frame(width:170, height:260)
                        
                    }
                }
                .padding(.bottom, 50)
            }
            
            CalendarView()
                .padding(.bottom, 20)
            
            
            ScrollView{
                ForEach(0..<5){ value in
                    
                         CalendarCard()
                            .padding(.bottom,20)
                    
                   
                }
            }
           
            
           
            
            
            
            Spacer()
        }
    }
}

struct Ramotion_Previews: PreviewProvider {
    static var previews: some View {
        Ramotion()
    }
}

struct CardZ: View {
    var item : CardInfo
    var body: some View {
        VStack {
            HStack {
                ZStack{
                    Circle()
                        .trim(from: 0.0, to: CGFloat(item.progressValue))
                        .stroke(item.secondaryColor, lineWidth: 7)
                        .frame(width:70,height:70)
                        .rotationEffect(.degrees(-90))
                    Text(item.progress)
                        .font(.system(size: 14))
                        .foregroundColor(item.secondaryColor)
                    
                }
                
                
                Spacer()
            }
            Spacer()
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.system(size: 23, weight: .medium))
                    .padding(.bottom, 9)
                    .multilineTextAlignment(.leading)
                
                Text(item.description)
                    .font(.callout)
            }
            .foregroundColor(item.secondaryColor)
            .padding(.top, 15)
            
        }
        .padding( 20)
        .frame(width:170, height:260)
        .background(item.primaryColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color:item.primaryColor.opacity(0.4), radius: 20, x: 20, y: 20)
        
    }
}


struct CardInfo : Identifiable {
    var id = UUID()
    var progress : String
    var title : String
    var description: String
    var primaryColor: Color
    var secondaryColor: Color
    var progressValue:Double = 0.7
}


let cards = [
    
    CardInfo(progress: "17/89", title: "Master Algorithm", description: "Learn, practice and master algorithms", primaryColor: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)), secondaryColor: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))),
    CardInfo(progress: "83/89", title: "Start SwiftUI 2", description: "Get started with Rapid Prototyping", primaryColor: Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)), secondaryColor: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), progressValue: 0.9),
    CardInfo(progress: "12/89", title: "Learning Python3", description: "Learn to Build Trading Bot and make money ", primaryColor: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), secondaryColor: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), progressValue: 0.47),    CardInfo(progress: "17/89", title: "Coding Interview mastery", description: "Crush coding interview", primaryColor: Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)), secondaryColor: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
]

struct CalendarView: View {
    var body: some View {
        HStack{
            Text("Wednesday, March 7")
                .font(.system(size: 23, weight: .semibold))
            Spacer()
            Image(systemName: "calendar")
                .font(.system(size: 20, weight: .bold))
                .padding(13)
                .background(Color(#colorLiteral(red: 0.8979931474, green: 0.8981438279, blue: 0.897973299, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius:10))
            
        }
        .padding(.horizontal)
    }
}

struct CalendarCard: View {
    var body: some View {
        HStack(alignment:.top){
            Text("10:00AM")
                .font(.system(size: 14, weight: .semibold))
                .padding(.trailing, 20)
            Spacer()
            VStack(alignment: .leading){
                Text("Meeting with frontend developers")
                    .font(.system(size: 17, weight: .semibold))
                    .padding(.bottom, 10)
                    .foregroundColor(Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)))
                Text("New Investor Meeting")
                    .foregroundColor(Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)))
                    .padding(.bottom, 20)
                
                HStack {
                    HStack {
                        Image("sam")
                            .resizable()
                            .frame(width:30,height:30)
                            .clipShape(Circle())
                        
                        Image("Avatar")
                            .resizable()
                            .frame(width:30,height:30)
                            .clipShape(Circle())
                            .offset(x:-15)
                        
                        Image("sam")
                            .resizable()
                            .frame(width:30,height:30)
                            .clipShape(Circle())
                            .offset(x:-35)
                    }
                    
                    Spacer()
                    Text("9:30 AM - 10:00 AM")
                        .font(.caption)
                        .foregroundColor(Color(#colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)))
                    
                }
            }
            .padding(10)
            .background(Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)).opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
            
        .padding(.horizontal)
    }
}
