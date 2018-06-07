//
//  DemoCollectionViewCell.swift
//  CollectionViewDemo
//
//  Created by Omar Alshammari on 23/09/1439 AH.
//  Copyright © 1439 Omar Alshammari. All rights reserved.
//

import UIKit

class DemoCollectionViewCell: UICollectionViewCell {
    
    var demoView: UIView!
    var demoLabel: UILabel!
    
    var leadingConstraint: NSLayoutConstraint!
    
    init() {
        super.init(frame: CGRect.zero)
        self.setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        self.demoView = UIView(frame: CGRect.zero)
        self.demoLabel = UILabel(frame: CGRect.zero)
        
        self.demoView.translatesAutoresizingMaskIntoConstraints = false
        self.demoLabel.translatesAutoresizingMaskIntoConstraints = false

        self.demoView.backgroundColor = .blue
        self.demoLabel.textColor = .white
        
        self.contentView.addSubview(self.demoView)
        self.demoView.addSubview(self.demoLabel)
        
        self.configureConstraints()
    }
    
    func configureConstraints() {
        NSLayoutConstraint(item: self.demoView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50.0).isActive = true
        
        NSLayoutConstraint(item: self.demoView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 120.0).isActive = true

        self.leadingConstraint = NSLayoutConstraint(item: self.demoView, attribute: .leading, relatedBy: .equal, toItem: self.demoView.superview, attribute: .leading, multiplier: 1.0, constant: 8.0)
        self.leadingConstraint.isActive = true
        
        NSLayoutConstraint(item: self.demoLabel, attribute: .leading, relatedBy: .equal, toItem: self.demoView, attribute: .leading, multiplier: 1.0, constant: 4.0).isActive = true
        
        NSLayoutConstraint(item: self.demoLabel, attribute: .trailing, relatedBy: .equal, toItem: self.demoView, attribute: .trailing, multiplier: 1.0, constant: 4.0).isActive = true

        NSLayoutConstraint(item: self.demoLabel, attribute: .top, relatedBy: .equal, toItem: self.demoView, attribute: .top, multiplier: 1.0, constant: 4.0).isActive = true

        NSLayoutConstraint(item: self.demoLabel, attribute: .bottom, relatedBy: .equal, toItem: self.demoView, attribute: .bottom, multiplier: 1.0, constant: 4.0).isActive = true
    }
    
    func toggleMultiSelect(_ on: Bool)
    {
        self.leadingConstraint.constant = on ? 30.0 : 8.0;
        UIView.animate(withDuration: 0.5) {
            self.contentView.layoutIfNeeded()
        }
    }
}
