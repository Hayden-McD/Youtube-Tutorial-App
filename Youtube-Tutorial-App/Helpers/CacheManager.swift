//
//  CacheManager.swift
//  Youtube-Tutorial-App
//
//  Created by Hayden McDowall on 24/01/22.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache (_ url:String, _ data:Data?) {
        
        //Stores the image data and uses url as the key
        cache[url] = data
        
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        
        // Try to get the data for the specified url
        return cache[url]
        
    }
    
}
