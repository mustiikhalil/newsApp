//
//  NewsCell.swift
//  newsApp
//
//  Created by Mustafa Khalil on 6/5/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
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
    
    func configure(data cellData: Article) {
        title.text = cellData.title
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
