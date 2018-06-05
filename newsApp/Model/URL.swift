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
    let header = String(format: "top-headlines?country=us&apiKey=")
    let source = String(format: "sources?apiKey=")
}
