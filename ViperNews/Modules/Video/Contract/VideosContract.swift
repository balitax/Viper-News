//
//  VideosContract.swift
//  ViperNews
//
//  Created by Agus Cahyono on 19/06/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

protocol VideosView: IndicateTableView {
    // TODO: Declare view methods
    
    var presenter: VideosPresentation! { get set }
    func showEmptyData()
    func showVideoData(_ data: [Article])
}

protocol VideosPresentation: class {
    // TODO: Declare presentation methods
    
    var view: VideosView? { get set }
    var interactor: VideosUseCase! { get set }
    var router: VideosWireframe! { get set }
    
    func viewDidLoad()
    func didSelectedVideo(_ news: Article)
    func didReloadFetchVideos()
    
}

protocol VideosUseCase: class {
    // TODO: Declare use case methods
    
    var output: VideosInteractorOutput! { get set }
    
    func fetchVideos()
}

protocol VideosInteractorOutput: class {
    // TODO: Declare interactor output methods
    
    func videosFetched(_ video: Videos)
    func failedFetchVideos()
}

protocol VideosWireframe: class {
    // TODO: Declare wireframe methods
    
    var viewController: UIViewController? { get set }
    
    func openVideoDetail(withVideo video: Article)
    
    static func assembleModule() -> UIViewController
}
