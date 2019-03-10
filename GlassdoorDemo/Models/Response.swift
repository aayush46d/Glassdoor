//
//  Response.swift
//  GlassdoorDemo
//
//  Created by Aayush Srivastava on 3/9/19.
//  Copyright © 2019 Aayush Srivastava. All rights reserved.
//

import Foundation
struct Response: Codable {
    let response: [String: [Result]]
}
