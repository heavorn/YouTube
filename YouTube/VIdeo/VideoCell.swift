//
//  VideoCell.swift
//  YouTube
//
//  Created by Sovorn on 11/3/18.
//  Copyright © 2018 Sovorn. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
    
    var video: Video? {
        didSet {
            titleLabel.text = video?.title
            imageView.loadImage(urlString: (video?.thumbnailImageName)!)
            
            profileImageView.loadImage(urlString: (video?.channel?.profileImageName)!)
            
            if let duration = video?.duration, let channelName = video?.channel?.name, let views = video?.numberOfViews {
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                
                let subTitleText = "\(channelName) • \(numberFormatter.string(from: NSNumber(value: views))!) • \(duration / 12 / 12) years \(duration % 12) months"
                subTextView.text = subTitleText
            }
            
            if let title = video?.title {
                let size = CGSize(width: frame.width - 16 - 44 - 8 - 16, height: 1000)
                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                let estimatedRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
                
                if estimatedRect.size.height > 20 {
                    titleLabelHeighConstrain?.isActive = false
                    titleLabelHeighConstrain?.constant = 34
                    titleLabelHeighConstrain?.isActive = true
                } else {
                    titleLabelHeighConstrain?.isActive = false
                    titleLabelHeighConstrain?.constant = 14
                    titleLabelHeighConstrain?.isActive = true
                }
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    let imageView: CustomImageView = {
        let iv = CustomImageView()
        iv.image = UIImage(named: "taylor_swift_blank_space")
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = UIColor(white: 0, alpha: 0.1)
        
        return iv
    }()
    
    let profileImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.image = UIImage(named: "taylor_swift_profile")
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 44 / 2
        iv.backgroundColor = UIColor(white: 0, alpha: 0.1)
        
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Taylor Swift - Blank Space"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 2
        
        return label
    }()
    
    let subTextView: UITextView = {
        let tv = UITextView()
        tv.text = "TaylorSwiftVEVO * 1,898,004,449 views * 3 years"
        tv.textColor = .lightGray
        tv.backgroundColor = .clear
        tv.isEditable = false
        
        return tv
    }()
    
    var titleLabelHeighConstrain: NSLayoutConstraint?
    
    private func setupView(){
        let separateView = UIView()
        separateView.backgroundColor = UIColor.rgb(red: 230, green: 230, blue: 230)
        
        addSubview(imageView)
        addSubview(profileImageView)
        addSubview(titleLabel)
        addSubview(subTextView)
        addSubview(separateView)
        
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: profileImageView.topAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 8, paddingRight: 16, width: 0, height: 0)
        
        profileImageView.anchor(top: imageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: titleLabel.leftAnchor, paddingTop: 0, paddingLeft: 16, paddingBottom: 32, paddingRight: 8, width: 44, height: 44)
        
        titleLabel.anchor(top: profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: imageView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 0, height: 0)
        titleLabelHeighConstrain = titleLabel.heightAnchor.constraint(equalToConstant: 44)
        titleLabelHeighConstrain?.isActive = true
        
        subTextView.anchor(top: titleLabel.bottomAnchor, left: titleLabel.leftAnchor, bottom: nil, right: imageView.rightAnchor, paddingTop: -4, paddingLeft: -4, paddingBottom: 0, paddingRight: 0, width: 0, height: 44)
        
        separateView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
