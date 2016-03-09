//
//  ContentViewController.swift
//  CreativeWebmedia
//
//  Created by Konstantin Efimenko on 3/8/16.
//  Copyright © 2016 Kostiantyn Iefymenko. All rights reserved.
//

import UIKit
import Alamofire

class ContentViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView?
    var source: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = NSURLRequest(URL: NSURL(string: source!)!);
        webView?.loadRequest(request)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
