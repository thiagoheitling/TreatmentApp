//
//  TreatmentCell.swift
//  TreatmentApp
//
//  Created by Thiago Heitling on 2017-03-10.
//  Copyright © 2017 Thiago Heitling. All rights reserved.
//

import UIKit

class TreatmentCell: UITableViewCell {
    
    var treatmentName: UILabel = {
        
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(r: 33, g: 187, b: 253)
        label.font = UIFont(name: "AvenirNext-Bold", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var treatmentAmount: UILabel = {
        
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(r: 64, g: 64, b: 64)
        label.font = UIFont(name: "AvenirNext-Bold", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var treatmentUnit: UILabel = {
        
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(r: 64, g: 64, b: 64)
        label.font = UIFont(name: "AvenirNext-Regular", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.separatorInset = UIEdgeInsets.zero
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        addSubview(treatmentName)
        
        // x, y, width, height constraints
        treatmentName.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        treatmentName.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        treatmentName.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        treatmentName.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/3).isActive = true
        
        addSubview(treatmentAmount)
        
        // x, y, width, height constraints
        treatmentAmount.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        treatmentAmount.topAnchor.constraint(equalTo: treatmentName.bottomAnchor, constant: 5).isActive = true
        treatmentAmount.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        treatmentAmount.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/4).isActive = true
        
        addSubview(treatmentUnit)
        
        // x, y, width, height constraints
        treatmentUnit.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        treatmentUnit.topAnchor.constraint(equalTo: treatmentAmount.bottomAnchor).isActive = true
        treatmentUnit.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        treatmentUnit.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/4).isActive = true
    }
    
    func configure() {
        
        treatmentName.text = "Jogging"
        treatmentAmount.text = "1200"
        treatmentUnit.text = "minute"
    }
}
