//
//  DetailsGalleryViewController.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 24.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import UIKit

enum DetailsGallerySections: Int {
    
    case photo = 0, title, author, tags, dates
    
    func sectionTitle() -> String? {
        switch self {
        case .title:
            return "TITLE"
        case .author:
            return "AUTHOR"
        case .tags:
            return "TAGS"
        case .dates:
            return "DATES"
        default:
            return nil
        }
    }
    
    func data(galleryCellModel: GalleryCellViewModel) -> [String] {
        switch self {
        case .title:
            return [galleryCellModel.title]
        case .author:
            return [galleryCellModel.author]
        case .tags:
            return [galleryCellModel.tags]
        case .dates:
            return [galleryCellModel.takenAt, galleryCellModel.publishedAt]
        default:
            return []
        }
    }
    
    func numberOfRows() -> Int {
        switch self {
        case .dates:
            return 2
        default:
            return 1
        }
    }
}

class DetailsGalleryViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "DetailsGalleryPhotoCell", bundle: nil), forCellReuseIdentifier: "DetailsGalleryPhotoCell")
            tableView.register(UINib(nibName: "DetailsGalleryTextCell", bundle: nil), forCellReuseIdentifier: "DetailsGalleryTextCell")
            tableView.register(UINib(nibName: "DetailsGallerySectionCell", bundle: nil), forCellReuseIdentifier: "DetailsGallerySectionCell")
            tableView.allowsSelection = false
            tableView.dataSource = self
            tableView.delegate = self
            tableView.separatorStyle = .none
        }
    }
    
    let viewModel: GalleryCellViewModel
    
    init(viewModel: GalleryCellViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsGalleryViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension DetailsGalleryViewController: UITableViewDataSource, UITableViewDelegate {
    
    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsGallerySectionCell") as? DetailsGallerySectionCell {
            if let title = DetailsGallerySections.init(rawValue: section)?.sectionTitle() {
                cell.configure(title: title)
                return cell
            }
           return nil
        }
        return nil
    }
    
    internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 20
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return DetailsGallerySections.dates.rawValue + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (DetailsGallerySections.init(rawValue: section)?.numberOfRows())!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case DetailsGallerySections.photo.rawValue:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsGalleryPhotoCell", for: indexPath) as? DetailsGalleryPhotoCell {
                cell.configure(image: #imageLiteral(resourceName: "kotek"))
                return cell
            }
        default:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsGalleryTextCell", for: indexPath) as? DetailsGalleryTextCell {
                cell.configure(title: (DetailsGallerySections.init(rawValue: indexPath.section)?.data(galleryCellModel: viewModel)[indexPath.row])!)
                return cell
            }

        }
        return UITableViewCell()
    }
}


