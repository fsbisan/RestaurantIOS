//
//  AdminProductView.swift
//  RestaurantIOS
//
//  Created by Александр Макаров on 20.03.2023.
//

import SwiftUI

struct AdminProductView: View {
    @State private var title: String = ""
    @State private var price: Int?
    @State private var category: Category = .first
    @State private var description: String = ""
    
    var body: some View {
        VStack{
            Image(systemName: "camera")
                .resizable()
                .frame(width: 240, height: 200)
                .scaledToFit()
            
            TextField("Название", text: $title)
                .padding().background(.white)
                .padding(.horizontal)
            
            TextField("Цена", value: $price, format: .number)
                .padding().background(.white)
                .padding(.horizontal)
            
            Picker("Категория", selection: $category) {
                ForEach(Category.allCases, id: \.rawValue) { category in
                    Text(category.rawValue)
                        .tag(category)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(8)
            .background(.white)
            .padding(.horizontal)
            .tint(.black)
            
            TextField("Описание", text: $description)
                .padding().background(.white)
                .padding(.horizontal)
            Button {
                print("create")
            } label: {
                Text("Создать")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("brown"))
                    .padding()
                    .foregroundColor(.white)
                    .bold()
            }

        }
        .frame(maxHeight: .infinity)
        .background(Color("lightGray"))
    }
}

struct AdminProductView_Previews: PreviewProvider {
    static var previews: some View {
        AdminProductView()
    }
}


enum Category: String, CaseIterable {
    case first = "Первые блюда"
    case second = "Вторые блюда"
    case drinks = "Напитки"
    case desert =  "Десерты"
    case salat = "Салаты"
}
