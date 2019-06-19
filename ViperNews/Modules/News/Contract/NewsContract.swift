//
//  NewsContract.swift
//  ViperNews
//
//  Created by Agus Cahyono on 18/06/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

protocol NewsView: IndicateTableView {
    // TODO: Declare view methods
    
    var presenter: NewsPresentation! { get set }
    func showEmptyData()
    func showNewsData(_ data: [Article])
}

protocol NewsPresentation: class {
    // TODO: Declare presentation methods
    var view: NewsView? { get set }
    var interactor: NewsUseCase! { get set }
    var router: NewsWireframe! { get set }
    
    func viewDidLoad()
    func didSelectedNews(_ news: Article)
    func didReloadFetchNews()
    func didSelectOtherCategory(_ category: String)
}

protocol NewsUseCase: class {
    // TODO: Declare use case methods
    var output: NewsInteractorOutput! { get set }
    
    func fetchNews()
    func fetchOtherCategory(_ category: String)
}

protocol NewsInteractorOutput: class {
    // TODO: Declare interactor output methods
    func newsFetched(_ news: News)
    func otherCategoryFetched(_ news: News)
    
    func failedFetchNews()
    func failedFetchOtherCategory()
    
}

protocol NewsWireframe: class {
    // TODO: Declare wireframe methods
    var viewController: UIViewController? { get set }
    
    func openNewsDetail(withNews news: Article)
    
    static func assembleModule() -> UIViewController
}
