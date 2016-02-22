//
//  ArticleTableViewCell.swift
//  Tech-echo
//
//  Created by abdelrahman mohamed on 1/17/16.
//  Copyright © 2016 Abdulrhman dev. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleDescription: UITextView!
    @IBOutlet weak var articleTitle: UITextField!
    @IBOutlet weak var articleCategory: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
