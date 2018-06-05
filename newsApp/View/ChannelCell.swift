//
//  ChannelsCells.swift
//  newsApp
//
//  Created by Mustafa Khalil on 6/3/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit
import SnapKit

class ChannelCell: UICollectionViewCell {
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "testing"
        label.font = UIFont(name: ".SFUIText-Medium", size: 18.0)
        return label
    }()
    
    let information: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ".SFUIText", size: 12)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data cellData: Source) {
        title.text = cellData.name
    }
    
    func setupView() {
        addSubview(title)
        addSubview(information)
        title.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.left.equalTo(contentView.snp.left).offset(4)

        }
    }
}
