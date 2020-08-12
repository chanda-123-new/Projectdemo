//
//  AmiiboCell.swift
//  DemoForCompany
//
//  Created by chanda on 11/08/20.
//  Copyright © 2020 chanda. All rights reserved.
//

import UIKit

class AmiiboCell: UITableViewCell
{
    var safeArea:UILayoutGuide!
    let imageIV = CustomImageView()
     let nameLabel = UILabel()
    let gameSeriesLabel = UILabel()

    
    
    override init(style:UITableViewCell.CellStyle, reuseIdentifier:String?){
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  //MARK: SetUp
    
    func setupView(){
        safeArea = layoutMarginsGuide
        setupImageView()
        setupNameLabel()
        setupGameSeriesLabel()
      // setupOwnngCountLabel()
       
    }
    func setupImageView(){
        addSubview(imageIV)
           //imageIV.contentMode = .scaleAspectFit
         imageIV.translatesAutoresizingMaskIntoConstraints = false
      imageIV.leadingAnchor.constraint(equalTo:safeArea.leadingAnchor).isActive = true
      imageIV.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageIV.widthAnchor.constraint(equalToConstant: 45).isActive = true
        imageIV.heightAnchor.constraint(equalToConstant: 45).isActive = true
      
    }
    
    func setupNameLabel(){
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: imageIV.trailingAnchor,constant: 5).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor,constant: 5).isActive = true
        nameLabel.font = UIFont(name: "Verdana-Bold", size: 14)
        
    }
   
    func setupGameSeriesLabel(){
        addSubview(gameSeriesLabel)
        gameSeriesLabel.translatesAutoresizingMaskIntoConstraints = false
        gameSeriesLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        
        gameSeriesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        gameSeriesLabel.font = UIFont(name: "Verdana", size: 14)
    }
}
