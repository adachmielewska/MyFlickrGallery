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
            tableView.register(UINib(nibName: "GalleryImageCell", bundle: nil), forCellReuseIdentifier: "GalleryImageCell")
            tableView.rowHeight = 270
            tableView.tableFooterView = UIView()
            tableView.allowsSelection = false
            tableView.dataSource = self
            tableView.delegate = self
        }
    }

    init() {
        super.init(nibName: "GalleryViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let service = NetworkService(serviceConfig: ServiceConfig())
        PostTask().execute(in: service, onComplete: { posts in
            print("onComplete")
        }, onError: {_,_ in
            print("error")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension GalleryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GalleryImageCell", for: indexPath) as? GalleryImageCell {
            cell.update()
            return cell
        }
        
        return UITableViewCell()
    }
}

extension GalleryViewController: UITableViewDelegate {
    
}

