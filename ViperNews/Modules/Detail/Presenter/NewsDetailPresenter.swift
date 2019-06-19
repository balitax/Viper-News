//
//  NewsDetailPresenter.swift
//  ViperNews
//
//  Created by Agus Cahyono on 18/06/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

class NewsDetailPresenter {

    // MARK: Properties

    weak var view: NewsDetailView?
    var router: NewsDetailWireframe?
    var interactor: NewsDetailUseCase?
    var article: Article!
}

extension NewsDetailPresenter: NewsDetailPresentation {
    
    func viewDidLoad() {
        view?.showDetail(forArticle: article)
    }
    
    // TODO: implement presentation methods
}

extension NewsDetailPresenter: NewsDetailInteractorOutput {
    // TODO: implement interactor output methods
}
