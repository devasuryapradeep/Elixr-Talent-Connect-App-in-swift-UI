//
//  MainTabbarView.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 25/03/24.
//
import SSSwiftUISideMenu
import SwiftUI

struct MainTabbarView: View {
    @State var selectedTab = 0
    @State var openSideMenu :Bool = false
    @State var selectedIndex :Int = 0
    var menuItems = [MenuItem(title: "AboutUs", icon: ""),MenuItem(title: "Settings", icon:  " ")]
    @State var menuConfig :SSMenuConfig = SSMenuConfig()
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $selectedTab,
                        content:  {
                    JobDisplayView()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("home")
                        }
                        .tag(0)
                    MyJobs()
                        .tabItem {
                            Image(systemName: "clipboard.fill")
                            Text("My Jobs")
                        }
                        .tag(1)
                    MyProfile()
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("My Profile")
                        }
                })
                
                .accentColor(Color.elixrOrange)
                SSSwiftUISideMenu(openSideMenu: $openSideMenu, selectedIndex: $selectedIndex, menuItems: menuItems, menuConfig: menuConfig)
                
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button{
                                openSideMenu.toggle()
                            } label: {
                                Image(systemName: "list.dash")
                                    .foregroundStyle(Color.black)
                                    .bold()
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            LogoImage(logoName: "logo 1", width: 70, height: 70)
                                .padding(.trailing,143)
                        }
                    }
                
                    .navigationBarBackButtonHidden()
            }
        }
    }
}
#Preview {
    MainTabbarView()
}




