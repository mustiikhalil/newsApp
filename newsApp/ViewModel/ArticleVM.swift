//
//  ArticelVM.swift
//  newsApp
//
//  Created by Mustafa Khalil on 7/6/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import Foundation

struct ArticleViewModel {
    
    var articleID: String
    var name: String
    var title: String
    var description: String
    var url: String
    
    init(article: Article) {
        articleID = article.source?.id ?? ""
        name = article.source?.name ?? ""
        title = article.title ?? ""
        description = article.description ?? ""
        url = article.url ?? ""
    }
}
