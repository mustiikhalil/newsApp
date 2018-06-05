//
//  Sources.swift
//  newsApp
//
//  Created by Mustafa Khalil on 6/5/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import Foundation

struct Sources: Codable {
    var sources: [Source]
}

struct Source: Codable {
    var id: String?
    var name: String?
}
