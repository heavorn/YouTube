//
//  SettingLuanch.swift
//  YouTube
//
//  Created by Sovorn on 11/4/18.
//  Copyright © 2018 Sovorn. All rights reserved.
//

import UIKit

class SettingLuanch: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    let blackView = UIView()
    
    let cellId = "cellId"
    
    let setting: [Setting] = [Setting(name: .setting, imageName: "settings"), Setting(name: .privacy, imageName: "privacy"), Setting(name: .feedBack, imageName: "feedback"), Setting(name: .help, imageName: "help"), Setting(name: .switchAcc, imageName: "switch_account"), Setting(name: .cancel, imageName: "cancel")]
    
    let containverView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .white
        
        return cv
    }()
    
    @objc func handleMore(){
        if let window = UIApplication.shared.keyWindow {
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            window.addSubview(containverView)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            let y = window.frame.height
            let height: CGFloat = 300
            
            containverView.frame = CGRect(x: 0, y: y, width: window.frame.width, height: height)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                self.containverView.frame = CGRect(x: 0, y: y - height, width: window.frame.width, height: height)
            }, completion: nil)
            
        }
    }
    
    @objc func handleDismiss(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                self.containverView.frame = CGRect(x: 0, y: window.frame.height, width: self.containverView.frame.width, height: self.containverView.frame.height)
            }
        })
    }
    
    func handleDismissSetting(_ setting: Setting){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                self.containverView.frame = CGRect(x: 0, y: window.frame.height, width: self.containverView.frame.width, height: self.containverView.frame.height)
            }
        }) { (completed: Bool) in
            if setting.name != .cancel {
                self.homeController?.showerControllerForSetting(setting: setting)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return setting.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = containverView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SettingCell
        cell.setting = setting[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: containverView.frame.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    var homeController: HomeController?
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let setting = self.setting[indexPath.item]
        let indexPath = 
        
        handleDismissSetting(setting)
    }
    
    override init() {
        super.init()
        
        containverView.dataSource = self
        containverView.delegate = self
        containverView.register(SettingCell.self, forCellWithReuseIdentifier: cellId)
    }
}
