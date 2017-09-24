//
//  GalleryImageCell.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 24.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import UIKit

class GalleryImageCell: UITableViewCell {
    
    @IBOutlet private weak var photoView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    func update() {
        photoView.image = #imageLiteral(resourceName: "kotek")
        titleLabel.text = "Kotek"
    }
}
