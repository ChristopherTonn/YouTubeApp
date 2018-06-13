//
//  ShowVideoVC.swift
//  YoutubeApp
//
//  Created by Christopher on 06.06.18.
//  Copyright © 2018 Christopher. All rights reserved.
//

import UIKit

class ShowVideoVC: UIViewController {
   
    
    //Vars
    var selectedVideo:Video?
    
    //Outlets
    
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoWebView: UIWebView!
    @IBOutlet weak var commentTextLabel: UILabel!
    
    
    //Actions
    
    
    //Methods
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
       setVideoView()
    }
    
    
    
    // Set up for Video Show VC
    func setVideoView(){
        //If you get the selected Video Data put it in the UI Fields, Else Print a Message and return
        if let vid = self.selectedVideo{
            self.videoTitleLabel.text = vid.videoTitle
            self.commentTextLabel.text = vid.videoComments
            
            setVideoPlayer()
        }else{
            print("Chris: Vid dont get the Data. 😱")
            return
        }
    }
    
    //Set the Player
    func setVideoPlayer(){
        
        //Get Video ID
        guard let vid = self.selectedVideo?.videoId else {return}
        //Auto Size for the Embed Player
        let width = self.view.frame.size.width
        let height = width/320 * 180
        
        //Get the Embed Player
        let videoHtmlEmbed = "<html><head><style type=\"text/css\">body {background-color: transparent;color: white;}</style></head><body style=\"margin:0\"><iframe frameBorder=\"0\" height=\"" + String(describing: height) + "\" width=\"" + String(describing: width) + "\" src=\"http://www.youtube.com/embed/" + vid + "?showinfo=0&modestbranding=1&frameborder=0&rel=0\"></iframe></body></html>"
        
        //Load the Embed Player
        self.videoWebView.loadHTMLString(videoHtmlEmbed, baseURL: nil)
    }
    
}
