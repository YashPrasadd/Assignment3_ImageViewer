//
//  ImagesModel.swift
//  Assignment3_ImageViewer
//
//  Created by user235625 on 11/16/23.
//

import Foundation

class ImagesModel{
    var imageName = ""
    var imageURL = ""
    
    init(imageName: String = "", imageURL: String = "") {
        self.imageName = imageName
        self.imageURL = imageURL
    }
}
