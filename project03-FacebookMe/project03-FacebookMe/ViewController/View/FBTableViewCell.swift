//
//  FBTableViewCell.swift
//  project03-FacebookMe
//
//  Created by 박성민 on 2021/04/07.
//

import UIKit

class FBTableViewCell: UITableViewCell {
    static let identifier = "FBTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = Specs.color.white
        
        textLabel?.textColor = Specs.color.black
        textLabel?.font = Specs.font.large
        
        detailTextLabel?.font = Specs.font.small
        detailTextLabel?.textColor = Specs.color.gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
