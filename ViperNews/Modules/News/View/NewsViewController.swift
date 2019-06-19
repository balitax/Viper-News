//
//  NewsViewController.swift
//  ViperNews
//
//  Created by Agus Cahyono on 18/06/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit
import HGPlaceholders

class NewsViewController: UIViewController, StoryboardLoadable {
    
    @IBOutlet weak var tableView: TableView!

    // MARK: Properties

    var refreshControll = UIRefreshControl()
    var presenter: NewsPresentation!
    var news: [Article] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if #available(iOS 11, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        self.navigationItem.title = "Berita"
    }
    
    func setupView() {
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100.0
        tableView.placeholderDelegate = self
        tableView.adjustedContentInsetDidChange()
        tableView.register(NewsTableViewCell.self)
        
        // add reload uibarbutton item
        
        let reloadButton = UIBarButtonItem(image: UIImage(named: "options-outline"), style: .plain, target: self, action: #selector(self.showMoreCategory(_:)))
        self.navigationItem.rightBarButtonItem = reloadButton
        
        self.tableView.refreshControl = UIRefreshControl()
        self.tableView.refreshControl?.addTarget(self, action: #selector(self.didReloadNews(_:)), for: .valueChanged)
        
        
    }
    
    @objc func didReloadNews(_ sender: UIRefreshControl) {
        presenter.didReloadFetchNews()
        sender.endRefreshing()
    }
    
    @objc func showMoreCategory(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Kategori Lain", message: "Pilih Kategori Berita", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Teknologi", style: .default , handler:{ (UIAlertAction)in
            self.presenter.didSelectOtherCategory("technology")
        }))
        
        alert.addAction(UIAlertAction(title: "Olahraga", style: .default , handler:{ (UIAlertAction)in
            self.presenter.didSelectOtherCategory("sport")
        }))
        
        alert.addAction(UIAlertAction(title: "Politik", style: .default , handler:{ (UIAlertAction)in
            self.presenter.didSelectOtherCategory("politics")
        }))
        
        alert.addAction(UIAlertAction(title: "Bisnis", style: .default , handler:{ (UIAlertAction)in
            self.presenter.didSelectOtherCategory("business")
        }))
        
        alert.addAction(UIAlertAction(title: "Other", style: .default , handler:{ (UIAlertAction)in
            self.presenter.didSelectOtherCategory("others")
        }))
        
        alert.addAction(UIAlertAction(title: "Batal", style: .cancel, handler:{ (UIAlertAction)in
        }))
        
        self.present(alert, animated: true, completion: {
            
        })
    }
    
}

extension NewsViewController: NewsView {

    func showNewsData(_ data: [Article]) {
        self.news = data
    }
    
    func showEmptyData() {
        self.tableView.showNoResultsPlaceholder()
    }
    
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as NewsTableViewCell
        
        let article = news[indexPath.row]
        
        cell.playButton.isHidden = true
        
        cell.selectionStyle = .none
        cell.setup(article)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectedNews(self.news[indexPath.row])
    }
}


extension NewsViewController: PlaceholderDelegate {
    
    func view(_ view: Any, actionButtonTappedFor placeholder: Placeholder) {
        presenter.didReloadFetchNews()
    }
    
}
