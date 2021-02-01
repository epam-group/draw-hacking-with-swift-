//
//  buttonDrawLabel.swift
//  draw
//
//  Created by Максим on 24.01.2021.
//

import SwiftUI

struct buttonDrawLabel: View {
    var body: some View {
        NavigationView{
        VStack{
            colorcircles()
            HStack{
            NavigationLink(destination: ContentView()){
                Text("Content View")
            }.frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
            .background(Color.white)
            .font(.title)
            NavigationLink(destination: shapeEditView()){
                Text("ShapeEditView")
            }.classicBigButton()
            }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    }
}

struct buttonDrawLabel_Previews: PreviewProvider {
    static var previews: some View {
        buttonDrawLabel()
    }
}
struct colorcircles: View {
    @State private var amount: CGFloat = CGFloat.random(in: 0...15)
    var body: some View {
        ZStack{
        Image("keqing")
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .saturation(1 + Double(amount))
            .blur(radius: (amount))
        Circle()
            .fill(Color.red)
            .frame(width: 20 * amount)
            .offset(x: -50, y: -80)
            .blendMode(.darken)
        Circle()
            .fill(Color.blue)
            .frame(width: 20 * amount)
            .offset(x: 50, y: -80)
            .blendMode(.darken)
        Circle()
            .fill(Color.green)
            .frame(width: 20 * amount)
            .blendMode(.darken)
    VStack{
        Spacer()
        Slider(value: $amount, in: 0...15)
        .padding(20)
            }
        }
    }
}
