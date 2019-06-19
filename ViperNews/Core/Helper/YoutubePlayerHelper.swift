//
//  YoutubePlayer.swift
//
//  Created by Muhamad Rizwan on 31/10/2018.
//  Copyright © 2018 Muhamad Rizwan. All rights reserved.
//

import UIKit
import XCDYouTubeKit
import AVKit


struct YouTubeVideoQuality {
    static let hd720 = NSNumber(value: XCDYouTubeVideoQuality.HD720.rawValue)
    static let medium360 = NSNumber(value: XCDYouTubeVideoQuality.medium360.rawValue)
    static let small240 = NSNumber(value: XCDYouTubeVideoQuality.small240.rawValue)
}


class YoutubePlayerHelper: NSObject {
    
    func playVideo(url: String, vc:UIViewController) {
        let playerViewController = AVPlayerViewController()
        vc.present(playerViewController, animated: true, completion: nil)
        
        let videoID = extractYouTubeId(from: url)
        
        
        XCDYouTubeClient.default().getVideoWithIdentifier(videoID) { [weak playerViewController] (video: XCDYouTubeVideo?, error: Error?) in
            
            if let streamURLs = video?.streamURLs, let streamURL = (streamURLs[XCDYouTubeVideoQualityHTTPLiveStreaming] ?? streamURLs[YouTubeVideoQuality.hd720] ?? streamURLs[YouTubeVideoQuality.medium360] ?? streamURLs[YouTubeVideoQuality.small240])
            {
                do {
                    try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
                    
                } catch  {
                    print("No Audio will be play.")
                }
                
                playerViewController?.player = AVPlayer(url: streamURL)
            } else {
                vc.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func extractYouTubeId(from url: String) -> String? {
        let typePattern = "(?:(?:\\.be\\/|embed\\/|v\\/|\\?v=|\\&v=|\\/videos\\/)|(?:[\\w+]+#\\w\\/\\w(?:\\/[\\w]+)?\\/\\w\\/))([\\w-_]+)"
        let regex = try? NSRegularExpression(pattern: typePattern, options: .caseInsensitive)
        return regex
            .flatMap { $0.firstMatch(in: url, range: NSMakeRange(0, url.count)) }
            .flatMap { Range($0.range(at: 1), in: url) }
            .map { String(url[$0]) }
    }
}
