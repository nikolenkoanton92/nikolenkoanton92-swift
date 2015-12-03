//
//  Skill.swift
//  nikolenkoanton92
//
//  Created by Anton Nikolenko on 12/1/15.
//  Copyright © 2015 Anton Nikolenko. All rights reserved.
//

import UIKit

class Skill:NSObject, NSCoding{
  
  // MARK: Properties
  
  struct PropertyKey{
    static let nameKey = "name"
    static let ratingKey = "rating"
  }
  
  var name: String
  var rating: Int
  
  // MARK: Initialization
  
  init?(name: String, rating: Int){
    
    // Initialize stored properties
    
    self.name = name
    self.rating = rating
    
    super.init()
    
    if name.isEmpty || rating < 0 {
      return nil
    }
    
  }

  
  // MARK: NSCoding
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(name,forKey: PropertyKey.nameKey)
    aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)
  }
  
  required convenience init?(coder aDecoder: NSCoder) {
    let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
    let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
    
    self.init(name: name, rating: rating)
  }
}
