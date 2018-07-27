//
//  NewsVC.swift
//  newsApp
//
//  Created by Mustafa Khalil on 6/5/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit

class NewsVC: BaseCollectionViewController<NewsCell, ArticleViewModel>, UICollectionViewDelegateFlowLayout {
    
    var source: SourceViewModel!
	
    init(withCellID cellID: String, newSourceVM: SourceViewModel, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(withCellID: cellID, collectionViewLayout: layout)
        self.source = newSourceVM
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
        network.getRequest (withUrl: URL(string: network.urls.headLines(from: source.sourceID))!, onSuccess: { (articles: Articles) in
            self.items = articles.articles.map({ (article) -> ArticleViewModel in
                return ArticleViewModel(article: article)
            })
            self.collectionView?.reloadData()
            
            }) { (err) in
                print(err)
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

