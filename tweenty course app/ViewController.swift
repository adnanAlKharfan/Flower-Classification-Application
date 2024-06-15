//
//  ViewController.swift
//  tweenty course app
//
//  Created by adnan alkharfan on 17/07/2021.
//

import UIKit
import CoreML
import Vision
import Alamofire
import SwiftyJSON
class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    let imagepicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagepicker.delegate = self
        imagepicker.sourceType = .photoLibrary
        imagepicker.allowsEditing = false
        lable.textAlignment = NSTextAlignment.left
        lable.sizeToFit()
        lable.text = ""
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var lable: UILabel!
    
    @IBAction func imageButton(_ sender: UIBarButtonItem) {
       
        present(imagepicker, animated: true, completion: nil)
    }
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
       
        let i = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        image.image = i
        
        let cii = CIImage(image: i as! UIImage) // take the image to visio
        do{
            let model = try VNCoreMLModel(for: FlowerClassifier().model) // init the model
            let re = VNCoreMLRequest(model: model) { (r, e) in
                if e != nil {
                    print(e?.localizedDescription)
                }else{
                    let result = r.results as! [VNClassificationObservation]
                 
        
                    
                    self.navigationItem.title = result[0].identifier
                    self.lable.textAlignment = .center
                
                    DispatchQueue.main.async {
                    
                        self.get(result[0].identifier)
                    }
                   
                    
                }
            }
            let hand = VNImageRequestHandler(ciImage: cii!)
            try hand.perform([re])
            
        }catch{}
        
        imagepicker.dismiss(animated: true, completion: nil)
    }
    
    func get(_ flowerName:String) {
         let wikipediaURl = "https://en.wikipedia.org/w/api.php"
     let parameters : [String:String] = [
      "format" : "json",
      "action" : "query",
      "prop" : "extracts",
      "exintro" : "",
      "explaintext" : "",
      "titles" : flowerName,
    "indexpageids" : "",
      "redirects" : "1",
      ]

     var r:desc = desc()
     DispatchQueue.main.async {
         Alamofire.request("\(wikipediaURl)",method: .get, parameters: parameters).validate().responseJSON { response in
                 switch response.result {
                 case .success(let value):
                     let json = JSON(value)
                    
                     let pageId=json["query"]["pageids"][0].string
            
                    self.lable.text = json["query"]["pages"]["\(pageId!)"]["extract"].string!
                    
                     break
                 default:
                     break
                   
                 }
             }
     }
     
     

   
     }
}


