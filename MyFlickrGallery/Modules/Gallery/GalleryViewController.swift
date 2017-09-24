//
//  GalleryViewController.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 21.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: galleryImageCellIdentifier, bundle: nil), forCellReuseIdentifier: galleryImageCellIdentifier)
            tableView.rowHeight = 270
            tableView.tableFooterView = UIView()
            tableView.dataSource = self
            tableView.delegate = self
            tableView.separatorStyle = .none
            tableView.addSubview(refreshControl)
        }
    }
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(refreshControl:)), for: UIControlEvents.valueChanged)
        return refreshControl
    }()
    
    private let galleryViewModel: GalleryViewModel
    private let galleryImageCellIdentifier = "GalleryImageCell"

    init(galleryViewModel: GalleryViewModel) {
        self.galleryViewModel = galleryViewModel
        super.init(nibName: "GalleryViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        galleryViewModel.delegate = self
        navigationController?.navigationBar.barTintColor = UIColor.darkGray
        navigationController?.navigationBar.tintColor = UIColor.magenta
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: galleryViewModel.orderTitle(), style: .plain, target: self, action: #selector(handleOrder(barItem:)))
    }
    
    @objc func handleOrder(barItem: UIBarButtonItem) {
        galleryViewModel.orderFeed()
    }
    
    private func refreshOrderButton() {
        navigationItem.rightBarButtonItem?.title = galleryViewModel.orderTitle()
    }

    @objc func handleRefresh(refreshControl: UIRefreshControl) {
        galleryViewModel.refreshContent()
        refreshControl.endRefreshing()
    }
}

extension GalleryViewController: GalleryViewModelDelegate {
    
    func updated() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
            self?.refreshOrderButton()
        }
    }
}

extension GalleryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return galleryViewModel.feed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: galleryImageCellIdentifier, for: indexPath) as? GalleryImageCell {
            cell.update(galleryCellViewModel: galleryViewModel.feed[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

extension GalleryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsViewController = DetailsGalleryViewController(viewModel: galleryViewModel.feed[indexPath.row])
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
