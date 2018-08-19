//
//  DYTarget_Trends.swift
//  DYTrends
//
//  Created by HuXuPeng on 2018/6/7.
//

import UIKit
import NJKit
import SwiftyJSON

@objc class Target_NJSisPlayPage: NSObject {
    
    @objc func Action_SisPlayController(params: [String: Any]) -> UIViewController? {
        let jsonData = params["jsonData"] as? JSON
        if jsonData == nil {
            return nil
        }
        
        let playVc = NJSisPlayVideoController()
        playVc.jsonDataInfo = jsonData
        return playVc
    }
}
