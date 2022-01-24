//
//  VideoTableViewCell.swift
//  Youtube-Tutorial-App
//
//  Created by Hayden McDowall on 24/01/22.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video) {
        
        self.video = v
        
        // Ensures there is a video
        guard self.video != nil else{
            return
        }
        
        // Setting title
        self.titleLabel.text = video?.title
        
        // setting date
        let df = DateFormatter()
        df.dateFormat = Constants.DATE_FORMAT
        self.dateLabel.text = df.string(from: video!.published)
        
        // Setting thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        // Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            // Set the thmbnail
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
            
        }
        
        let url = URL(string: self.video!.thumbnail)
        
        //getting shared url
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                // Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                // Checking if the downloaded url matches video thumbnail
                if url!.absoluteString != self.video?.thumbnail {
                    //video cell has been recycled and no longer matches
                    return
                }
                
                //create image object
                let image = UIImage(data: data!)
                
                // Set image view
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        //Start dataTask
        dataTask.resume()
        
    }

}
