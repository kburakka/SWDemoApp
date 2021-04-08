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
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
