//
//  Video.swift
//  YouTube
//
//  Created by Sovorn on 11/4/18.
//  Copyright © 2018 Sovorn. All rights reserved.
//

import UIKit

import UIKit

struct Video: Decodable {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: Int?
    var duration: Int?
    
    var channel: Channel?
    
}

struct Channel: Decodable {
    var name: String?
    var profileImageName: String?
}


//class Video: NSObject {
//
//    var thumbnail_image_name: String?
//    var title: String?
//    var number_of_views: NSNumber?
//    var uploadDate: NSDate?
//    var duration: NSNumber?
//
//    var channel: Channel?
//
//
////
////    init(dic: [String: AnyObject]) {
////        self.thumbnailImageName = dic["thumbnail_image_name"] as? String
////        self.title = dic["title"] as? String
////        self.numberOfView = dic["number_of_views"] as? NSNumber
////        self.uploadDate = dic["duration"] as? Int
////
////    }
//
//}
//
//class Channel: NSObject {
//
//    var name: String?
//    var profile_image_name: String?
//}
