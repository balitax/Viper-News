//
//  NewsDetailContract.swift
//  ViperNews
//
//  Created by Agus Cahyono on 18/06/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

protocol NewsDetailView: ReusableView {
    // TODO: Declare view methods
    var presenter: NewsDetailPresentation! { get set }
    func showDetail(forArticle article: Article)
}

protocol NewsDetailPresentation: class {
    // TODO: Declare presentation methods
    var view: NewsDetailView? { get set }
    
    func viewDidLoad()
}

protocol NewsDetailUseCase: class {
    // TODO: Declare use case methods
}

protocol NewsDetailInteractorOutput: class {
    // TODO: Declare interactor output methods
}

protocol NewsDetailWireframe: class {
    // TODO: Declare wireframe methods
    static func assembleModule(_ article: Article) -> UIViewController
}
