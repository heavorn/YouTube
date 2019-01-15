//
//  TrendCell.swift
//  YouTube
//
//  Created by Sovorn on 11/4/18.
//  Copyright © 2018 Sovorn. All rights reserved.
//

import UIKit

class TrendCell: FeedCell {
    
    override func fetchVideo() {
        APIService.sharedInstance.fetchFeedWithUrlString(urlString: "https://s3-us-west-2.amazonaws.com/youtubeassets/trending.json") { (videos) in
            self.video = videos
            self.collectionView.reloadData()
        }
    }
}
