//
//  VideosViewController.swift
//  ViperNews
//
//  Created by Agus Cahyono on 19/06/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import HGPlaceholders
import UIKit

class VideosViewController: UIViewController, StoryboardLoadable {

    // MARK: Properties
    @IBOutlet weak var tableView: TableView!

    var presenter: VideosPresentation!
    var videos: [Article] = [] {
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
        self.navigationItem.title = "Video"
    }
    
    func setupView() {
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100.0
        tableView.placeholderDelegate = self
        tableView.adjustedContentInsetDidChange()
        tableView.register(NewsTableViewCell.self)
        
        self.tableView.refreshControl = UIRefreshControl()
        self.tableView.refreshControl?.addTarget(self, action: #selector(self.didReloadNews(_:)), for: .valueChanged)
        
        
    }
    
    @objc func didReloadNews(_ sender: UIRefreshControl) {
        presenter.didReloadFetchVideos()
        sender.endRefreshing()
    }
    
}

extension VideosViewController: VideosView {
    
    func showEmptyData() {
         self.tableView.showNoResultsPlaceholder()
    }
    
    func showVideoData(_ data: [Article]) {
        self.videos = data
    }
    
    // TODO: implement view output methods
}


extension VideosViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as NewsTableViewCell
        
        let article = videos[indexPath.row]
        
        cell.playButton.isHidden = false
        
        cell.selectionStyle = .none
        cell.setup(article)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("CLICKED")
        presenter.didSelectedVideo(self.videos[indexPath.row])
    }
}


extension VideosViewController: PlaceholderDelegate {
    
    func view(_ view: Any, actionButtonTappedFor placeholder: Placeholder) {
        presenter.didReloadFetchVideos()
    }
    
}
