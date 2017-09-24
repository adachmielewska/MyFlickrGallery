//
//  DetailsGalleryViewController.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 24.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import UIKit
import SDWebImage

enum DetailsGallerySections: Int {
    
    case title = 0, author, tags, dates
    
    func sectionTitle() -> String {
        switch self {
        case .title:
            return "TITLE"
        case .author:
            return "AUTHOR"
        case .tags:
            return "TAGS"
        case .dates:
            return "DATES"
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
    
    private let textCellIdentifier = "DetailsGalleryTextCell"
    private let sectionCellIdentifier = "DetailsGallerySectionCell"
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: textCellIdentifier, bundle: nil), forCellReuseIdentifier: textCellIdentifier)
            tableView.register(UINib(nibName: sectionCellIdentifier, bundle: nil), forCellReuseIdentifier: sectionCellIdentifier)
            tableView.allowsSelection = false
            tableView.dataSource = self
            tableView.delegate = self
            tableView.separatorStyle = .none
        }
    }
    @IBOutlet private weak var photoView: UIImageView!
    
    let viewModel: GalleryCellViewModel
    
    init(viewModel: GalleryCellViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsGalleryViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        photoView.sd_setShowActivityIndicatorView(true)
        photoView.sd_setIndicatorStyle(.gray)
        photoView.sd_setImage(with: viewModel.imageURL, placeholderImage: nil)
    }
}

extension DetailsGalleryViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return DetailsGallerySections.dates.rawValue + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rows = DetailsGallerySections.init(rawValue: section)?.numberOfRows() else { return 1 }
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as? DetailsGalleryTextCell else { return UITableViewCell() }
        guard let title = DetailsGallerySections.init(rawValue: indexPath.section)?.data(galleryCellModel: viewModel)[indexPath.row] else { return UITableViewCell() }
        cell.configure(title: title)
        return cell
    }
}

extension DetailsGalleryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: sectionCellIdentifier) as? DetailsGallerySectionCell else {
            return nil
        }
        guard let title =  DetailsGallerySections.init(rawValue: section)?.sectionTitle() else { return nil }
        cell.configure(title: title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
}
