//
//  VideosInteractor.swift
//  ViperNews
//
//  Created by Agus Cahyono on 19/06/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import RxSwift

class VideosInteractor {

    // MARK: Properties

    weak var output: VideosInteractorOutput!
    private var disposeBag = DisposeBag()
}

extension VideosInteractor: VideosUseCase {
    
    // TODO: Implement use case methods
    func fetchVideos() {
        APIServices.fetchVideos()
            .subscribe(onNext: { videos in
                self.output.videosFetched(videos)
            }, onError: { error in
                self.output.failedFetchVideos()
            })
            .disposed(by: disposeBag)
    }
}
