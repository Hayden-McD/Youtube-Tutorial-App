//
//  ViewController.swift
//  Youtube-Tutorial-App
//
//  Created by Hayden McDowall on 21/01/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set itself as the data source
        tableView.dataSource = self
        tableView.delegate = self
        model.delegate = self
        
        model.getVideos()
    }
    
    // MARK: - Model Methods
    
    func videosFetched(_ videos: [Video]) {
        
        // Set returned videos to property
        self.videos = videos
        
        // Refresh the tableView
        tableView.reloadData()
        
    }
        
    
    // MARK: - TableViewMethods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        //Configure cell with data
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        
        //Return the cell
        return cell
    }
    
    
}
