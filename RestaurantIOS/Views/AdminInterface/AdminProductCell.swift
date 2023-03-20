//
//  AdminProductCell.swift
//  RestaurantIOS
//
//  Created by Александр Макаров on 20.03.2023.
//

import SwiftUI

struct AdminProductCell: View {
    let product: Product
    
    var body: some View {
        HStack{
            Image("bg")
                .resizable()
                .frame(width: 80, height: 70)
                .scaledToFill()
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 10) {
                Text(product.title)
                Text("\(product.price)Р")
            }.bold()
            Spacer()
        }
    }
}

struct AdminProductCell_Previews: PreviewProvider {
    static var previews: some View {
        AdminProductCell(product: defProducts[0])
    }
}
