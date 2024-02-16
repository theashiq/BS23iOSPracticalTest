//
//  ImageCache.swift
//  BS23iOSPracticalTest
//
//  Created by mac 2019 on 2/16/24.
//

import SwiftUI

class ImageCache{
    private init(){}
    static let shared = ImageCache()
    
    private var cache = NSCache<NSString, UIImage>()
    
    func getImage(for key: String) -> UIImage?{
        cache.object(forKey: key as NSString)
    }
    
    func saveImage(for key: String, image: UIImage){
        cache.setObject(image, forKey: key as NSString)
    }
}
