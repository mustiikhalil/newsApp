//
//  NewsVC.swift
//  newsApp
//
//  Created by Mustafa Khalil on 6/5/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit

class NewsVC: BaseCollectionViewController<NewsCell, Article>, UICollectionViewDelegateFlowLayout {
    
    var source: Source!
    
    init(newSource: Source, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(withCellID: CellIdentifier.News.ID, collectionViewLayout: layout)
        self.source = newSource
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchData()
    }
    
    private func fetchData() {
        network.fetchData (url: URL(string: "\(network.url)\(extensionURL.URLBuilder(source: source.id!))\(network.APIKey)")!, onSuccess: { (Articles: Articles) in
                self.items = Articles.articles
                self.collectionView?.reloadData()
            }) { (e) in
                print(e)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: CGFloat(70))
    }
}

extension NewsVC {
    //MARK:- UI setup
    func setupView() {
        collectionView?.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = .white
    }
}

