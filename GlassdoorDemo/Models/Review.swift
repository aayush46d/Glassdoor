//
//  Review.swift
//  GlassdoorDemo
//
//  Created by Aayush Srivastava on 3/9/19.
//  Copyright © 2019 Aayush Srivastava. All rights reserved.
//

//""
//""
//"currentJob" - if value is 1, this is a "Current Employee", otherwise this is a "Former Employee"
//
//
//"overallNumeric" - the star rating
//
//"reviewDateTime"


import Foundation

struct Review: Codable {//review
    let advice:String?
    let cons: String?
    let jobTitle: String?
    let pros: String?
    let headline: String?
    let currentJob: Bool?
    let overallNumeric: Int?
    let reviewDateTime: String?
}
