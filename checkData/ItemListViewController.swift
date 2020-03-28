//
//  ItemListViewController.swift
//  checkData
//
//  Created by Hemant Tekwani on 22/03/20.
//  Copyright © 2020 Hemant Tekwani. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var itemListTableView: UITableView!
    var viewModel = ItemListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getItems(url: EndPoint.strUrl) { (_, error) in
            DispatchQueue.main.async {
                 if(error != nil){
                    self.errorLabel.text = error
                    self.itemListTableView.isHidden = true
                    self.errorLabel.isHidden = false
                }
                 else{
                    self.errorLabel.isHidden = true
                    self.itemListTableView.isHidden = false

                    self.itemListTableView.reloadData()
                }
                           
            }
           
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ItemListViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getNumberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell")
        if let cell = cell{
            cell.textLabel?.text = viewModel.cellDataToBeDisplayed(index: indexPath.row)
        }
        
        return cell!
    }
    
    
}
