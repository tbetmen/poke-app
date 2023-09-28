//
//  WebImageCache.swift
//  PokeApp
//
//  Created by Muhammad M. Munir on 28/09/23.
//  Copyright © 2023 Infinity. All rights reserved.
//

import Foundation
import UIKit

class WebImageCache {
    var cache = NSCache<NSString, UIImage>()

    func get(forKey key: String) -> UIImage? {
        return self.cache.object(forKey: NSString(string: key))
    }

    func set(forKey key: String, image: UIImage) {
        self.cache.setObject(image, forKey: NSString(string: key))
    }
}

extension WebImageCache {
    
    private static var cache = WebImageCache()
    
    static func getCache() -> WebImageCache {
        return self.cache
    }
}
