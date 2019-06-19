//
//  ReusableView.swift
//  ViperNews
//
//  Created by Agus Cahyono on 18/06/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

