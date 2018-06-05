//
//  Errors.swift
//  newsApp
//
//  Created by Mustafa Khalil on 6/5/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import Foundation

struct APIErrors: Codable {
    var status: String?
    var code: String?
    var message: String?
}
