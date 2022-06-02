//
//  Webservice.swift
//  Breaking News
//
//  Created by Ömer Faruk Kılıçaslan on 2.06.2022.
//

import Foundation
import UIKit

class Webservice {
    
    func getData(url: URL, completion: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data {
               let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if let articleList = articleList {
                    completion(articleList.articles)
                }
            }
        }.resume()
        
    }
    
}
