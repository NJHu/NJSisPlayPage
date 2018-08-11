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
           playVc.videoUrl = params["video"] as? String
           playVc.topicId = params["topicId"] as? String
        return playVc
    }
}
