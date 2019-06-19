//
//  NewsTableViewCell.swift
//  ViperNews
//
//  Created by Agus Cahyono on 18/06/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var titleNews: UILabel!
    @IBOutlet weak var timeNews: UILabel!
    @IBOutlet weak var playButton: UIImageView!
    
    func setup(_ news: Article) {
        self.titleNews.text = news.title
        self.timeNews.text = DateHelper.formatPublished(news.publishedAt ?? "")
        
        imageNews.kf.indicatorType = .activity
        
        imageNews.kf.setImage(
            with: URL(string: news.urlToImage ?? "")
        )
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
