//
//  SwipePhoto.swift
//  MyCyrpto
//
//  Created by Seyfettin Kılınç on 18.04.2022.
//

import SwiftUI

struct SwipePhoto: View {
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    private var numberOfImages = 5
    @State private var currentIndex = 0
    
    func previous(){
        withAnimation {
            currentIndex = currentIndex > 0 ? currentIndex - 1 : numberOfImages - 1
        }
    }
    
    func next(){
        withAnimation {
            currentIndex = currentIndex < numberOfImages ? currentIndex + 1 : 0
        }
    }
    
    var controls : some View{
        HStack{
            Button {
                previous()
            } label: {
                Image(systemName: "chevron.left")
            }
            
            Button {
                next()
            } label: {
                Image(systemName: "chevron.right")
            }
        }
    }
    var body: some View {
        VStack{
            TabView(selection: $currentIndex){
                ForEach(0..<numberOfImages){ num in
                    Image("\(num)")
                        .resizable()
                        .scaledToFit()
                        .overlay(Color.black.opacity(0.2))
                        .tag(num)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                
            }.tabViewStyle(PageTabViewStyle())
                //.padding(.trailing,10)
                //.padding(.leading,10)
                .frame(width: .infinity, height: 150)
                .onReceive(timer) { _ in
                    next()
                    // set the page to next image
                }
            //controls
            PopulerCoinView()
                .padding(.top,10)
        }
    }
}

struct SwipePhoto_Previews: PreviewProvider {
    static var previews: some View {
        SwipePhoto()
    }
}
