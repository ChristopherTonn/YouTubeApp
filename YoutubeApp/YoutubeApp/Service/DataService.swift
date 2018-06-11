//
//  VideoModel.swift
//  YoutubeApp
//
//  Created by Christopher on 06.06.18.
//  Copyright © 2018 Christopher. All rights reserved.
//

import UIKit
import Alamofire


protocol DataServiceDelegate{
    
    //Checking for the Data
   func dataIsReady()
}

class DataService: NSObject {
    
    //Constants for ID's and KEY's
    let API_KEY = "AIzaSyAaIP2crxxz2IfhhrnglS6mngqBuSuIM4w"
    let PLAYLIST_ID = "PL66OD4JjS_2PX2af0PdORJbVwcw9XE01M"
    
    //Global Video Array
    var videoArray = [Video]()
    
    //DataService Delegate var
    var delegate:DataServiceDelegate?
    
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
                            
                            //Get the JSON Obj as Dic
                            if let JSON = response.result.value as? [String: Any]{
                                
                                //Local Video Array
                                var aForLocalVideo = [Video]()
                                
                                //Loop thru the Items
                                for video in JSON["items"] as! NSArray{
                                    
                                    //Make a Video Obj
                                    let videoObj = Video()
                                    videoObj.videoId = (video as AnyObject).value(forKeyPath:"snippet.resourceId.videoId") as! String
                                    videoObj.videoTitle = (video as AnyObject).value(forKeyPath:"snippet.title") as! String
                                    videoObj.videoThumbnail = (video as AnyObject).value(forKeyPath:"snippet.thumbnails.high.url") as! String
                                    
                                    aForLocalVideo.append(videoObj)
                                }
                                
                                //Put the Local Array to the Global Array
                                self.videoArray = aForLocalVideo
                                print("Chris: \(self.videoArray)")
                                
                            }else{
                                print("Chris: Houston wir haben ein problem. We Don't get the Data.")
                                return
                            }
                            
                            //Notify the delegate if data is ready
                            if self.delegate != nil {
                                 self.delegate!.dataIsReady()
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
        video1.videoId = "uVteeLDOlyk"
        video1.videoTitle = "Static Data Test"
        video1.videoComments = "Static Comments Test"
        
        // Put the Obj in the Array
        videos.append(video1)
        
        return videos
    }
}
