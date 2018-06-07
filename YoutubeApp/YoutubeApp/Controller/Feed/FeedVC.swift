//
//  FirstViewController.swift
//  YoutubeApp
//
//  Created by Christopher on 05.06.18.
//  Copyright © 2018 Christopher. All rights reserved.
//

import UIKit

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    //Vars
    var videos:[Video] = [Video]()
    
    //Outlets
    @IBOutlet weak var feedTableView: UITableView!
    
    
    //Actions
    
    
    //Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        feedTableView.dataSource = self
        feedTableView.delegate = self
        
        self.videos = DataService().getStaticVideos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //---Table View---
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
//        let videoTitle = videos[indexPath.row].videoTitle
        
        // Present the Cell View
        if let cell = feedTableView.dequeueReusableCell(withIdentifier: "CellView") as? CellView{
            
//            cell.textLabel?.text = videoTitle
            
            // Get the Video from the Array
            let video:Video = videos[indexPath.row]
            // Push Data to the Cell View
            cell.titelLabel?.text = video.videoTitle
            
            return cell
        }else{
            print("Chris: CellView Error. 😱")
            return CellView()
        }
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
   
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
            return videos.count
    }


}
