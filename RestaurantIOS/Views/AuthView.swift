//
//  AuthView.swift
//  RestaurantIOS
//
//  Created by Александр Макаров on 20.03.2023.
//

import SwiftUI

struct AuthView: View {
    @State private var descNumber: String = ""
    @State private var showEmployeesSignIn = false
    
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
                    TextField("Введите номер столика", text: $descNumber)
                        .padding()
                        .background(.white)
                        .font(.title3)
                    Button {
                        print("Вход")
                    } label: {
                        Text("В меню!")
                            .font(.title3).bold()
                    }.frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("brown"))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 50)
            }
            .overlay(alignment: .bottomLeading) {
                Button {
                    showEmployeesSignIn.toggle()
                } label: {
                    Text("Вход для\nсотрудника")
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 30)
                        .foregroundColor(.white)
                        .font(.title3)
                }
            }
            .sheet(isPresented: $showEmployeesSignIn) {
               EmployeeSignView()
            }
    }

}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
