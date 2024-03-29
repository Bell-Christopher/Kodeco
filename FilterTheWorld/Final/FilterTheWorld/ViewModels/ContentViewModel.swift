//
//  ContentViewModel.swift
//  FilterTheWorld
//
//  Created by Christopher Bell on 15/02/2024.
//

import CoreImage

class ContentViewModel: ObservableObject {
    
    @Published var frame: CGImage?
    @Published var error: Error?
    
    private let frameManager = FrameManager.shared
    private let cameraManager = CameraManager.shared
    private let context = CIContext()
    
    var comicFilter = false
    var monoFilter = false
    var crystalFilter = false
    
    init() {
        setupSubscriptions()
    }
    
    func setupSubscriptions() {
        
        cameraManager.$error
            .receive(on: RunLoop.main)
            .map { $0 }
            .assign(to: &$error)
        
        frameManager.$current
            .receive(on: RunLoop.main)
            .compactMap { $0 }
            .compactMap { buffer in
                guard let image = CGImage.create(from: buffer) else {
                    return nil
                }
                
                var ciImage = CIImage(cgImage: image)
                
                if self.comicFilter {
                    ciImage = ciImage.applyingFilter("CIComicEffect")
                }
                if self.monoFilter {
                    ciImage = ciImage.applyingFilter("CIPhotoEffectNoir")
                }
                if self.crystalFilter {
                    ciImage = ciImage.applyingFilter("CICrystallize")
                }
                
                return self.context.createCGImage(ciImage, from: ciImage.extent)
            }
            .assign(to: &$frame)
    }
}
