//
//  TemplateMethod.swift
//  PatternLab3
//
//  Created by Alex Koblik-Zelter on 3/28/20.
//  Copyright © 2020 Alex Koblik-Zelter. All rights reserved.
//

import Foundation


protocol WebViewManager: class {
    func method()
    func getData()
    func decodeData()
    func cacheData()
    func openURL()
}

extension WebViewManager {
    func method() {
        getData()
        decodeData()
        cacheData()
        openURL()
    }
    
    internal func getData() {
        print("Base function for request to server")
    }
    
    internal func decodeData() {
        print("Decode JSON data")
    }
}


class LocalWebViewPage: WebViewManager {
    internal func cacheData() {
        print("cache local page")
    }
    
    internal func openURL() {
        print("open local url")
    }
    
}

class ExternalWebViewPage: WebViewManager {

    internal func openURL() {
        print("open external url")
    }
    
    internal func cacheData() {
        print("cache external page")
    }
}
