//
//  ArtistTableViewCell.swift
//  project06-Artistry
//
//  Created by 박성민 on 2021/05/18.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var artistImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func configure(artist: Artist) {
        bioLabel.text = artist.bio
        bioLabel.textColor = UIColor(white: 114/255, alpha: 1)
        
        artistImageView.image = artist.image
        
        nameLabel.text = artist.name
        nameLabel.backgroundColor = UIColor(red: 1, green: 152 / 255, blue: 0, alpha: 1)
        nameLabel.textColor = UIColor.white
        
        
        
    }
}
