//
//  ChannelsCells.swift
//  newsApp
//
//  Created by Mustafa Khalil on 6/3/18.
//  Copyright © 2018 Mustafa Khalil. All rights reserved.
//

import UIKit

class ChannelCell: GenericCell<Source> {
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "testing"
        label.font = UIFont(name: ".SFUIText-Medium", size: 18.0)
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
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4.0).isActive = true
        title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4.0).isActive = true
        title.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        title.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    }
    
    override var item: Source! {
        didSet {
            title.text = item.name
        }
    }
}
