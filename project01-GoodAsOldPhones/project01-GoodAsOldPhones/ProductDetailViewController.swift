//
//  ProductDetailViewController.swift
//  project01-GoodAsOldPhones
//
//  Created by 박성민 on 2021/04/04.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var phoneNameLabel: UILabel!
    @IBOutlet weak var phoneImageView: UIImageView!
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNameLabel.text = product?.name
        if let imageName = product?.fullScreenImageName {
            phoneImageView.image = UIImage(named: imageName)
        }
    }
    
    @IBAction func addToCartButtonDidTouch(_ sender: Any) {
        print("Add to cart successfully")
    }
    

}
