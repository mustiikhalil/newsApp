//
//  ViewController.swift
//  newsApp
//
//  Created by Mustafa Khalil on 6/3/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit

class MainVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension MainVC {
    //MARK:- UI setup
    func setupView() {
        collectionView?.backgroundColor = .white
        self.title = "Channels"
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifier.channel.ID())
    }
}
