//
//  FriendsController.swift
//  Vkontakte App
//
//  Created by Dmitry Andreyanov on 8/9/19.
//  Copyright © 2019 Dmitrii Andreianov. All rights reserved.
//
//

import UIKit

class FriendsController: UITableViewController {
    let friends = User.generateFriends()
    
    var firstCharacters = [Character]()
    var sortedFriends: [Character: [User]] = [:]
   
    private func sort(_ friends: [User]) -> (characters: [Character], sortedFriends: [Character: [User]]) {
        
        var characters = [Character]()
        var sortedFriends = [Character: [User]]()
        
        friends.forEach { friend in
            guard let character = friend.name.first else { return }
            if var thisCharFriends = sortedFriends[character] {
                thisCharFriends.append(friend)
                sortedFriends[character] = thisCharFriends
            } else {
                sortedFriends[character] = [friend]
                characters.append(character)
            }
        }
        characters.sort()
        
        return (characters, sortedFriends)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (firstCharacters, sortedFriends) = sort(friends)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return firstCharacters.count
    }

    /*override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }*/
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let character = firstCharacters[section]
        let friendsCount = sortedFriends[character]?.count
        return friendsCount ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? FriendsCell
            else {fatalError("все сломалось")}
        
        
        let character = firstCharacters[indexPath.section]
        if let friends = sortedFriends[character] {
        cell.nameLabel.text = friends[indexPath.row].name
        cell.avatarView.image = friends[indexPath.row].avatar
        return cell
        }
    return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let character = firstCharacters[section]
        return String(character)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FriendsFotoSegue",
            let indexPath = tableView.indexPathForSelectedRow,
            let photoVC = segue.destination as? UserController {
            let friend = friends[indexPath.row]
            let photos = friend.photos
                photoVC.photos = photos
    }
    
    
    }
    
/*
func numberOfSections(in tableView: UITableView) -> Int {
    return 1
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "SomeCell", for: indexPath) as! TableViewCell
    cell.label.text = "hello table"
    return cell
}
}
 */
}
