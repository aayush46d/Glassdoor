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
    }
}

// MARK: Table View Functions
extension ReviewsTableViewController {
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(reviews.count)
        return reviews.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as! ReviewTableViewCell
        cell.review = reviews[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
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
            //Implement JSON decoding and parsing
            do {
                let responseData = try JSONDecoder().decode(Response.self, from: data)
                
                //Get back to the main queue
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
