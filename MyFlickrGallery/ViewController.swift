//
//  ViewController.swift
//  MyFlickrGallery
//
//  Created by Ada Chmielewska on 21.09.2017.
//  Copyright © 2017 Ada Chmielewska. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let service = NetworkService(serviceConfig: ServiceConfig())
        PostTask().execute(in: service, onComplete: { posts in
            print("onComplete")
        }, onError: {_,_ in
            print("error")
        })
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

