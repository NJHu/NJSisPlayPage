//
//  NJSisPlayVideoController.swift
//  Pods
//
//  Created by HuXuPeng on 2018/8/10.
//

import UIKit
import NJKit
import NJDYPlayer

class NJSisPlayVideoController: NJViewController {
    var videoInfo: (videoUrl: String?, topicId: String?, videoSize: CGSize)?
    private lazy var containerView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "播放视频"
        containerView.backgroundColor = UIColor.black
        self.view.addSubview(containerView)
        NJVideoPlayerManager.sharedManager.prepareToPlay(contentURLString: videoInfo!.videoUrl!, in: containerView, shouldAutorotate: videoInfo!.videoSize.width > videoInfo!.videoSize.height, delegate: self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        containerView.frame = CGRect(x: 0, y: self.nj_navigationBar.frame.maxY, width: self.view.frame.width, height: self.view.frame.width * videoInfo!.videoSize.height / videoInfo!.videoSize.width)
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
        return "\(videoInfo!.topicId!)+\(videoInfo!.videoUrl!)"
    }
}
