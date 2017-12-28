//
//  Albums.swift
//  FamilyAlbum
//
//  Created by admin on 12/28/17.
//  Copyright © 2017 kimboss. All rights reserved.
//
import Parse

import Foundation

class Albums: PFObject, PFSubclassing {
    static func parseClassName() -> String {
        return "Albums"
    }
    
    
    @NSManaged var message: String?
    @NSManaged var image: PFFile?
    
    
    override func query() -> PFQuery<PFObject?> {
        let query = PFQuery(className: Albums.parseClassName())
        return query
    }
}
