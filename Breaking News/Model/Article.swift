//
//  Article.swift
//  Breaking News
//
//  Created by Ömer Faruk Kılıçaslan on 2.06.2022.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    
    var author: String?
    var title: String?
    var description: String?
}
