//
//  ContentView.swift
//  MiCard SwiftUI
//
//  Created by Raghav Sharma on 28/07/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack{
            Color(red: 0.20, green: 0.29, blue: 0.37, opacity: 1.00)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("raghavTinker")
                    .resizable()
                    .scaledToFit().frame(width: 150.0, height: 150.0)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(Color.white, lineWidth: 5))
                    
                Text("Raghav Sharma")
                    .font(Font.custom("Nunito-Regular", size: 40))
                    .bold()
                    .foregroundColor(.white)
                Text("\nSoftware engineer")
                    .foregroundColor(.white)
                    .font(Font.custom("ComicNeue-Regular", size: 20))
                Divider()
                InfoView(text: "+91 9880918485", imageName: "phone.fill")
                InfoView(text: "raghav.sharma17@outlook.com", imageName: "envelope.fill")
                InfoViewImage(text: "raghavTinker", imageName: "git")

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct InfoView: View {
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(height: 50)
            .foregroundColor(.white)
            .overlay(HStack {
                Image(systemName: imageName)
                Text(text)
            })
            
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct InfoViewImage: View {
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(height: 50)
            .foregroundColor(.white)
            .overlay(HStack {
                Image(imageName).frame(width: 20, height: 20)
                
                Text(text).padding()
            })
            
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
