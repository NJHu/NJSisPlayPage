//
//  NJSisPlayVideoController.swift
//  Pods
//
//  Created by HuXuPeng on 2018/8/10.
//

import UIKit
import NJKit

class NJSisPlayVideoController: NJViewController {
    var videoInfo: (videoUrl: String?, topicId: String?, videoSize: CGSize?)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "播放视频"
    }
}
