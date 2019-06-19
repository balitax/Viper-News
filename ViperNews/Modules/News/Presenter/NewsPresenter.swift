//
//  NewsPresenter.swift
//  ViperNews
//
//  Created by Agus Cahyono on 18/06/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

class NewsPresenter {

    // MARK: Properties

    weak var view: NewsView?
    var router: NewsWireframe!
    var interactor: NewsUseCase!
    
    var news: News? {
        didSet {
            guard let newsArticle = news?.articles else { return }
            if newsArticle.count > 0 {
                view?.showNewsData(newsArticle)
            } else {
                view?.showEmptyData()
            }
        }
    }
    
}

extension NewsPresenter: NewsPresentation {
    
    func didSelectOtherCategory(_ category: String) {
        interactor.fetchOtherCategory(category)
        view?.showLoading()
    }
    
    
    func didReloadFetchNews() {
        interactor.fetchNews()
        view?.showLoading()
    }
    
    func didSelectedNews(_ news: Article) {
        router.openNewsDetail(withNews: news)
    }
    
    func viewDidLoad() {
        interactor.fetchNews()
        view?.showLoading()
    }
    
    
    // TODO: implement presentation methods
}

extension NewsPresenter: NewsInteractorOutput {
    
    func otherCategoryFetched(_ news: News) {
        self.news  = news
        view?.hideLoading()
    }
    
    func failedFetchOtherCategory() {
        view?.showEmptyData()
        view?.hideLoading()
    }
   
    func newsFetched(_ news: News) {
        self.news = news
        view?.hideLoading()
    }
    
    func failedFetchNews() {
        view?.showEmptyData()
        view?.hideLoading()
    }
    
    // TODO: implement interactor output methods
}
