//
//  Skill.swift
//  nikolenkoanton92
//
//  Created by Anton Nikolenko on 12/1/15.
//  Copyright © 2015 Anton Nikolenko. All rights reserved.
//

import UIKit

class Skill{
  
  // MARK: Properties
  
  var name: String
  var rating: Int
  
  // MARK: Initialization
  
  init?(name: String, rating: Int){
    
    // Initialize stored properties
    
    self.name = name
    self.rating = rating
    
    if name.isEmpty || rating < 0 {
      return nil
    }
    
  }

}
