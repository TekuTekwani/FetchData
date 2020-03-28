//
//  Item.swift
//  checkData
//
//  Created by Hemant Tekwani on 22/03/20.
//  Copyright © 2020 Hemant Tekwani. All rights reserved.
//

import Foundation


struct Item : Codable {
    let name : String?
    let description : String?
    let imageUrl : String?
}

struct Items : Codable {
    let items : [Item]
}




