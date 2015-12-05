//
//  SkillViewController.swift
//  nikolenkoanton92
//
//  Created by Anton Nikolenko on 11/30/15.
//  Copyright © 2015 Anton Nikolenko. All rights reserved.
//

import UIKit

class SkillViewController: UIViewController, UITextFieldDelegate {
  
  // MARK: Properties

  @IBOutlet weak var skillNameTextField: UITextField!
  @IBOutlet weak var ratingControl: RatingControl!
  
  var skill: Skill?
  
  @IBOutlet weak var saveButton: UIBarButtonItem!
  
  // MARK: Navigation
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if saveButton === sender{
      let name = skillNameTextField.text ?? ""
      let rating = ratingControl.rating
      
      skill = Skill(name: name, rating: rating)
    }
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
        // Handle the text field's user input through delegate callbacks
      
      skillNameTextField.delegate = self
      
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
