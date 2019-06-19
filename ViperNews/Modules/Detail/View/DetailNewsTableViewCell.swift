//
//  DetailNewsTableViewCell.swift
//  ViperNews
//
//  Created by Agus Cahyono on 18/06/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit
import Kingfisher

class DetailNewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var titleNews: UILabel!
    @IBOutlet weak var timeNews: UILabel!
    @IBOutlet weak var contentNews: UILabel!
    @IBOutlet weak var buttonShowMore: UIButton! {
        didSet {
            self.buttonShowMore.addTarget(self, action: #selector(self.openMoreNews(_:)), for: .primaryActionTriggered)
        }
    }
    
    var newsURL: String = ""
    
    func setup(_ news: Article) {
        self.titleNews.text = news.title
        self.timeNews.text = DateHelper.formatPublished(news.publishedAt ?? "")
        self.contentNews.text = news.description
        
        imgNews.kf.indicatorType = .activity
        
        imgNews.kf.setImage(
            with: URL(string: news.urlToImage ?? "")
        )
        
        self.newsURL = news.url ?? ""
        
    }
    
    @objc func openMoreNews(_ sender: UIButton) {
        guard let url = URL(string: self.newsURL) else { return }
        UIApplication.shared.open(url)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
