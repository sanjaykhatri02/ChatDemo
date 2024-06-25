//
//  File.swift
//  
//
//  Created by Sanjay Kumar on 25/06/2024.
//

import Foundation
import UIKit
import ImageIO

class GIFImageView: UIView {
    
    private var imageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        imageView = UIImageView(frame: self.bounds)
        imageView.contentMode = .scaleAspectFit
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(imageView)
    }
    
    func loadGIF(named gifName: String) {
        guard let gifPath = Bundle.main.path(forResource: gifName, ofType: "gif") else {
            print("GIF file not found")
            print("")
            return
        }
        
        guard let gifData = try? Data(contentsOf: URL(fileURLWithPath: gifPath)) else {
            print("Failed to load GIF data")
            return
        }
        
        let gifImages = extractFrames(from: gifData)
        imageView.animationImages = gifImages.images
        imageView.animationDuration = gifImages.duration
        imageView.startAnimating()
    }
    
    private func extractFrames(from data: Data) -> (images: [UIImage], duration: Double) {
        var frames = [UIImage]()
        var duration: Double = 0
        
        let source = CGImageSourceCreateWithData(data as CFData, nil)
        let count = CGImageSourceGetCount(source!)
        
        for i in 0..<count {
            if let image = CGImageSourceCreateImageAtIndex(source!, i, nil) {
                frames.append(UIImage(cgImage: image))
                let frameDuration = getFrameDuration(from: source!, index: i)
                duration += frameDuration
            }
        }
        
        return (frames, duration)
    }
    
    private func getFrameDuration(from source: CGImageSource, index: Int) -> Double {
        let properties = CGImageSourceCopyPropertiesAtIndex(source, index, nil) as? [String: Any]
        let gifProperties = properties?[kCGImagePropertyGIFDictionary as String] as? [String: Any]
        
        let delayTime = gifProperties?[kCGImagePropertyGIFUnclampedDelayTime as String] as? Double
        let duration = delayTime ?? (gifProperties?[kCGImagePropertyGIFDelayTime as String] as? Double) ?? 0.1
        
        return duration
    }
}

extension UIImageView {
    
    func loadGIF(named gifName: String) {
        guard let gifPath = Bundle.main.path(forResource: gifName, ofType: "gif") else {
            print("GIF file not found")
            print("")
            return
        }
        
        guard let gifData = try? Data(contentsOf: URL(fileURLWithPath: gifPath)) else {
            print("Failed to load GIF data")
            return
        }
        
        let gifImages = extractFrames(from: gifData)
        self.animationImages = gifImages.images
        self.animationDuration = gifImages.duration
        self.startAnimating()
    }
    
    private func extractFrames(from data: Data) -> (images: [UIImage], duration: Double) {
        var frames = [UIImage]()
        var duration: Double = 0
        
        let source = CGImageSourceCreateWithData(data as CFData, nil)
        let count = CGImageSourceGetCount(source!)
        
        for i in 0..<count {
            if let image = CGImageSourceCreateImageAtIndex(source!, i, nil) {
                frames.append(UIImage(cgImage: image))
                let frameDuration = getFrameDuration(from: source!, index: i)
                duration += frameDuration
            }
        }
        
        return (frames, duration)
    }
    
    private func getFrameDuration(from source: CGImageSource, index: Int) -> Double {
        let properties = CGImageSourceCopyPropertiesAtIndex(source, index, nil) as? [String: Any]
        let gifProperties = properties?[kCGImagePropertyGIFDictionary as String] as? [String: Any]
        
        let delayTime = gifProperties?[kCGImagePropertyGIFUnclampedDelayTime as String] as? Double
        let duration = delayTime ?? (gifProperties?[kCGImagePropertyGIFDelayTime as String] as? Double) ?? 0.1
        
        return duration
    }
}
