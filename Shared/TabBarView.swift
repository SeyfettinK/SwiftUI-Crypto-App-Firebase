//
//  TabBarView.swift
//  MyCyrpto
//
//  Created by Seyfettin Kılınç on 1.05.2022.
//

import SwiftUI

struct HomeView : View{
    var body: some View{
        NavigationView{
            VStack{
                Text("hi")
            }.navigationTitle("Home")
        }
    }
}

struct SettingsView : View{
    var body: some View{
        NavigationView{
            ZStack{
                Color.gray
            }.navigationTitle("Home")
        }
    }
}

struct TabBarView: View {
    @ObservedObject var girisYapildiMi : girisYapildi = girisYapildi()
    var body: some View {
        VStack{
            if globalEmail == " "{
                LoginView(girisYapildiMi: girisYapildiMi)
            }
            else {
                TabView {
                    HomePage()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Anasayfa")
                    }
                    
                    WalletView()
                        .tabItem {
                            Image(systemName: "bag.circle.fill")
                            Text("Cüzdan")
                        }
                    BuySellView()
                        .tabItem {
                            Image(systemName: "cart")
                            Text("Alım Satım")
                        }
                    Profile()
                        .tabItem {
                            Image(systemName: "star.fill")
                            Text("Favoriler")
                        }
                    UserInformation()
                        .tabItem{
                            Image(systemName: "person.text.rectangle.fill")
                            Text("Information")
                        }
                }
            }
        }
        
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .preferredColorScheme(.dark)
    }
}
