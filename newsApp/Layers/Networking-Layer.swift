//
//  Networking-Layer.swift
//  newsApp
//
//  Created by Mustafa Khalil on 6/5/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import Foundation
import Alamofire

class Networking {
    var url: String
    var APIKey: String
    var headers = ["Content-Type":"application/json"]
    
    init(baseURL: String, APIKey:String) {
        self.url = baseURL
        self.APIKey = APIKey
    }
    
    func fetchData<T: Decodable> (url: URL, onSuccess: @escaping (T) -> Void, onFailure: @escaping (Error) -> Void) {
        
        Alamofire.request(url).response { (response) in

            if response.response?.statusCode == 200 {
                do {
                    if let json = response.data {
                        let data = try JSONDecoder().decode(T.self, from: json)
                        log.verbose("Success")
                        print(data)
                        onSuccess(data)
                    }
                    
                } catch let err {
                    log.error(err)
                    onFailure(err)
                }
            }
        }
    }
    
}
