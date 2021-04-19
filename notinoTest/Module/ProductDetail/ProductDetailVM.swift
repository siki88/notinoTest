//
//  ProductDetailVM.swift
//  notinoTest
//
//  Created by Lukáš Spurný on 03/07/2020.
//  Copyright © 2020 cz.sikisoft. All rights reserved.
//

import Foundation

final class ProductDetailVM: ObservableObject {
    
    @Published private(set) var product: ProductListModel?
    
    init(product: ProductListModel) {
        self.product = product
    }
    
    func getDetailProduct() -> ProductListModel {
        guard let product = self.product else { return ProductListModel() }
        return product
    }
}
