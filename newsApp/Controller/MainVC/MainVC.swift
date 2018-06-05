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
        if channels.count == 0 {
            populate()
        }
    }
    
    func populate() {
        network.fetchSources(extensionURL: extensionURL.source, onSuccess: {
            sources in
            self.channels = sources.sources
            self.collectionView?.reloadData()
        }, onFailure: {
            fail in
            print(fail)
        })
    }
}

extension MainVC {
    //MARK:- UI setup
    func setupView() {
        collectionView?.backgroundColor = .white
        self.title = "Channels"
        collectionView?.register(ChannelCell.self, forCellWithReuseIdentifier: CellIdentifier.channel.ID)
    }
}
