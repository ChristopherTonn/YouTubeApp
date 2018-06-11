//
//  FirstViewController.swift
//  YoutubeApp
//
//  Created by Christopher on 05.06.18.
//  Copyright © 2018 Christopher. All rights reserved.
//

import UIKit

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource, DataServiceDelegate, UISearchBarDelegate{
    
    
    
    
    //Vars
    var videos:[Video] = [Video]()
    var filterdVideos:[Video] = [Video]()
    var selectedVideo:Video?
    let ds:DataService = DataService()
    
    //Outlets
    @IBOutlet weak var feedTableView: UITableView!
    
    //Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatSearchBar()
        
        self.feedTableView.dataSource = self
        self.feedTableView.delegate = self
        
        //Get the Videos
        ds.getDynamicVideos()
        self.ds.delegate = self
    }
    
    //---Search Bar---
    
    //Create Searchbar in Navigation Controller
    func creatSearchBar(){
        
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Enter Video Title"
        searchBar.delegate = self
        
        self.navigationItem.titleView = searchBar
    }
    
    //Filter The Array with the Text Input
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty{
            filterdVideos = videos
        }else {
            filterdVideos = self.videos.filter { (videos) -> Bool in
                return videos.videoTitle.lowercased().contains(searchText.lowercased())
            }
        }
        self.feedTableView?.reloadData()
    }
    
    


    //---Data Service Delegate---
    
    //Check the Data
    func dataIsReady(){
        self.videos = self.ds.videoArray
        self.filterdVideos = videos
        self.feedTableView?.reloadData()
    }

    //---Table View---
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Present the Cell View
        let cell = feedTableView.dequeueReusableCell(withIdentifier: "CellView")!
   
        // Get the Video from the Array
        let videoTitel = self.filterdVideos[indexPath.row].videoTitle
        
        let label = cell.viewWithTag(2) as! UILabel
        label.text = videoTitel

        // Create a URL Object
        let videoThumbnailUrlString = self.filterdVideos[indexPath.row].videoThumbnail
        let videoThumbnailUrl = URL(string: videoThumbnailUrlString)
        //Create URL Request
      
        if videoThumbnailUrl != nil {
            let request = URLRequest(url: videoThumbnailUrl!)
            let session = URLSession.shared
            // Create a datatask and pass in the request
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) in
                
                DispatchQueue.main.async {
                    
                    // Get a reference to the imageview element fo the cell
                    let imageView = cell.viewWithTag(1) as! UIImageView
                    // Create an image object from the data and asign it into the imageview
                    imageView.image = UIImage(data: data!)
                }
            })
            dataTask.resume()
            
        }
        return cell
    }
        
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filterdVideos.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Wich video is selected
        self.selectedVideo = self.filterdVideos[indexPath.row]
        //Call the Segue
        self.performSegue(withIdentifier: "goToShowVideo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Make a refferenc to ShowView
        guard let showVideoVC = segue.destination as? ShowVideoVC else {return}
        //give the reff the video property
        showVideoVC.selectedVideo = self.selectedVideo
    }

}


