//
//  VideosRouter.swift
//  ViperNews
//
//  Created by Agus Cahyono on 19/06/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation
import UIKit
import XCDYouTubeKit

class VideosRouter {

    // MARK: Properties

    weak var viewController: UIViewController?

}

extension VideosRouter: VideosWireframe {
    
    
    func openVideoDetail(withVideo news: Article) {
        let playerClass = YoutubePlayerHelper()
        playerClass.playVideo(url: news.url ?? "", vc: viewController!)
        
    }
    
    static func assembleModule() -> UIViewController {
        let viewController = UIStoryboard.loadViewController() as VideosViewController
        let presenter = VideosPresenter()
        let router = VideosRouter()
        let interactor = VideosInteractor()
        
        
        let navigation = UINavigationController(rootViewController: viewController)
        
        viewController.presenter =  presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        router.viewController = viewController
        
        interactor.output = presenter
        
        return navigation
    }
    
    // TODO: Implement wireframe methods
}
