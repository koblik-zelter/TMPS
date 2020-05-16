//
//  Proxy.swift
//  PatternLab2
//
//  Created by Alex Koblik-Zelter on 2/20/20.
//  Copyright © 2020 Alex Koblik-Zelter. All rights reserved.
//

import Foundation


protocol ImageLoadService {
    func loadImage(url: URL, handler: @escaping((String) -> Void))
}


class URLImageService: ImageLoadService {
    func loadImage(url: URL, handler: @escaping ((String) -> Void)) {
        print("Request to \(url)")
        handler("downloaded image")
    }
}


class Proxy: ImageLoadService {
    private static var cache: String?
    private let service: ImageLoadService
    
    init(service: ImageLoadService) {
        self.service = service
    }
    
    func loadImage(url: URL, handler: @escaping ((String) -> Void)) {
        if let cache = Proxy.cache {
            handler(cache)
        }
        else {
            self.service.loadImage(url: url) { (imageData) in
                Proxy.cache = imageData + " from cache"
                handler("\(imageData) from \(url)")
            }
        }
    }
    
}
