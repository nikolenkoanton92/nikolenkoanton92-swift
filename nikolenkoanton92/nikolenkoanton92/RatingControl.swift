//
//  RatingControl.swift
//  nikolenkoanton92
//
//  Created by Anton Nikolenko on 11/29/15.
//  Copyright © 2015 Anton Nikolenko. All rights reserved.
//

import UIKit

class RatingControl: UIView {
  
  // Mark: Properties
  
  var rating = 0
  var ratingButtons = [UIButton]()
  
  // Mark: Initialization
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    let filledStarImage = UIImage(named: "filledStar")
    let emptyStarImage = UIImage(named: "emptyStar")
    
    for _ in 0..<5 {
      let button = UIButton()
      button.setImage(emptyStarImage, forState: .Normal)
      button.setImage(filledStarImage, forState: .Selected)
      button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
     
      button.adjustsImageWhenHighlighted = false
      
      button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
      ratingButtons += [button]
      addSubview(button)
    }
  }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
  
  override func intrinsicContentSize() -> CGSize {
    return CGSize(width: 240, height: 44)
  }

}
