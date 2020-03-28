//
//  ItemListViewModel.swift
//  checkData
//
//  Created by Hemant Tekwani on 21/03/20.
//  Copyright © 2020 Hemant Tekwani. All rights reserved.
//

import Foundation

class ItemListViewModel{
  var itemListArray = [Item]()
    var error : String?
    typealias completionBlock = ([Item]?, _ error : String?) -> ()

    func getItems (url : String, completionBlock : @escaping completionBlock){
        NetworkManager.shared.getData(urlString: url) {[weak self] (listArray, error) in
            if let errorString = error{
                //show alert
                print("error: \(errorString)")
                completionBlock(nil, errorString)
            }
            else if (listArray?.count != 0){
                self?.itemListArray = listArray!
                completionBlock(listArray!,nil)
            }
        }
    }
    
    func getNumberOfItems() -> Int
    {
        return self.itemListArray.count
    }
    
    func itemAtIndex (index : Int) -> Item {
        return itemListArray[index]
    }
    
    func cellDataToBeDisplayed (index : Int) -> String {
        let item = itemAtIndex(index: index)
        let name = item.name ?? "name could not be found"
        let desc = item.description ?? "des not found"
        
        return name + " " + desc
    }
    
}





