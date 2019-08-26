//
//  NewsController.swift
//  Vkontakte App
//
//  Created by Dmitry Andreyanov on 8/23/19.
//  Copyright © 2019 light. All rights reserved.
//
import UIKit

class NewsController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var news: [News] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        self.tableView.rowHeight = 500
        news.append(News (title: "Меркель сказала, что хотела бы прочесть о себе в учебниках", description: "Канцлер Германии Ангела Меркель призналась, что хотела бы, чтобы немецкие школьники через 50 лет прочли о ее старании при выполнении своих обязанностей в учебниках истории.", imageName: "Angela_news"))
        news.append(News (title: "Владимир Путин номинирован на Emmy", description: "Интервью президента России американскому каналу Fox News выдвинуто на престижную премию в области телевидения в категории 'Выдающееся интервью'", imageName: "Putin_news"))
        news.append(News (title: "Apple выгоняют из Китая", description: "В условиях агрессивной торговой войны США с Китаем Apple стремительно сдает позиции на одном из ключевых для себя рынков — китайцы покупают все меньше смартфонов, планшетов и компьютеров", imageName: "Trump_news"))
        
        
        self.tableView.dataSource = self
    
        
    }
    

 
}
