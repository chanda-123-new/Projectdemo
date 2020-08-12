//
//  DetailsVC.swift
//  DemoForCompany
//
//  Created by chanda on 12/08/20.
//  Copyright © 2020 chanda. All rights reserved.
//

import UIKit
class DetailsVC: UIViewController{
   
    var labelFont = UIFont(name: "AvenirNext-DemiBold", size: 15.0)
    
    
    var amiibo: AmiiboForView?
   // var safeArea:UILayoutGuide!
    let imageIV = CustomImageView()
    let nameLabel = UILabel()
    let dismissButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
      //  safeArea = view.layoutMarginsGuide
        setupImage()
        setupName()
        setupData()
        setupdismissButton()
    }

    
    func setupImage(){
        view.addSubview(imageIV)
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        imageIV.contentMode = .scaleAspectFit
        imageIV.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageIV.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
        imageIV.widthAnchor.constraint(equalTo:view.widthAnchor, multiplier: 0.5).isActive = true
        imageIV.heightAnchor.constraint(equalTo: imageIV.widthAnchor).isActive = true
    }
    
    func setupName(){
        
        view.addSubview(nameLabel)
         nameLabel.font = labelFont
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo:imageIV.bottomAnchor, constant: 10).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //namelabel.trailling =
         nameLabel.trailingAnchor.constraint(equalTo: imageIV.trailingAnchor,constant: 0).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: imageIV.leadingAnchor, constant: 0).isActive = true
               nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        nameLabel.textColor = .white
        
    }
    
    
    func setupdismissButton(){
        view.addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -50).isActive = true
        dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //button.top = label.bottomAnchor + 100
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.addTarget(self, action:#selector(dismissAction), for: .touchUpInside)
        
    }
    
    func setupData(){
        
        if let amiibo = amiibo,let url = URL(string: amiibo.downloadurl!){
            imageIV.loadImage(from: url)
            nameLabel.text = amiibo.author
        }
    }
    
    @objc func dismissAction(){
        self.dismiss(animated: true)
    }
    
    
}
