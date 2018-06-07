//
//  VideoModel.swift
//  YoutubeApp
//
//  Created by Christopher on 06.06.18.
//  Copyright © 2018 Christopher. All rights reserved.
//

import UIKit
import Alamofire

class DataService: NSObject {
    
    let API_KEY = "AIzaSyAaIP2crxxz2IfhhrnglS6mngqBuSuIM4w"
    let PLAYLIST_ID = "PL66OD4JjS_2PX2af0PdORJbVwcw9XE01M"
    
    //Get Data from the Youtube Api
    func getDynamicVideos(){
        //Make a GET Request
        Alamofire.request("https://www.googleapis.com/youtube/v3/playlistItems",
                          //Give the Params in a Dic
                          parameters: ["part":"snippet",
                                       "playlistId":PLAYLIST_ID,
                                       "key":API_KEY],
                          encoding: URLEncoding.default).responseJSON {
                            (response) -> Void in
                            
                            //Get the JSON Obj as DIc
                            if let JSON = response.result.value as? [String: Any]{
                                
                                //Loop thru the Items
                                for video in JSON["items"] as! NSArray{
                                    print("Chris: \(video) ")
                                }
                            }
        }
    }
    
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
