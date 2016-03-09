//
//  ArticlePreview.swift
//  CreativeWebmedia
//
//  Created by Konstantin Efimenko on 3/4/16.
//  Copyright © 2016 Kostiantyn Iefymenko. All rights reserved.
//

import UIKit

class ArticlePreview: NSObject {
    var title: String?
    var text: String?
    var author: String?
    var picture: String?
    var source: String?
    
    init(dic: NSDictionary) {
        
        super.init()
        
        for key in dic.allKeys as! [String]{
            if self.respondsToSelector(NSSelectorFromString(key)) {
                let value = dic.objectForKey(key) as? String
                self.setValue(value, forKey: key)
            }
        }
        
    }
}
