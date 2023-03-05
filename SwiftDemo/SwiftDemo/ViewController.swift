//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Eyad on 14/11/2022.
//

import UIKit
import AVKit
//import Instabug

class PlayerViewController: AVPlayerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        playVideo()

        let request = URLRequest(url: URL(string: "https://dashboard.instabug.com/applications/iosteam-uitests/beta/network")!)
        URLSession.shared.dataTask(with: request) { data, response, error in
            print(data, response, error)
        }
        .resume()
    }

    private func playVideo() {
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(.playback)
        allowsPictureInPicturePlayback = true
        canStartPictureInPictureAutomaticallyFromInline = true
        
        player = {
            let videoPath = Bundle.main.path(forResource: "Video", ofType: "mp4")!
            let videoURL = URL(fileURLWithPath: videoPath)
            let player = AVPlayer(url: videoURL)
            player.play()
            return player
        }()
    }
    
    private func stopAndExitPictureInPicture() {
        player?.pause()
        player = nil
    }
    
}

class ViewController: UIViewController, AVPlayerViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
//        UserDefaults.standard.set("IBGValue", forKey: "IBGKey")
//        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(playVideo)))

        let request = URLRequest(url: URL(string: "https://dashboard.instabug.com/applications/iosteam-uitests/beta/network")!)
        URLSession.shared.dataTask(with: request) { data, response, error in
            print(data, response, error)
        }
        .resume()
    }
    
    @objc func playVideo() {
        let viewController = PlayerViewController()
        viewController.delegate = self
        present(viewController, animated: true)
    }
    
    func playerViewController(
        _ playerViewController: AVPlayerViewController,
        restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: @escaping (Bool) -> Void) {
        present(playerViewController, animated: false) {
            completionHandler(true)
        }
    }

}
