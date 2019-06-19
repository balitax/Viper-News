//
//  NewsDetailRouter.swift
//  ViperNews
//
//  Created by Agus Cahyono on 18/06/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation
import UIKit

class NewsDetailRouter {

    static func assembleModule(_ article: Article) -> UIViewController {
        let viewController = UIStoryboard.loadViewController() as NewsDetailViewController
        let presenter = NewsDetailPresenter()
        let interactor = NewsDetailInteractor()
        
        viewController.presenter =  presenter
        presenter.view = viewController
        presenter.interactor = interactor
        
        presenter.article = article
        
        return viewController
    }
}
