//
//  Model.swift
//  Youtube-Tutorial-App
//
//  Created by Hayden McDowall on 24/01/22.
//

import Foundation

class Model {
    
    func getVideos() {
        
        //Create a url object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else{
            return
        }
        
        //Get a URLSession object
        let session = URLSession.shared
        
        //Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            if error != nil || data == nil {
                return
            }
            
            do {
                //parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                dump(response)
            }
            catch {
                
            }
        }
        
        //Kick off the task
        dataTask.resume()
        
    }
    
}
