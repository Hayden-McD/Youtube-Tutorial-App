//
//  ViewController.swift
//  Youtube-Tutorial-App
//
//  Created by Hayden McDowall on 21/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.getVideos()
    }
}
