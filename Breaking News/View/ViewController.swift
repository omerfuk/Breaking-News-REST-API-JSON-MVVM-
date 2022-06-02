//
//  ViewController.swift
//  Breaking News
//
//  Created by Ömer Faruk Kılıçaslan on 2.06.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
 
    private var articleListVM: ArticleListViewModel!
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setUp()
        
        
        
    }
    
    
    func setUp() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=tr&apiKey=9069de5f9f0a4266abcf43425301a5be")!
        
        Webservice().getData(url: url) { articles in
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    //TableView Functions
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0: self.articleListVM.numberOfSections
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArticleTableViewCell
        let articleVM = articleListVM.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        cell.authorLabel.text = articleVM.author
        
        return cell
    }
   

}

