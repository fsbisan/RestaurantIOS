//
//  EmployeeSignView.swift
//  RestaurantIOS
//
//  Created by Александр Макаров on 20.03.2023.
//

import SwiftUI

struct EmployeeSignView: View {
    @State private var login: String = ""
    @State private var password: String = ""
    @State private var showAdminMenu = false
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 150)
                .foregroundColor(Color("brown"))
                .opacity(0.4)
            Spacer()
        }.background(Image("bg")
            .resizable()
            .scaledToFill())
        .ignoresSafeArea()
        .overlay {
            VStack(spacing: 24) {
                Text("Вход для сотрудника")
                    .font(.title2)
                    .foregroundColor(.white).bold()
                TextField("Логин", text: $login)
                    .padding()
                    .background(.white)
                    .font(.title3)
                SecureField("Пароль", text: $password)
                    .padding()
                    .background(.white)
                    .font(.title3)
                Button {
                    showAdminMenu.toggle()
                } label: {
                    Text("Войти!")
                        .font(.title3).bold()
                }.frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("brown"))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 50)
        }
        .fullScreenCover(isPresented: $showAdminMenu) {
            MenuAdminView()
        }
    }
}

struct EmployeeSignView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeSignView()
    }
}
