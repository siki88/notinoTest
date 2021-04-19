//
//  ProductListCollectionVM.swift
//  notinoTest
//
//  Created by Lukáš Spurný on 04/07/2020.
//  Copyright © 2020 cz.sikisoft. All rights reserved.
//

import SwiftUI

final class ProductListCollectionVM: ObservableObject {
    
    @Published private(set) var product = ProductListModel()
    
    init(product: ProductListModel) {
        self.product = product
    }
    
    func calculateStars(row: Int, reviewSummary: Int) -> String {
        return row >= reviewSummary ? "ico-star-grey-1" : "ico-star-pink-1"
    }
    
    func getCurrency(_ currency: String?) -> String {
        guard let currency = currency else { return "" }
        return Currency.init(rawValue: currency)?.title ?? ""
    }
    
    func getUrl(_ imageUrl: String?) -> URL? {
        guard let imageUrl = imageUrl else { return nil }
        let prefixUrl: String = "https://i.notino.com/detail_zoom/"
        return URL(string: prefixUrl + imageUrl)
    }
    
    func likeGradientImage(_ like: Bool) -> String {
        return like ? "heart-bold-1" : "heart-1"
    }
    
    func setLikeGradientImage(_ like: Bool) {
        product.like = !like
    }
}

enum Currency: String {
    case CZK = "CZK"
    case SK = "SK"
    
    var title: String {
        switch self {
        
        case .CZK: return "Kč"
        case .SK: return "€"
        }
    }
}
