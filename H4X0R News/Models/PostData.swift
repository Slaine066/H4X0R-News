//
//  PostData.swift
//  H4X0R News
//
//  Created by Giuseppe Gioi on 24/03/2020.
//  Copyright © 2020 Giuseppe Gioi. All rights reserved.
//

import Foundation

struct Result: Codable {
    let hits: [Post]
}

struct Post: Codable, Identifiable {
    var id: String {    // Need the Id property for the Identifiable Protocol.
                        // Used a Computed Property, in this way it returns the objectID (also that is unique).
        return objectID
    }
    let title: String
    let url: String?
    let points: Int
    let objectID: String
}
