//
//  MainAppViewController.swift
//  ViperNews
//
//  Created by Agus Cahyono on 19/06/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

class MainAppViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addTabbarItem()
    }
    
    func addTabbarItem() {
        
        let beritaPage = NewsRouter.assembleModule()
        beritaPage.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 0)
        beritaPage.tabBarItem.title = "Berita"
        
        let videoPage = VideosRouter.assembleModule()
        videoPage.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 1)
        
        self.viewControllers = [beritaPage, videoPage]
        
    }

}
