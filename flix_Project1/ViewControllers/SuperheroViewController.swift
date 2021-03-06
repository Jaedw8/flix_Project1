//
//  SuperheroViewController.swift
//  flix_Project1
//
//  Created by Jasmine Edwards on 2/11/18.
//  Copyright © 2018 Jasmine Edwards. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class SuperheroViewController: UIViewController, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collentionView: UICollectionView!
    
    
    var movies: [[String: Any]] = []
    
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        collentionView.dataSource = self
        fetchMovies()
        
        
        //self.collectionView!.register(UIViewController.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        
    }
    
    func  collectionView(_ collentionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return movies.count
        
    }
    
    
    func collectionView(_ collentionView: UICollectionView, cellForItemAt indexPath: IndexPath)  -> UICollectionViewCell
    {
        
        
        let cell = collentionView.dequeueReusableCell(withReuseIdentifier: "Poster Cell", for: indexPath) as! PosterCell
        
        let movie = movies[indexPath.item]
        
        if let posterPathString = movie ["poster_path"] as? String
        {
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            let posterURL = URL(string:baseURLString + posterPathString)!
            cell.posterImageView.af_setImage(withURL: posterURL)
            
        }
        return cell
    }
    
    func fetchMovies()
    {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main )
        
        
        let task = session.dataTask(with: request) { (data, response, error) in
            //This will run when the network request returns
            
            if let error = error
            {
                print(error.localizedDescription)
                
            }
            else if let data = data
            {
                
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                
                
                let movies = dataDictionary["results"] as! [[String:Any]]
                self.movies = movies
                self.collentionView.reloadData()
                //self.activityIndicator.stopAnimating()
                //self.refreshControl.endRefreshing()
                
                
            }
        }
        task.resume()
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

