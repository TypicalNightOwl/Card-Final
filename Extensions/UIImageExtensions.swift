//
//  UIImageExtensions.swift
//  Card
//
//  Created by Ryan Westhoelter on 9/29/24.
//

import SwiftUI

extension UIImage: Transferable {
    public static var transferRepresentation: some
    TransferRepresentation {
        DataRepresentation(importedContentType: .image) { image in
            UIImage(data: image) ?? errorImage
        }
    }
    
        public static var errorImage: UIImage {
            UIImage(named: "error-image") ?? UIImage()
    }
}
