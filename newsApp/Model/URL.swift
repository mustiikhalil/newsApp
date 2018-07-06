//
//  URL.swift
//  newsApp
//
//  Created by Mustafa Khalil on 6/4/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import Foundation

struct URLS {
    
    private let _BASE_URL = "https://newsapi.org/v2/"
    private let _apiKeyString = String(format: "&apiKey=")
    private let _headLines = String(format: "top-headlines?sources=")
    private let _source = String(format: "sources?apiKey=")
    private let _APIKey: String
    
    var sources: String {
        get {
            return _BASE_URL + _source + _APIKey
        }
    }
    
    func headLines(from id: String) -> String {
        
        return _BASE_URL + _headLines + id + _apiKeyString + _APIKey
    }
    
    init(APIkey: String) {
        self._APIKey = APIkey
    }
    
}
