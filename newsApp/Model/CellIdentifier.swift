//
//  CellIdentifier.swift
//  newsApp
//
//  Created by Mustafa Khalil on 6/3/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import Foundation

enum CellIdentifier: String {
    case channel
    case news
    var ID: String {
        get {
            return self.rawValue
        }
    }
}
