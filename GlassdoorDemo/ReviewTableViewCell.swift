//
//  ReviewTableViewCell.swift
//  GlassdoorDemo
//
//  Created by Aayush Srivastava on 3/9/19.
//  Copyright © 2019 Aayush Srivastava. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var profileImageLabel: UIImageView!
    @IBOutlet weak var currentJobLabel: UILabel!
    @IBOutlet weak var proStack: UIStackView!
    @IBOutlet weak var proHeadingLabel: UILabel!
    @IBOutlet weak var proTextLabel: UILabel!
    @IBOutlet weak var conStack: UIStackView!
    @IBOutlet weak var consHeadingLabel: UILabel!
    @IBOutlet weak var consTextLabel: UILabel!
    @IBOutlet weak var adviceStack: UIStackView!
    @IBOutlet weak var adviceHeadingLabel: UILabel!
    @IBOutlet weak var adviceTextLabel: UILabel!
    
    var review: Review? {
        didSet {
            setUpCell(with: review!)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension ReviewTableViewCell {
    //populate cell with data
    func setUpCell(with review: Review)  {
        if let headline = review.headline {
            headingLabel.isHidden = false;
            headingLabel.text = " \" \(headline) \"";
        } else {
            headingLabel.isHidden = true;
        }
        
        if let stars = review.overallNumeric {
            starsLabel.isHidden = false;
            starsLabel.text = "\(stars)";
        } else {
            starsLabel.isHidden = true;
        }
        
        if let currentJob = review.currentJob {
            currentJobLabel.isHidden = false
            var currentJobLabelText = currentJob ? "Current Employee - " : "Former Employee - "
            if let jobTitle = review.jobTitle {
                currentJobLabelText += jobTitle
            }
            currentJobLabel.text = currentJobLabelText
        }else {
            currentJobLabel.isHidden = true
        }
        
        if let proText = review.pros {
            proStack.isHidden = false
            proHeadingLabel.text = "Pro"
            proTextLabel.text = proText
        }else {
            proStack.isHidden = true
        }
        if let conText = review.pros {
            conStack.isHidden = false
            consHeadingLabel.text = "Con"
            consTextLabel.text = conText
        }else {
            conStack.isHidden = true
        }
        if let adviceText = review.advice {
            adviceStack.isHidden = false
            adviceHeadingLabel.text = "Advice"
            adviceTextLabel.text = adviceText
        }else {
            adviceStack.isHidden = true
        }
    }
}
