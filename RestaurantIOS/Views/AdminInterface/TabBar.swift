//
//  TabBar.swift
//  RestaurantIOS
//
//  Created by Александр Макаров on 20.03.2023.
//

import SwiftUI

struct TabBar: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(named: "brown")
    }
    var body: some View {
        TabView {
            NavigationView {
//                MenuAdminView()
            }
//            MenuAdminView()
                .tabItem {
                    Image(systemName: "menucard")
                    Text("Меню")
                }
        }.accentColor(Color.white)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
