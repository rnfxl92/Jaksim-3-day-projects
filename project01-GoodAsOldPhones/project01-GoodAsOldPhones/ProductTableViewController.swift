//
//  ProductTableViewController.swift
//  project01-GoodAsOldPhones
//
//  Created by 박성민 on 2021/04/04.
//

import UIKit

class ProductTableViewController: UITableViewController {
    private var products: [Product] = [
        Product(name: "1907 Wall Set", imageName: "image-cell1", fullScreenImageName: "phone-fullscreen1"),
        Product(name: "1921 Dial Phone", imageName: "image-cell2", fullScreenImageName: "phone-fullscreen2"),
        Product(name: "1937 Desk Set", imageName: "image-cell3", fullScreenImageName: "phone-fullscreen3"),
        Product(name: "1984 Moto Portable", imageName: "image-cell4", fullScreenImageName: "phone-fullscreen4")
      ]
    private let identifier = "productCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProduct" {
            if let cell = sender as? UITableViewCell,
               let indexPath = tableView.indexPath(for: cell),
               let productDetailVC = segue.destination as? ProductDetailViewController {
                productDetailVC.product = products[indexPath.row]
            }
        }
    }
}

// MARK: - Table view data source
extension ProductTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return products.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = products[indexPath.row].name
        cell.imageView?.image = UIImage(named: products[indexPath.row].imageName)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
