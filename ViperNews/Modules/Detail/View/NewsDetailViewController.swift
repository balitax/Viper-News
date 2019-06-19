//
//  NewsDetailViewController.swift
//  ViperNews
//
//  Created by Agus Cahyono on 18/06/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation
import UIKit

class NewsDetailViewController: UIViewController, StoryboardLoadable {
    
    @IBOutlet weak var tableView: UITableView!

    // MARK: Properties

    var presenter: NewsDetailPresentation!
    var article: Article!
    // MARK: Lifecycle
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        presenter.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if #available(iOS 11, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = false
        }
        self.navigationItem.title = "News"
        
    }
    
    func setupView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100.0
        tableView.register(DetailNewsTableViewCell.self)
        
    }
    
}

extension NewsDetailViewController: NewsDetailView {

    func showDetail(forArticle article: Article) {
        self.navigationItem.title = article.title
        self.article = article
        self.tableView.reloadData()
    }
    
}


extension NewsDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as DetailNewsTableViewCell
        
        cell.selectionStyle = .none
        cell.setup(self.article)
        
        return cell
    }
    
}
