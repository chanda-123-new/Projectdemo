//
//  ViewController.swift
//  DemoForCompany
//
//  Created by chanda on 11/08/20.
//  Copyright © 2020 chanda. All rights reserved.
//

import UIKit

class BasicVC: UIViewController {
let tableView = UITableView()
var safeArea:UILayoutGuide!
 
var amiiboList = [AmiiboForView]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
       SetupTableView()
        
        let anonymousFunction = {(fetchedAmiiboList: [AmiiboList]) in //[Amiibo]
           
            DispatchQueue.main.async {
                let amiiboForViewList = fetchedAmiiboList.map { amiibo in
                       return AmiiboForView(author:amiibo.author,id:amiibo.id,downloadurl:amiibo.downloadurl)
                    }
                       self.amiiboList = amiiboForViewList
                       self.tableView.reloadData()
                
                   }
                   
               }
             
        AmiiboAPI.shared.fetchData(onCompletion:anonymousFunction)
        
        
        
    }

   //MARK: SetupTableView

    func SetupTableView(){

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AmiiboCell.self, forCellReuseIdentifier: "cellid")
              tableView.dataSource = self
        tableView.delegate = self
        tableView.topAnchor.constraint(equalTo:safeArea.topAnchor).isActive = true
        print("1st")
tableView.leadingAnchor.constraint(equalTo:view.leadingAnchor).isActive = true
        print("2nd")
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}

//MARK: UITableViewDataSource
extension BasicVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return amiiboList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        let amiibo = amiiboList[indexPath.row]
       

        guard let amiiboCell = cell as? AmiiboCell else {
            return cell
        }
       
        amiiboCell.nameLabel.text = amiibo.author
        amiiboCell.gameSeriesLabel.text =  amiibo.id
        if let url = URL(string: amiibo.downloadurl!){
                  
             amiiboCell.imageIV.loadImage(from: url)
                
        }
        return cell
        
        
    }

       
   }
//MARK: TableView Delegate

extension BasicVC:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let detectAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            self.amiiboList.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        
        
        
       return UISwipeActionsConfiguration(actions: [detectAction])
        
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let amiibo = self.amiiboList[indexPath.row]
        let amiiboDetailsVC = DetailsVC()
        amiiboDetailsVC.amiibo = amiibo
        self.present(amiiboDetailsVC, animated: true)

    }
    
    
    
    
}
