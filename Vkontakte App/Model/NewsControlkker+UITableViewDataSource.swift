//
//  NewsControlkker+UITableViewDataSource.swift
//  Vkontakte App
//
//  Created by Dmitry Andreyanov on 8/23/19.
//  Copyright © 2019 light. All rights reserved.
//

import UIKit

extension NewsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell
            else { fatalError("error") }
        cell.setupCellFromNews(news[indexPath.row])
        
        return cell    }
    
    }



    
    

