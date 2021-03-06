//
//  ConstantsTemplate.swift
//  Youtube-Tutorial-App
//
//  Created by Hayden McDowall on 24/01/22.
//

import Foundation

struct ConstantsTemplate {
    
    static var API_KEY = ""
    static var PLAYLIST_ID = "UU2D6eRvCeMtcF5OGHf1-trw"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var VIDEOCELL_ID = "VideoCell"
    static var YT_EMBED_URL = "https://www.youtube.com/embed/"
    static var DATE_FORMAT = "EEEE, MMM d, yyyy"
}
