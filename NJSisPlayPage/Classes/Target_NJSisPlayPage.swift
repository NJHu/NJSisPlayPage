//
//  DYTarget_Trends.swift
//  DYTrends
//
//  Created by HuXuPeng on 2018/6/7.
//

import UIKit
import NJKit

@objc class Target_NJSisPlayPage: NSObject {
    
    @objc func Action_SisPlayController(params: [String: Any]) -> UIViewController? {
        let playVc = NJSisPlayVideoController()
        let videoUrl = params["video"] as? String
        let topicId = params["topicId"] as? String
        let size = params["videoSize"] ?? CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width * 0.65)
        let videoInfo: (videoUrl: String?, topicId: String?, videoSize: CGSize) = (videoUrl, topicId, size as! CGSize)
        playVc.videoInfo = videoInfo
        return playVc
    }
}
