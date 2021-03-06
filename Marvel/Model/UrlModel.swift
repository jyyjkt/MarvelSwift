//
//  UrlModel.swift
//  Marvel
//
//  Created by Albert Arroyo on 23/8/16.
//  Copyright © 2016 AlbertArroyo. All rights reserved.
//

import SwiftyJSON
import RealmSwift

class UrlModel: Object {
    
    let urlKey      = "url"
    let typeKey     = "type"
    
    dynamic var url: String?
    dynamic var type: String?
    
    override class func primaryKey() -> String? {
        return "url"
    }
    
    required convenience init?(json: JSON) {
        self.init()
        self.url = json[urlKey].string
        self.type = json[typeKey].string
    }
    
}
