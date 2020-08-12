//
//  CustomImageView.swift
//  DemoForCompany
//
//  Created by chanda on 11/08/20.
//  Copyright © 2020 chanda. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    
    var task: URLSessionDataTask!
    func loadImage(from url:URL){
        image = nil
        if let task = task
        {
                task.cancel()
        }
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage{
            self.image = imageFromCache
          
            return
        }
      
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data,let newImage = UIImage(data: data)else{
                return
            }
            
            imageCache.setObject(newImage, forKey: url.absoluteString as AnyObject)
            DispatchQueue.main.async {
                  self.image = newImage}
          
        }
        task.resume()
    }
    

}
