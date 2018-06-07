//
//  MainVC+CollectionView.swift
//  newsApp
//
//  Created by Mustafa Khalil on 6/3/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit

extension MainVC {
	
	//MARK:- Collection View function
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return channels.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.Channels.ID, for: indexPath) as! ChannelCell
		cell.configure(data: channels[indexPath.row])
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: view.bounds.width, height: CGFloat(70))
	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let vc = NewsVC(collectionViewLayout: UICollectionViewFlowLayout())
		vc.source = channels[indexPath.row]
		navigationController?.pushViewController(vc, animated: true)
	}
	
}
