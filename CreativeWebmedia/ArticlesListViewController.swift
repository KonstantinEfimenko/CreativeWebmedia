//
//  ArticlesListViewControllerTableViewController.swift
//  CreativeWebmedia
//
//  Created by Konstantin Efimenko on 3/3/16.
//  Copyright © 2016 Kostiantyn Iefymenko. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ArticlesListViewController: UITableViewController, ArticlesCollectionControllerDelegate {
    
    let articlesCollection = ArticlesCollectionController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        articlesCollection.delegate = self
        articlesCollection.getArticles()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articlesCollection.articles.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ArticleCell
        
        let article = articlesCollection.articles[indexPath.row]
        cell.articlePreview = article

        return cell
    }
    
    // MARK: - ArticlesListControllerDelegate implementation
    
    func articlesCollectionController(collectionController: ArticlesCollectionController, articlesDidLoad newArticles: [ArticlePreview]) {
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let source = articlesCollection.articles[indexPath.row].source
        performSegueWithIdentifier("content", sender: source)
    }

    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        
        return tableView.frame.width*0.58 + 48+68+21+32
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController
        if vc.isKindOfClass(ContentViewController){
            (vc as! ContentViewController).source = sender as! String
        }
    }
   

}
