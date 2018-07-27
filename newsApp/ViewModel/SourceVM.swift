//
//  SourceVM.swift
//  newsApp
//
//  Created by Mustafa Khalil on 7/6/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import Foundation

struct SourceViewModel {
    
    let name: String
    let sourceID: String
    
    init(source: Source) {
        name = source.name ?? ""
        sourceID = source.id ?? ""
    }
}
