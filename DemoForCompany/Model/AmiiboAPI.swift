//
//  AmiiboAPI.swift
//  DemoForCompany
//
//  Created by chanda on 11/08/20.
//  Copyright © 2020 chanda. All rights reserved.
//

import Foundation
import UIKit

final class AmiiboAPI{
    
    static let shared = AmiiboAPI()
    
    func fetchData(onCompletion:@escaping ([AmiiboList])->()){
        
        var urlString = "https://picsum.photos/v2/list?page=2&limit=20"
                   let url = URL(string: urlString)
                   let task = URLSession.shared.dataTask(with: url!) { (data, resp, error) in
                       guard let data = data else{
                        print("\(error)")
                           return
                       }
                    guard let amiiboList = try? JSONDecoder().decode([AmiiboList].self, from: data) else{ //AmiiboList.self
                        print("Couldnt decode json")
                        return
                    }
                    //print(amiiboList.id)
                   // onCompletion(amiiboList.amiibo)
                    onCompletion(amiiboList)
                   print(amiiboList)
                   }
        
                task.resume()
            }
    
}
struct AmiiboList:Codable{
    let author:String?
    let id:String?
    let downloadurl:String?
   

    enum CodingKeys: String, CodingKey {
        case author
        case id
        case downloadurl = "download_url"
        
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        downloadurl = try values.decodeIfPresent(String.self, forKey: .downloadurl)
    }
    
    
}
