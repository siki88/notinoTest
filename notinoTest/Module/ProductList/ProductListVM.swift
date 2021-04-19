//
//  ProductListVM.swift
//  notinoTest
//
//  Created by Lukáš Spurný on 03/07/2020.
//  Copyright © 2020 cz.sikisoft. All rights reserved.
//

import SwiftUI

final class ProductListVM: ObservableObject {
    
    @Published private(set) var products: [ProductListModel] = []
    
    private let services = Services()
    
    init() {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            guard let self = self else { return }
            self.fetchData()
        }
    }
    
    func getListProducts() -> [[ProductListModel]] {
        var products: [[ProductListModel]] = []
        _ = (self.products).publisher
            .collect(2)
            .collect()
            .sink(receiveValue: { products = $0 })
        return products
    }
    
    func fetchData() {
        services.sendRequest(getUrl: nil, getParameter: nil, postParameter: nil) { [weak self] (response, error) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if let _ = error {
                    //Implement
                }
                if let response = response {
                    guard let vpProductByIds = response.vpProductByIds else { return }
                    self.products = vpProductByIds
                }
            }
        }
    }
}
