//
//  CGImageExtension.swift
//  FilterTheWorld
//
//  Created by Christopher Bell on 14/02/2024.
//

import CoreGraphics
import VideoToolbox

extension CGImage {
    
    static func create(from cvPixelBuffer: CVPixelBuffer?) -> CGImage? {
        
        guard let pixelBuffer = cvPixelBuffer else {
            return nil
        }
        
        var image: CGImage?
        VTCreateCGImageFromCVPixelBuffer(pixelBuffer,
                                         options: nil,
                                         imageOut: &image)
        return image
    }
}
