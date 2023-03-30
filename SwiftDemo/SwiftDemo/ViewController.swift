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
        playVideo()
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

        var request = URLRequest(url: URL(string: "https://httpbin.org/post")!)
        request.httpBodyStream = createInputStream()
        request.httpMethod = "POST"
//        let task = URLSession.shared.uploadTask(withStreamedRequest: request)
//        task.delegate = self
//        task.resume()
        URLSession.shared.uploadTask(with: request, from: getLargeData()) { data, response, error in
            print(data, response, error)
        }
        .resume()
    }


    func createInputStream() -> InputStream {
        let url = FileManager.default.temporaryDirectory
            .appending(components: "TempFile")

        let outputStream = OutputStream(url: url, append: false)!
        outputStream.open()
        let dict: [String: [String]] = ["Hello": .init(repeating: "World", count: 1_0)]

        JSONSerialization.writeJSONObject(dict, to: outputStream, error: .none)
        outputStream.close()
        return InputStream(url: url)!
    }


    func getLargeData() -> Data {
        let dict: [String: [String]] = ["Hello": .init(repeating: "World", count: 10)]

        return try! JSONSerialization.data(withJSONObject: dict)
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


extension ViewController: URLSessionTaskDelegate {
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {

    }
}
