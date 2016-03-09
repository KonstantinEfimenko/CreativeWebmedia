//
//  ArticlesCollectionController.swift
//  CreativeWebmedia
//
//  Created by Konstantin Efimenko on 3/3/16.
//  Copyright © 2016 Kostiantyn Iefymenko. All rights reserved.
//

import UIKit
import Alamofire
import OHHTTPStubs

protocol ArticlesCollectionControllerDelegate: class {

    func articlesCollectionController(collectionController: ArticlesCollectionController, articlesDidLoad newArticles:[ArticlePreview])
    
}

class ArticlesCollectionController: NSObject {
    
    weak var delegate: ArticlesCollectionControllerDelegate?
    var articles = [ArticlePreview]()
    
    func getArticles(){
        
        OHHTTPStubs.setEnabled(true)
        
        stub(isHost("api.privatbank.ua")) { _ in
            let stubPath = OHPathForFile("articleslist.json", self.dynamicType)
            return fixture(stubPath!, headers: ["Content-Type":"application/json"])
        }
        
        Alamofire.request(.GET, "https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5").responseJSON() {
            response in
            
            guard response.result.isSuccess else {
                print("Error while fetching tags: \(response.result.error)")
                return
            }
            
            guard let responseJSON = response.result.value as? [String: AnyObject],
                results = responseJSON["articles"] as? [AnyObject],
                firstResult = results.first else {
                    print("Invalid tag information received from the service")
                    return
            }
            
            var newArticles = [ArticlePreview]()
            let items = results.flatMap({ dict in
                
                newArticles.append(ArticlePreview(dic: dict as! NSDictionary))
            })
            
            self.articles.appendContentsOf(newArticles)
            self.delegate?.articlesCollectionController(self, articlesDidLoad: newArticles)
            
        }
    }
    
    
}
