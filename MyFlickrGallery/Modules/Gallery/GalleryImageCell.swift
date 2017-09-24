//
//  GalleryImageCell.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 24.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import UIKit
import SDWebImage

class GalleryImageCell: UITableViewCell {
    
    @IBOutlet private weak var photoView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var gradientView: UIView!
    
    func update(galleryCellViewModel: GalleryCellViewModel) {
        photoView.sd_setShowActivityIndicatorView(true)
        photoView.sd_setIndicatorStyle(.gray)
        photoView.sd_setImage(with: galleryCellViewModel.imageURL, placeholderImage: nil)
        titleLabel.text = galleryCellViewModel.title
        gradientView.isHidden = galleryCellViewModel.title.trimmingCharacters(in: .whitespaces).isEmpty        
    }
}
