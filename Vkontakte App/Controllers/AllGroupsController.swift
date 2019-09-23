//
//  AllGroupsController.swift
//  Vkontakte App
//
//  Created by Dmitry Andreyanov on 8/9/19.
//  Copyright © 2019 Dmitrii Andreianov. All rights reserved.
//
//

import UIKit

class AllGroupsController: UITableViewController {
    var groups = [
        
            Group(name: "Kazahstan", avatar: UIImage(named: "GroupKazahstan")),
            Group(name: "Armenia", avatar: UIImage(named: "GroupArmenia")),
            Group(name: "Azerbaidjan", avatar: UIImage(named: "GroupAzerbaidjan")),
            Group(name: "Belarus", avatar: UIImage(named: "GroupBelarus")),
            Group(name: "Russia", avatar: UIImage(named: "GroupRussia")),
            Group(name: "Moldova", avatar: UIImage(named: "GroupMoldova")),
            Group(name: "Latvia", avatar: UIImage(named: "GroupLatvia")),
            Group(name: "Litva", avatar: UIImage(named: "GroupLitva")),
            Group(name: "Estonia", avatar: UIImage(named: "GroupEstonia")),
            Group(name: "Ukraine", avatar: UIImage(named: "GroupUkraine")),
        ]
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsCell", for: indexPath) as? GroupsCell
            else {fatalError("error")}
        cell.nameLabel.text = groups[indexPath.row].name
        cell.avatarView.image = groups[indexPath.row].avatar
        return cell
        
    }
}
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


