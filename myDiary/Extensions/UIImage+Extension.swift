//
//  Extension+UIImage.swift
//  myDiary
//
//  Created by beaunexMacBook on 4/24/24.
//

import Foundation
import UIKit

extension UIImage {
    func resizeImage(size: CGSize) -> UIImage? {
        guard let cgImage = self.cgImage else {
            return nil // cgImage가 nil이면 nil 반환
        }
        
        let originalSize = self.size
        let ratio: CGFloat = {
            return originalSize.width > originalSize.height ? 1 / (size.width / originalSize.width) :
            1 / (size.height / originalSize.height)
        }()
        
        return UIImage(cgImage: cgImage, scale: self.scale * ratio, orientation: self.imageOrientation)
    }
}
    
