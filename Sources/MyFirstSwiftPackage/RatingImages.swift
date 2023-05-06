//
//  RatingImages.swift
//  RatingView Swift Package Origin before changed to package
//
//  Created by Frank on 06.05.23.
//

import SwiftUI // for typ of Image

// public because we are in a packe now
public enum RatingImage: String {
    // I use SFSymbols
    case heart = "SF_heart"
    case cross = "SF_cross"
    case clock = "SF_clock"
    case cloud = "SF_cloud"
    // own images in the xcassets catalog
    case myCircle = "MyCircle"
    
    // computed properties to generate the correct filled or open image
    var fillImage: Image {
        rawValue.prefix(3) == "SF_" ?
        Image(systemName: String(rawValue.dropFirst(3)) + ".fill")
        :
        //Image("\(rawValue).fill")
        // the bundle: .module is needed, because we must get the images from
        // the xcassets catalog which lives in the package
        Image("\(rawValue).fill", bundle: .module)
    }
    
    var openImage: Image {
        rawValue.prefix(3) == "SF_" ?
        Image(systemName: String(rawValue.dropFirst(3)))
        :
        //Image(rawValue)
        Image(rawValue, bundle: .module)
    }
}

