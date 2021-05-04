//
//  MemoTableViewCell.swift
//  project04-RxMemo
//
//  Created by 박성민 on 2021/05/03.
//

import UIKit

class MemoTableViewCell: UITableViewCell {

    @IBOutlet weak var memoTitleLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with memo: Memo) {
        memoTitleLabel.text = memo.title
        contentsLabel.text = memo.contents
        dateLabel.text = memo.date.getString()
    }

}
