//
//  ArticlViewCell.swift
//  TeslaNewsApp
//
//  Created by Теона Магай on 05.05.2021.
//

import UIKit

class ArticlViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var publishedAtLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    func configure (with articl: Articl) {
        titleLabel.text = articl.title
        authorLabel.text = articl.author
        publishedAtLabel.text = articl.publishedAt
        descriptionLabel.text = articl.description
    }
}
