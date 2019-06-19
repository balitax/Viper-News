//
//  APIServices.swift
//  ViperNews
//
//  Created by Agus Cahyono on 18/06/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class APIServices {
    
    
    /// FETCH HEADLINE NEWS
    ///
    /// - Returns: return
    static func fetchNews() -> Observable<News> {
        
        return Observable<News>.create({ observer -> Disposable in
            print("URL :", Endpoints.News.headline.url)
            let request = Alamofire
                .request(Endpoints.News.headline.url, method: .get)
                .validate()
                .responseString(completionHandler: { response in
                    switch response.result {
                    case .success:
                        guard let getData = response.data else {
                            return
                        }
                        
                        do {
                            let decoded = try JSONDecoder().decode(News.self, from: getData)
                            observer.onNext(decoded)
                            observer.onCompleted()
                        } catch (let error) {
                            observer.onError(error)
                        }
                        
                    case .failure(let error):
                        observer.onError(error)
                    }
                    
                })
            return Disposables.create(with: {
                request.cancel()
            })
            
        })
        
    }
    
    
    /// FETCH NEWS WITH CATEGORY
    ///
    /// - Parameter category: category
    /// - Returns: return value description
    static func fetchNewsCategory(_ category: String) -> Observable<News> {
        
        return Observable<News>.create({ observer -> Disposable in
            print("URL :", Endpoints.News.category(category: category).url)
            let request = Alamofire
                .request(Endpoints.News.category(category: category).url, method: .get)
                .validate()
                .responseString(completionHandler: { response in
                    switch response.result {
                    case .success:
                        guard let getData = response.data else {
                            return
                        }
                        
                        do {
                            let decoded = try JSONDecoder().decode(News.self, from: getData)
                            observer.onNext(decoded)
                            observer.onCompleted()
                        } catch (let error) {
                            observer.onError(error)
                        }
                        
                    case .failure(let error):
                        observer.onError(error)
                    }
                    
                })
            return Disposables.create(with: {
                request.cancel()
            })
            
        })
        
    }
    
    /// FETCH HEADLINE VIDEOS
    ///
    /// - Returns: return
    static func fetchVideos() -> Observable<Videos> {
        
        return Observable<Videos>.create({ observer -> Disposable in
            print("URL :", Endpoints.News.video.url)
            let request = Alamofire
                .request(Endpoints.News.video.url, method: .get)
                .validate()
                .responseString(completionHandler: { response in
                    switch response.result {
                    case .success:
                        guard let getData = response.data else {
                            return
                        }
                        
                        do {
                            let decoded = try JSONDecoder().decode(Videos.self, from: getData)
                            observer.onNext(decoded)
                            observer.onCompleted()
                        } catch (let error) {
                            observer.onError(error)
                        }
                        
                    case .failure(let error):
                        observer.onError(error)
                    }
                    
                })
            return Disposables.create(with: {
                request.cancel()
            })
            
        })
        
    }
    
}
