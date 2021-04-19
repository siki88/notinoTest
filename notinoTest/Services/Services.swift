//
//  Services.swift
//  notinoTest
//
//  Created by Lukáš Spurný on 03/07/2020.
//  Copyright © 2020 cz.sikisoft. All rights reserved.
//

import Foundation
import Alamofire

final class Services {
    
    private var baseUrl = "https://my-json-server.typicode.com/michals92/notino-mobile-test/db"
    
    func sendRequest(getUrl: String?, getParameter: String?, postParameter: [String: Any]?, completionHandler: @escaping (ProductVpProductByIdsModel?, Error?) -> Void) {
        
        var urlString = self.baseUrl
        var method: HTTPMethod = .get
        var endPostParameter: Parameters = [:]
        
        if let postParameter = postParameter, !postParameter.isEmpty {
            endPostParameter = postParameter
            method = .post
        } else if let getUrl = getUrl {
            urlString += getUrl
        }
        
        guard let convertUrl = URL(string: urlString) else { return }
        
        AF.request(convertUrl, method: method, parameters: endPostParameter, encoding: URLEncoding.default, headers: nil, interceptor: nil).responseDecodable { (response: AFDataResponse<ProductVpProductByIdsModel>) in
            
            switch response.result{
            case .success(let responseEvent):
                completionHandler(responseEvent ,nil)
            case .failure(let error):
                completionHandler(nil ,error)
            }
        }
    }
}
