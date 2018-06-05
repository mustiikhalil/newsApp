//
//  URL.swift
//  newsApp
//
//  Created by Mustafa Khalil on 6/4/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import Foundation

let extensionURL = URLExtension()
let BASE_URL = "https://newsapi.org/v2/"

struct URLExtension {
    let apiKeyString = String(format: "&apiKey=")
    let headLines = String(format: "top-headlines?sources=")
    let source = String(format: "sources?apiKey=")
    
    func URLBuilder (source: String) -> String {
        return headLines + source + apiKeyString
    }

}
