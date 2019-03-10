//
//  ReviewsTableViewController.swift
//  GlassdoorDemo
//
//  Created by Aayush Srivastava on 3/9/19.
//  Copyright © 2019 Aayush Srivastava. All rights reserved.
//

import UIKit

class ReviewsTableViewController: UITableViewController {

    var reviews = [Review]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchReviews()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 250
    }
    
    /*
     Note: Even though I used autolayout and stack views in my cell,
     while rotating the device the spacing between the stackview were changing
     automatically. To prevent this I have reloaded the table view when we rotate.
     */
    override func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        tableView.reloadData()
    }
}

// MARK: Table View Functions
extension ReviewsTableViewController {
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as! ReviewTableViewCell
        cell.review = reviews[indexPath.row]
        
        return cell
    }
    
}

// MARK: Network Call
extension ReviewsTableViewController {
    func fetchReviews() {
        
        let urlString = "https://raw.githubusercontent.com/vikrama/feed-json-sample/master/feed.json"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            do {
                let responseData = try JSONDecoder().decode(Response.self, from: data)
                
                DispatchQueue.main.async {
                    for result in responseData.response["results"]! {
                        if let review = result.review {
                            self.reviews.append(review)
                            print(review)
                        }
                    }
                    print("ReviewsTableViewController:: FetchReviews:: ReviewCount::\(self.reviews.count)")
                    self.tableView.reloadData()
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            }.resume()
    }
}
