//
//  NewsVC.swift
//  newsApp
//
//  Created by Mustafa Khalil on 6/5/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit

class NewsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var source: Source!
    var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        fetchData()
    }
    
    func fetchData() {
        network.fetchData (url: URL(string: "\(network.url)\(extensionURL.URLBuilder(source: source.id!))\(network.APIKey)")!, onSuccess: { (Articles: Articles) in
            self.articles = Articles.articles
            self.collectionView?.reloadData()
        }) { (e) in
            print(e)
        }
    }
    
}

extension NewsVC {
    //MARK:- UI setup
    func setupView() {
        collectionView?.backgroundColor = .white
        self.title = source.name
        
        collectionView?.register(NewsCell.self, forCellWithReuseIdentifier: CellIdentifier.News.ID)
    }
}
