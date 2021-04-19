//
//  ProductListModel.swift
//  notinoTest
//
//  Created by Lukáš Spurný on 03/07/2020.
//  Copyright © 2020 cz.sikisoft. All rights reserved.
//

import Foundation

struct ProductVpProductByIdsModel: Decodable {
    var id = UUID()
    var vpProductByIds: [ProductListModel]?
    
    enum CodingKeys: String, CodingKey {
        case vpProductByIds = "vpProductByIds"
    }
}

struct ProductListModel: Decodable, Identifiable, Hashable {
    var id: String?
    var productId: Int?
    var masterId: Int?
    var price: ProductListPriceModel?
    var name: String?
    var brand: ProductListBrandModel?
    var annotation: String?
    var orderUnit: String?
    var attributes: ProductListAttributesModel?
    var imageUrl: String?
    var like: Bool?
    var stockAvailability: ProductListStockAvailabilityModel?
    var reviewSummary: ProductListReviewSummaryModel?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case productId = "productId"
        case masterId = "masterId"
        case price = "price"
        case name = "name"
        case brand = "brand"
        case annotation = "annotation"
        case orderUnit = "orderUnit"
        case attributes = "attributes"
        case imageUrl = "imageUrl"
        case stockAvailability = "stockAvailability"
        case reviewSummary = "reviewSummary"
    }
    
    static func == (lhs: ProductListModel, rhs: ProductListModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct ProductListPriceModel: Decodable {
    var value: Int?
    var currency: String?
    
    enum CodingKeys: String, CodingKey {
        case value = "value"
        case currency = "currency"
    }
}

struct ProductListBrandModel: Decodable {
    var id: String?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}

struct ProductListAttributesModel: Decodable {
    var master: Bool?
    var ean: String?
    var packageSize: ProductListAttributesPackageSizeModel?
    
    enum CodingKeys: String, CodingKey {
        case master = "Master"
        case ean = "EAN"
        case packageSize = "PackageSize"
    }
}

struct ProductListAttributesPackageSizeModel: Decodable {
    var height: Int?
    var width: Int?
    var depth: Int?
    
    enum CodingKeys: String, CodingKey {
        case height = "height"
        case width = "width"
        case depth = "depth"
    }
}

struct ProductListStockAvailabilityModel: Decodable {
    var code: String?
    var count: Bool?
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case count = "count"
    }
}

struct ProductListReviewSummaryModel: Decodable {
    var score: Int?
    
    enum CodingKeys: String, CodingKey {
        case score = "score"
    }
}


