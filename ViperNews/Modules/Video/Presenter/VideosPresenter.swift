//
//  VideosPresenter.swift
//  ViperNews
//
//  Created by Agus Cahyono on 19/06/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

class VideosPresenter {

    // MARK: Properties

    weak var view: VideosView?
    var router: VideosWireframe!
    var interactor: VideosUseCase!
    
    var videos: Videos? {
        didSet {
            guard let videoData = videos?.articles else { return }
            if videoData.count > 0 {
                view?.showVideoData(videoData)
            } else {
                view?.showEmptyData()
            }
        }
    }
    
}

extension VideosPresenter: VideosPresentation {
    
    
    func viewDidLoad() {
        interactor.fetchVideos()
        view?.showLoading()
    }
    
    func didSelectedVideo(_ news: Article) {
        print("CLICKED 2")
        router.openVideoDetail(withVideo: news)
    }
    
    func didReloadFetchVideos() {
        interactor.fetchVideos()
        view?.showLoading()
    }
    
    // TODO: implement presentation methods
}

extension VideosPresenter: VideosInteractorOutput {
    
    func videosFetched(_ video: Videos) {
        self.videos = video
        view?.hideLoading()
    }
    
    func failedFetchVideos() {
        view?.showEmptyData()
        view?.hideLoading()
    }
    
    // TODO: implement interactor output methods
}
