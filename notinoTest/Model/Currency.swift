//
//  Currency.swift
//  notinoTest
//
//  Created by Lukáš Spurný on 04/07/2020.
//  Copyright © 2020 cz.sikisoft. All rights reserved.
//

import Foundation

struct CurrencyRequestCodable: Codable {
    var currency: [String: CurrencyItem]
}

struct CurrencyItems : Codable {
    var name: [String: CurrencyItem]
}

struct CurrencyItem : Codable {
    var symbol: String
    var name: String
    var symbolNative: String
    var decimalDigits: Int
    var rounding: Int
    var code: String
    var namePlural: String
    
    enum CodingKeys: String, CodingKey {
        case symbol = "symbol"
        case name = "name"
        case symbolNative = "symbol_native"
        case decimalDigits = "decimal_digits"
        case rounding = "rounding"
        case code = "code"
        case namePlural = "name_plural"
    }
}
