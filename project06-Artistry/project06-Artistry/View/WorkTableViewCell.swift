//
//  WorkTableViewCell.swift
//  project06-Artistry
//
//  Created by 박성민 on 2021/05/19.
//

import UIKit

class WorkTableViewCell: UITableViewCell {

    @IBOutlet weak var workImageView: UIImageView!
    @IBOutlet weak var workTitleLabel: UILabel!
    @IBOutlet weak var moreInfoTextView: UITextView!
    
    let moreInfoText = "Select For More Info >"
    
    func configure(with work: Work) {
        workTitleLabel.text = work.title
        workImageView.image = work.image
        
        workTitleLabel.backgroundColor = UIColor(white: 204/255, alpha: 1)
        
        moreInfoTextView.textColor = UIColor(white: 114 / 255, alpha: 1)
        moreInfoTextView.text = work.isExpanded ? work.info : moreInfoText
        moreInfoTextView.textAlignment = work.isExpanded ? .left : .center
        
    }
    
    func selected(with work: Work) {
        moreInfoTextView.text = work.isExpanded ? work.info : moreInfoText
        moreInfoTextView.textAlignment = work.isExpanded ? .left : .center
    }
    
    
}
