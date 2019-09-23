//
//  GroupsController.swift
//  Vkontakte App
//
//  Created by Dmitry Andreyanov on 8/9/19.
//  Copyright © 2019 Dmitrii Andreianov. All rights reserved.
//
//

import UIKit

class GroupsController: UITableViewController {
    fileprivate var groups = [
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
    
    fileprivate lazy var filteredGroups = self.groups
   
    @IBOutlet var searchBar: UISearchBar!
    @IBAction func addGroup(segue: UIStoryboardSegue) {
            guard let allGroupsVC = segue.source as? AllGroupsController,
            let indexPath = allGroupsVC.tableView.indexPathForSelectedRow else { return }
        let newGroup = allGroupsVC.groups[indexPath.row]
        guard !groups.contains(where: { (group) -> Bool in
            group.name == newGroup.name
        }) else { return }
        groups.append(newGroup)
        
        filterGroups(with: searchBar.text ?? "")
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsCell", for: indexPath) as? GroupsCell
            else { fatalError("все сломалось") }
        cell.nameLabel.text = filteredGroups[indexPath.row].name
     
        cell.avatarView.image = groups[indexPath.row].avatar
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let groupToDelete = filteredGroups[indexPath.row]
            filteredGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            groups.removeAll { group -> Bool in
                return group.name == groupToDelete.name
            }
        }
    }
}

extension GroupsController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterGroups(with: searchText)
    }
    
    fileprivate func filterGroups(with text: String) {
        if text.isEmpty {
            filteredGroups = groups
            tableView.reloadData()
            return
        }
        filteredGroups = groups.filter { $0.name.lowercased().contains(text.lowercased()) }
        tableView.reloadData()
    }
}
    

