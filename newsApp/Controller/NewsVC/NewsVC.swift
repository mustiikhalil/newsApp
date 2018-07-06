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
    
    init(newSourceVM: SourceViewModel, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(withCellID: CellIdentifier.News.ID, collectionViewLayout: layout)
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
        network.fetchData (url: URL(string: network.urls.headLines(from: source.id))!, onSuccess: { (Articles: Articles) in
            self.items = Articles.articles.map({ (article) -> ArticleViewModel in
                return ArticleViewModel(article: article)
            })
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

