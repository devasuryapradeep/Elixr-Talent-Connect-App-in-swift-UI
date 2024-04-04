//
//  HamburgerMenu.swift
//  ElixrTalentConnectApp
//
//  Created by Devasurya on 30/03/24.
//
import SwiftUI
import SSSwiftUISideMenu

struct HamburgerMenu: View {
@State var selectedIndex :Int = 0
    @State var openSideMenu :Bool = false
    var menuItems = [MenuItem(title: "Home", icon: ""),
        MenuItem(title: "AboutUs", icon: ""),
                     MenuItem(title: "Contact Info", icon:  " "),
    MenuItem(title: "Change Password", icon: ""),
    MenuItem(title: "Privacy", icon: ""),
    MenuItem(title: "Contact Us", icon: "")]
    @State var menuConfig :SSMenuConfig = SSMenuConfig()
    
    var body: some View {
        NavigationStack {
//            ZStack {
                TabView(selection: $selectedIndex, content: {
                    MainTabbarView().tag(0)
                    AcknowledgementView().tag(1)
                    ContactInfoView().tag(2)
                    SettingsView().tag(3)
                    
                })
            
                .overlay(content: {
                    SSSwiftUISideMenu(openSideMenu: $openSideMenu, selectedIndex: $selectedIndex, menuItems: menuItems, menuConfig: menuConfig)
                })
        
            }
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


//
//#Preview {
//    HamburgerMenu()
//}
