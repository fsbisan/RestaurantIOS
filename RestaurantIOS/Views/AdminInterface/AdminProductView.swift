//
//  AdminProductView.swift
//  RestaurantIOS
//
//  Created by Александр Макаров on 20.03.2023.
//

import SwiftUI
import PhotosUI

struct AdminProductView: View {
    
    @State private var title: String = ""
    @State private var price: Int?
    @State private var category: Category = .first
    @State private var description: String = ""
    @State private var selectedItem: PhotosPickerItem?
    @State private var data: Data?
    
    var body: some View {
        VStack{
            PhotosPicker(selection: $selectedItem) {
                if let data {
                    Image(uiImage: UIImage(data: data)!)
                        .resizable()
                        .frame(width: 240, height: 200)
                        .scaledToFill()
                } else {
                    Image(systemName: "camera")
                        .resizable()
                        .frame(width: 240, height: 200)
                        .scaledToFill()
                }
            }.onChange(of: selectedItem) { newValue in
                guard let selectedItem else { return }
                
                selectedItem.loadTransferable(type: Data.self) { result in
                    switch result {
                    case .success(let success):
                        if let success { self.data = success }
                    case .failure(let failure):
                        print("данные не найдены\(failure)")
                    }
                }
            }
            
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
