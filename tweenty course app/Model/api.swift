//
//  api.swift
//  tweenty course app
//
//  Created by adnan alkharfan on 17/07/2021.
//

import Foundation

import SwiftyJSON
import Alamofire

struct desc{
    
    var s:String
    
    init(_ o:String) {
        s = o
    }
    init( ) {
        s = "hello"
    }
    
   static func get(_ flowerName:String) -> String{
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
           
                   r = desc ( json["query"]["pages"]["\(pageId!)"]["extract"].string!)
                    print(r.s)
                    break
                default:
                    break
                  
                }
            }
    }
    
    
    print(r.s)
    return r.s
    }
}
