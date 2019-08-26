//
//  NewsCell.swift
//  Vkontakte App
//
//  Created by Dmitry Andreyanov on 8/23/19.
//  Copyright © 2019 light. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsLabel: UILabel!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        func setupCellFromNews (_ news: News) {
            self.avatarView.image = UIImage(named: news.imageName ?? "")
            self.titleLabel.text = news.title
            self.newsLabel.text = news.description
            
            
            
        }
    
    
    
    
}
