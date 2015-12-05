//
//  SkillTableViewController.swift
//  nikolenkoanton92
//
//  Created by Anton Nikolenko on 12/1/15.
//  Copyright © 2015 Anton Nikolenko. All rights reserved.
//

import UIKit

class SkillTableViewController: UITableViewController {
  
  // MARK: Properties
  
  var skills = [Skill]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
      
      // Load the sample data of skills
      print("Hello World")
      loadSampleSkills()
    }
  
  func loadSampleSkills(){
    let skill1 = Skill(name:"Node.js", rating:6)!
    let skill2 = Skill(name: "MongoDB", rating:6)!
    let skill3 = Skill(name:"Ampersand.js", rating: 8)!
    let skill4 = Skill(name:"Swift", rating:1)!
    
    skills += [skill1,skill2,skill3, skill4]
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      print("Cont skills ", skills.count)
        return skills.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      // Table View cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "SkillTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SkillTableViewCell
      
        // Fetches the appropriate skill for the data source layout
        
        let skill = skills[indexPath.row]
        cell.skillLabel.text = skill.name
        cell.ratingControl.rating = skill.rating
        print(cell)
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
  
  // MARK: NSCoding
  
  func saveSkills(){
    let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(skills, toFile: Skill.AchiveURL.path!)
    
    if(!isSuccessfulSave){
      print("Failed to save skill")
    }
  }
  
  func loadSkiils() -> [Skill]?{
    return NSKeyedUnarchiver.unarchiveObjectWithFile(Skill.AchiveURL.path!)as?[Skill]
  }
  
  // MARK: Action
  
  @IBAction func unwindToSkillList(sender: UIStoryboardSegue){
    if let sourceViewController = sender.sourceViewController as?
      SkillViewController, skill = sourceViewController.skill{
      // add new skill
        let newIndexPath = NSIndexPath(forRow: skills.count, inSection: 0)
        skills.append(skill)
        tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
    }
  }

}
