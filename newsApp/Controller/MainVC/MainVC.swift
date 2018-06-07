//
//  ViewController.swift
//  newsApp
//
//  Created by Mustafa Khalil on 6/3/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit

class MainVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var channels: [Source] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        performDataFetching()
    }
    
    func performDataFetching() {
        if channels.count == 0 {
            fetchData()
        }
    }
    
    func fetchData() {
        
        network.fetchData(url: URL(string: "\(network.url)\(extensionURL.source)\(network.APIKey)")!, onSuccess: { (sources: Sources) in
            self.channels = sources.sources
            self.collectionView?.reloadData()
        }) { (e) in
            log.error(e)
        }
    }
}

extension MainVC {
    //MARK:- UI setup
    func setupView() {
        collectionView?.backgroundColor = .white
        self.title = CellIdentifier.Channels.ID
        collectionView?.register(ChannelCell.self, forCellWithReuseIdentifier: CellIdentifier.Channels.ID)
    }
}
