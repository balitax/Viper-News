//
//  Video.swift
//  ViperNews
//
//  Created by Agus Cahyono on 19/06/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation


struct Videos: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}
