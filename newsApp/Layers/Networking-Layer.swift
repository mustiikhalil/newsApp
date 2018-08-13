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
    
    var urls: URLS
    var headers = ["Content-Type": "application/json"]
    
    init(baseURLs: URLS) {
        self.urls = baseURLs
    }
    
    func getRequest<T: Decodable> (withUrl url: URL, onSuccess: @escaping (T) -> Void, onFailure: @escaping (Error) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, urlresponse, err) in
            print("here")
            if let response = urlresponse as? HTTPURLResponse, response.statusCode == 200 {
                do {
                    if let data = data {
                        let json = try JSONDecoder().decode(T.self, from: data)
                        DispatchQueue.main.async {
                            onSuccess(json)
                        }
                        
                    }
                } catch let err {
                    DispatchQueue.main.async {
                        onFailure(err)
                    }
                }
            }
        }.resume()
//        Alamofire.request(url).response { (response) in
//
//            if response.response?.statusCode == 200 {
//                do {
//                    if let json = response.data {
//
//                        let data = try JSONDecoder().decode(T.self, from: json)
//                        log.verbose("Success")
//                        onSuccess(data)
//                    }
//
//                } catch let err {
//                    log.error(err)
//                    onFailure(err)
//                }
//            }
//        }
    }
    
}
