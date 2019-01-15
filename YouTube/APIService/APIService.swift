//
//  APIService.swift
//  YouTube
//
//  Created by Sovorn on 11/4/18.
//  Copyright © 2018 Sovorn. All rights reserved.
//

import UIKit

class APIService: NSObject {
    static let sharedInstance = APIService()
    
    func fetchFeedWithUrlString(urlString: String, completion: @escaping ([Video]) -> ()){
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                print(error ?? "")
                return
            }
            
            do {
                guard let data = data else { return }
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let videos = try decoder.decode([Video].self, from: data)
                
                DispatchQueue.main.async {
                    completion(videos)
                }
                
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
}

//let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
//
//var videos = [Video]()
//for dic in json as! [[String: AnyObject]]{
//    let video = Video(dic: dic)
//    let channelDic = dic["channel"] as! [String: AnyObject]
//    let channel = Channel()
//    channel.name = channelDic["name"] as? String
//    channel.profileName = channelDic["profile_image_name"] as? String
//
//    video.channel = channel
//    videos.append(video)
//}
//DispatchQueue.main.async {
//    completion(videos)
//}
