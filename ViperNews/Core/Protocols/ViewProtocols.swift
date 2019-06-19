//
//  ViewProtocols.swift
//  ViperNews
//
//  Created by Agus Cahyono on 18/06/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

protocol ReusableView: class {}

protocol NibLoadableView: class {}

protocol IndicateTableView: class {
    func showLoading()
    func hideLoading()
}
