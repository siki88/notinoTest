//
//  Decodable.swift
//  notinoTest
//
//  Created by Lukáš Spurný on 04/07/2020.
//  Copyright © 2020 cz.sikisoft. All rights reserved.
//

import Foundation

extension Decodable {
    
    static func loadJSON<T:Decodable>(_ fileName: String, fileExtension: String="json", bundle: Bundle = .main) throws -> T {
        guard let url = bundle.url(forResource: fileName, withExtension: fileExtension) else {
            throw NSError(domain: NSURLErrorDomain, code: NSURLErrorResourceUnavailable)
        }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
