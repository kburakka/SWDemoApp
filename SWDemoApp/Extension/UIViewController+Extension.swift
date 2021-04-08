//
//  UIViewController+Extension.swift
//  SWDemoApp
//
//  Created by Burak Kaya on 8.04.2021.
//

import UIKit
import AVFoundation
import AVKit

extension UIViewController {
    func playVideo(url: URL) {
        let player = AVPlayer(url: url)
        
        let avpController = AVPlayerViewController()
        avpController.player = player
        
        self.present(avpController, animated: true) {
            avpController.player?.play()
        }
    }
}
