//
//  NetworkManager.swift
//  checkData
//
//  Created by Hemant Tekwani on 22/03/20.
//  Copyright © 2020 Hemant Tekwani. All rights reserved.
//

import Foundation

struct NetworkManager {
    public static let shared = NetworkManager()
    typealias completionBlock = ([Item]?, _ error : String?) -> ()
    
    func getData(urlString:String, completionBlock : @escaping completionBlock)
    {
         if let unwrappedUrl = URL(string: urlString){
            URLSession.shared.dataTask(with: unwrappedUrl, completionHandler: {(data, response, error) in
                    if (data != nil){
                        let jsonDecoder = JSONDecoder()
                        
         /* this worked
                       let items = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
                        let array = items?["items"]
                        if (array != nil){
                            let data1 = try? JSONSerialization.data(withJSONObject: array!, options: .prettyPrinted)
                            let itemArray = try? jsonDecoder.decode([Item].self, from: data1!)
                            */
                        
                        let items = try? jsonDecoder.decode(Items.self, from: data!)
                        let itemArray = items?.items

                            if (itemArray != nil){
                                completionBlock(itemArray,nil)
                            }
                            else{
                                completionBlock(nil,"data could not be decoded")
                            }
                        }
                else{
                    completionBlock(nil,"data is nil")
                    }
                }).resume()
        }
    }

}

