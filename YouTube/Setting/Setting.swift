//
//  Setting.swift
//  YouTube
//
//  Created by Sovorn on 11/4/18.
//  Copyright © 2018 Sovorn. All rights reserved.
//

import UIKit

class Setting: NSObject {
    
    let name: SettingName
    let imageName: String
    
    init(name: SettingName, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}

enum SettingName: String {
    case setting = "settings"
    case privacy = "Terms & Privacy policy"
    case feedBack = "Send FeedBack"
    case help = "Help"
    case switchAcc = "Switch Account"
    case cancel = "Cancel"
}
