//
//  Articles.swift
//  newsApp
//
//  Created by Mustafa Khalil on 6/5/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import Foundation

struct Articles: Codable {
    var articles: [Article]
}

struct Article: Codable {
    var source: Source?
    var title: String?
    var description: String?
    var url: String?
}

