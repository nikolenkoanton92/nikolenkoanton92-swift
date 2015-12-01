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
  
  var rating = 0 {
    didSet{
      setNeedsLayout()
    }
  }
  var ratingButtons = [UIButton]()
  var spacing = 2
  var stars = 10
  
  // Mark: Initialization
  
  
  override func layoutSubviews() {
    let buttonSize = Int(frame.size.height)
    
    print(buttonSize)
    var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
    
    
    // Offset each button's origin by the length of the button plus spacing.
    for (index, button) in ratingButtons.enumerate() {
      buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
      button.frame = buttonFrame
    }
    
    updateButtonSelectionStates()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    let filledStarImage = UIImage(named: "filledStar")
    let emptyStarImage = UIImage(named: "emptyStar")
    
    for _ in 0..<stars {
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
    return CGSize(width: 299, height: 28)
  }
  
  // Mark: Action
  
  func ratingButtonTapped(button:UIButton){
    rating = ratingButtons.indexOf(button)! + 1
    updateButtonSelectionStates()
  }
  
  func updateButtonSelectionStates(){
    print("updateButtonSelectionStates")
    for(index,button) in ratingButtons.enumerate(){
      // If the index of a button is less than the rating, that button should be selected.
      button.selected = index < rating
    }
  }

}
