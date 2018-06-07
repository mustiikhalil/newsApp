//
//  CellIdentifier.swift
//  newsApp
//
//  Created by Mustafa Khalil on 6/3/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import Foundation

enum CellIdentifier: String {
    case Channels
    case News
    var ID: String {
        get {
            return self.rawValue
        }
    }
}
