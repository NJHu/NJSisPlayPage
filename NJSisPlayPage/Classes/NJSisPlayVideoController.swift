//
//  NJSisPlayVideoController.swift
//  Pods
//
//  Created by HuXuPeng on 2018/8/10.
//

import UIKit
import NJKit
import NJDYPlayer
import SwiftyJSON

class NJSisPlayVideoController: NJViewController {
    var jsonDataInfo: JSON!
    var videoWidth: CGFloat = UIScreen.main.bounds.width
    var videoHeight: CGFloat = UIScreen.main.bounds.width * 0.63
    private lazy var containerView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "播放视频"
        
        containerView.backgroundColor = UIColor.black
        self.view.addSubview(containerView)
        
        videoWidth = CGFloat(jsonDataInfo["width"].floatValue)
        var tempHeight: CGFloat = CGFloat(jsonDataInfo["height"].floatValue)
        if tempHeight <= 0 {
            tempHeight = videoHeight
        }
        videoHeight = tempHeight
        
        let videoUrl = jsonDataInfo["videouri"].stringValue
        if videoUrl.lengthOfBytes(using: String.Encoding.utf8) > 0 {
            NJVideoPlayerManager.sharedManager.prepareToPlay(contentURLString: videoUrl, in: containerView, shouldAutorotate: videoWidth > videoHeight, delegate: self)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        containerView.frame = CGRect(x: 0, y: nj_navigationBar.frame.maxY, width: self.view.frame.width, height: min(self.view.frame.width * videoHeight / videoWidth, self.view.frame.height - nj_navigationBar.frame.maxY))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !NJVideoPlayerManager.sharedManager.isPlaying {
            NJVideoPlayerManager.sharedManager.play()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NJVideoPlayerManager.sharedManager.shutdown()
    }
}

extension NJSisPlayVideoController: NJVideoPlayerManagerDelegate {
    func videoPlayerManager(_ videoPlayerManager: NJVideoPlayerManager, titleForContentURLString contentURLString: String) -> String? {
        return "\(jsonDataInfo["text"].stringValue)+\(jsonDataInfo["videouri"].stringValue)"
    }
}

// MARK:- StatusBar
//        setNeedsStatusBarAppearanceUpdate()
extension NJSisPlayVideoController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.default
    }
}
