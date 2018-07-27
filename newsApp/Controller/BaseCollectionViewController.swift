//
//  BaseCollectionViewController.swift
//  newsApp
//
//  Created by Mustafa Khalil on 7/2/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit

class BaseCollectionViewController<T: GenericCell<U>,U>: UICollectionViewController {
    
    private var cellID: String
    var items: [U] = []
    
    init(withCellID cellid: String, collectionViewLayout layout: UICollectionViewLayout) {
        self.cellID = cellid
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(T.self, forCellWithReuseIdentifier: cellID)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! GenericCell<U>
        cell.item = items[indexPath.row]
        return cell
    }
    
}
