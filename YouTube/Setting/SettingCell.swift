//
//  SettingCell.swift
//  YouTube
//
//  Created by Sovorn on 11/4/18.
//  Copyright © 2018 Sovorn. All rights reserved.
//

import UIKit

class SettingCell: UICollectionViewCell {
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor(white: 0, alpha: 0.3) : .white
            settingLabel.textColor = isHighlighted ? .white : .black
            settingImageView.tintColor = isHighlighted ? .white : .darkGray
        }
    }
    
    var setting: Setting? {
        didSet {
            settingImageView.image = UIImage(named: (setting?.imageName)!)
            settingLabel.text = setting?.name.rawValue
        }
    }
    
    let settingImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.tintColor = .darkGray
        
        return iv
    }()
    
    let settingLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    private func setupView(){
        addSubview(settingImageView)
        addSubview(settingLabel)
        
        settingImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: settingLabel.leftAnchor, paddingTop: 6, paddingLeft: 12, paddingBottom: 6, paddingRight: 6, width: 28, height: 28)
        settingLabel.anchor(top: settingImageView.topAnchor, left: settingImageView.rightAnchor, bottom: settingImageView.bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
