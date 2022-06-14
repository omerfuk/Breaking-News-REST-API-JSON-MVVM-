//
//  ArticleDetailViewController.swift
//  Breaking News
//
//  Created by Ömer Faruk Kılıçaslan on 3.06.2022.
//

import UIKit

class ArticleDetailViewController: UIViewController {
    
    var selectedArticles: Article?
    
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblDetail: UITextView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgArticle: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
            if let title = self.selectedArticles?.title {
                self.lblTitle.text = title
            }
            if let author = self.selectedArticles?.author{
                self.lblAuthor.text = author
            }
            
            if let description = self.selectedArticles?.description {
                self.lblDetail.text = description
            }
        
        
        
        
        if let imageUrl = selectedArticles?.urlToImage {
            
            let newsImageUrl = URL(string: imageUrl)!

            // Creating a session object with the default configuration.
            
            let session = URLSession(configuration: .default)

            // Define a download task. The download task will download the contents of the URL as a Data object and then you can do what you wish with that data.
            let downloadPicTask = session.dataTask(with: newsImageUrl) { (data, response, error) in
                // The download has finished.
                if let e = error {
                    print("Error downloading news picture: \(e)")
                } else {
                    // No errors found.
                    // It would be weird if we didn't have a response, so check for that too.
                    if let res = response as? HTTPURLResponse {
                        print("Downloaded news picture with response code \(res.statusCode)")
                        if let imageData = data {
                            // Finally convert that Data into an image and do what you wish with it.
                            DispatchQueue.main.async {
                                self.imgArticle.image = UIImage(data: imageData)
                            }
                            
                            // Do something with your image.
                            
                        } else {
                            print("Couldn't get image: Image is nil")
                        }
                    } else {
                        print("Couldn't get response code for some reason")
                    }
                }
            }

            downloadPicTask.resume()
            
        }
        
        
    }
    

    
}
