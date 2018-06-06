//
//  VideoModel.swift
//  YoutubeApp
//
//  Created by Christopher on 06.06.18.
//  Copyright © 2018 Christopher. All rights reserved.
//

import UIKit

class DataService: NSObject {
    
    //Create a Static Video Obj and push it into a Array.
    func getStaticVideos() -> [Video]{
    
        // Create a Array for Videos
        var videos = [Video]()
    
        // Create a Video Object
        let video1 = Video()
    
        // Add properties to the Obj
        video1.videoId = "sdsjv345bcfd"
        video1.videoTitle = "Static Data Test"
        video1.videoComments = "Static Comments Test"
        
        // Put the Obj in the Array
        videos.append(video1)
        
        return videos
    }
}
