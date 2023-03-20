//
//  MenuAdminView.swift
//  RestaurantIOS
//
//  Created by Александр Макаров on 20.03.2023.
//

import SwiftUI

struct MenuAdminView: View {
    
    @State private var showProductView = false
    
    var body: some View {
        List {
            ForEach(defProducts) { product in
                AdminProductCell(product: product)
                    .listRowSeparator(.hidden)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button {
                            print("Удалить")
                        } label: {
                            Image(systemName: "trash")
                        }.tint(.red)

                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button {
                            print("Редактировать")
                        } label: {
                            Image(systemName: "square.and.pencil")
                        }.tint(.green)
                    }
            }
        }.listStyle(.plain)
            .navigationTitle("Меню")
            .overlay(alignment: .bottomTrailing) {
                Button {
                    showProductView.toggle()
                } label: {
                    Image(systemName: "plus")
                        .padding()
                        .frame(width: 60, height: 60)
                        .background(Color("brown"))
                        .clipShape(Circle())
                        .padding()
                        .foregroundColor(.white)
                }
            }
            .sheet(isPresented: $showProductView) {
                AdminProductView()
            }
    }
}

struct MenuAdminView_Previews: PreviewProvider {
    static var previews: some View {
        MenuAdminView()
    }
}

let defProducts = [Product(id: UUID().uuidString,
                           title: "Шашлык из свиной шейки",
                           price: 1400,
                           description: "Очень очень жирненько"),
                   Product(id: UUID().uuidString,
                           title: "Жульен",
                           price: 1100,
                           description: "Курочки с грибами в соусе"),
                   Product(id: UUID().uuidString,
                           title: "Пица",
                           price: 500,
                           description: "Нельзя не поделиться"),
                   Product(id: UUID().uuidString,
                           title: "Шаурма",
                           price: 200,
                           description: "Самый вкусный шаурма")]
