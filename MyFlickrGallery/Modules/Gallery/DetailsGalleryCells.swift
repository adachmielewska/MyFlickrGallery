//
//  DetailsGalleryCells.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 24.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import UIKit

class DetailsGalleryPhotoCell: UITableViewCell {
    
    @IBOutlet private weak var photoView: UIImageView!
    
    func configure(image: UIImage) {
        photoView.image = image
    }
}

class DetailsGalleryTextCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    func configure(title: String) {
        titleLabel.text = title
    }
}

class DetailsGallerySectionCell: UITableViewCell {
    
    @IBOutlet private weak var sectionTitleLabel: UILabel!
    
    func configure(title: String) {
        sectionTitleLabel.text = title
    }
}
