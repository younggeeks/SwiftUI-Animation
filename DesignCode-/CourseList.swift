//
//  CourseList.swift
//  DesignCode-
//
//  Created by Samwel Charles on 08/04/2020.
//  Copyright © 2020 Samwel Charles. All rights reserved.
//

import SwiftUI

struct CourseList: View {
   
    
    @State var courses = courseData
    @State var active = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30.0) {
                Text("Courses ")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                    .padding(.top, 30 )
                    .blur(radius:active ? 20: 0)
                ForEach(courses.indices, id : \.self) { index in
                    GeometryReader { geo in
                        CourseView(course: self.courses[index], active: self.$active, show: self.$courses[index].show)
                            .offset(y: self.courses[index].show  ? -geo.frame(in : .global).minY : 0)
                    }
                    .frame(height: 280)
                    .frame(maxWidth: self.courses[index].show   ? .infinity : screen.width - 60)
                    .zIndex(self.courses[index].show ? 1 : 0)
                }
                
            }
            .frame(width: screen.width)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        }
        .statusBar(hidden: active ? true : false)
        .animation(.linear)
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    var course : Course
    @Binding var active: Bool
    @Binding var show: Bool
    var body: some View {
        ZStack(alignment: .top) {
            
            VStack(alignment: .leading, spacing: 30.0) {
                Text("Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.")
                
                Text("About this Course")
                    .font(.title).bold()
                
                  Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
                
                  Text("ou learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions")
            }
            .padding(30)
            .frame(maxWidth : show ? .infinity : screen.width - 60, maxHeight : show ? .infinity : 280, alignment: .top )
            .offset(y: show ? 460 : 0)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .opacity(show ? 1 : 0)
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text(course.title)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        Text(course.subtitle)
                            .foregroundColor(Color.white.opacity(0.7))
                    }
                    Spacer()
                    ZStack {
                        Image(uiImage: course.logo)
                            .opacity(show ? 0 : 1)
                        
                        VStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .frame(width:36,height:36)
                        .background(Color.black)
                    .clipShape(Circle())
                        .opacity(show ? 1 : 0)
                    }
                    
                }
                Spacer()
                Image(uiImage: course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 140, alignment:.top)
                
                
            }
            .padding(.top, show ? 30 : 0)
            .padding( show ? 30 : 20)

                .frame(maxWidth : show ? .infinity : screen.width-60, maxHeight: show ? 460 : 280 )
            .background(Color(course.color))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color(course.color), radius: 20, x: 0, y: 20)
            .onTapGesture{
                self.show.toggle()
                self.active.toggle()
            }
           
        }
        .frame(height: show ? screen.height : 280)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
         .edgesIgnoringSafeArea(.all)
        
    }
}

struct Course : Identifiable {
    var id = UUID()
    var title : String
    var subtitle : String
    var image : UIImage
    var logo : UIImage
    var color: UIColor
    var show : Bool
}

var courseData = [
    Course(title: "Prototype Designs in SwiftUI", subtitle: "18 Sections", image: #imageLiteral(resourceName: "Background1"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), show: false),
    Course(title: "SwiftUI Advanced", subtitle: "20 Sections", image: #imageLiteral(resourceName: "Card3"), logo: #imageLiteral(resourceName: "Logo1"), color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), show: false),
    Course(title: "UI Design for Developers", subtitle: "20 Sections", image: #imageLiteral(resourceName: "Card4"), logo: #imageLiteral(resourceName: "Logo3"), color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), show: false)
]
 
