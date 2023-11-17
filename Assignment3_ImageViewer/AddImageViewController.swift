//
//  AddImageViewController.swift
//  Assignment3_ImageViewer
//
//  Created by user235625 on 11/16/23.
//


import UIKit

protocol ImgDelegate{
    
    func imageDidCorrect(newImage : ImagesModel)
    func viewDidCancel()
}

class AddImageViewController: UIViewController {
    var delegate : ImgDelegate?
    
    @IBOutlet weak var imageName: UITextField!
    @IBOutlet weak var imageURL: UITextField!
    @IBOutlet weak var doneBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let color = UIColor.black
        imageURL.layer.borderColor = color.cgColor
        imageURL.layer.borderWidth = 2.0
        
        imageURL.layer.cornerRadius = 10.0
        imageURL.layer.masksToBounds = true
        
        imageName.layer.borderColor = color.cgColor
        imageName.layer.borderWidth = 2.0
    }
    
    /*
    @IBAction func saveBtn(_ sender: Any) {
        
    }
         
    @IBAction func doneBtn(_ sender: Any) {
        dismiss(animated: true , completion: nil)
    }
    */
    @IBAction func addBtn(_ sender: Any) {
        if let grimageName = imageName.text {
            if let grimageURL = imageURL.text {
                if !grimageName.isEmpty && !grimageURL.isEmpty {
                    let newImage = ImagesModel(imageName: grimageName, imageURL: grimageURL)
                    
                    delegate!.imageDidCorrect(newImage: newImage)
                    dismiss(animated: true , completion: nil)
                }
                
            }
            
        }
        
    }
    @IBAction func cancelBtn(_ sender: Any) {
        delegate!.viewDidCancel()
        dismiss(animated: true , completion: nil)
    }
    
}

