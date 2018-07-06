//
//  ViewController.swift
//  newsApp
//
//  Created by Mustafa Khalil on 6/3/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit

class MainVC: BaseCollectionViewController<ChannelCell, SourceViewModel>, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchData()
    }

    func fetchData() {
        if items.count == 0 {
            fetch()
        }
    }

    private func fetch() {
        network.fetchData(url: URL(string: network.urls.sources)!, onSuccess: { (sources: Sources) in
            self.items = sources.sources.map({ (source) -> SourceViewModel in
                return SourceViewModel(source: source)
            })
            self.collectionView?.reloadData()
        }) { (e) in
            log.error(e)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: CGFloat(70))
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let navStack = self.navigationController else {return}
        let newsVC = NewsVC(newSourceVM: items[indexPath.row], collectionViewLayout: UICollectionViewFlowLayout())
        navStack.pushViewController(newsVC, animated: true)
    }
}

extension MainVC {
    //MARK:- UI setup
    func setupView() {
        collectionView?.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = .white
    }
}
