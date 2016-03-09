//
//  ArticleCellTableViewCell.swift
//  CreativeWebmedia
//
//  Created by Konstantin Efimenko on 3/4/16.
//  Copyright © 2016 Kostiantyn Iefymenko. All rights reserved.
//

import UIKit
import Alamofire

class ArticleCell: UITableViewCell {
    
    var articlePreview: ArticlePreview? {
        didSet{
            titleLabel.text = articlePreview!.title
            contentLabel.text = articlePreview!.text
            authorLabel.text = articlePreview!.author
            pictureImageView.image = nil
            request(.GET, articlePreview!.picture!)
                .responseImage { response in
                    
                    if let image = response.result.value {
                        self.pictureImageView.image = image
                    }
            }
        }
    }
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
