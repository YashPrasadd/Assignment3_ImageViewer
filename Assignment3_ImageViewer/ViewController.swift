//
//  ViewController.swift
//  Assignment3_ImageViewer
//
//  Created by user235625 on 11/16/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, ImgDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imagePicker: UIPickerView!
    
    var imageTitle = (UIApplication.shared.delegate as! AppDelegate).imgList

    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.dataSource = self
        imagePicker.reloadAllComponents()
    
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageTitle.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageTitle[row].imageName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selected = imageTitle[row]
        
        let imageURL = selected.imageURL
        
        downloadImage(from: imageURL) {
            imageData in
                if let imageData = imageData {
                        DispatchQueue.main.async {
                                self.imageView.image = UIImage(data: imageData)
                            print("Image set iv.")
                        }
                }
        }
        
    }
    
    func downloadImage(from urlString: String, completion: @escaping (Data?) -> Void) {
    guard let imageUrl = URL(string: urlString) else {
    print("Invalid URL: \(urlString)")
    completion(nil)
    return
    }
    print("Download the image from URL: \(imageUrl)")
    let task = URLSession.shared.dataTask(with: imageUrl) { data, _, error in
    if let error = error {
    print("Error downloading the image: \(error.localizedDescription)")
    completion(nil)
    return
    }
    print("Image downloaded: SUCCESS.")
    completion(data)
    }
    task.resume()
    }

    func imageDidCorrect(newImage: ImagesModel){
        imageTitle.append(newImage)
        imagePicker.reloadAllComponents()
    }
    func viewDidCancel() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var des = segue.destination as! AddImageViewController
        des.delegate = self
    }

}
