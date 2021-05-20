//
//  ArtistDetailViewController.swift
//  project06-Artistry
//
//  Created by 박성민 on 2021/05/19.
//

import UIKit

class ArtistDetailViewController: UIViewController {

    var selectedArtist: Artist!
    
    @IBOutlet weak var workTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedArtist.name
        
        workTableView.delegate = self
        workTableView.dataSource = self
        workTableView.rowHeight = UITableView.automaticDimension
        workTableView.estimatedRowHeight = 300
        
        NotificationCenter.default.addObserver(forName: UIContentSizeCategory.didChangeNotification, object: .none, queue: OperationQueue.main) { [weak self] _ in
            self?.workTableView.reloadData()
        }
    }
}

extension ArtistDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedArtist.works.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "workCell", for: indexPath) as? WorkTableViewCell else {
            return UITableViewCell()
        }
        let work = selectedArtist.works[indexPath.row]
        cell.configure(with: work)
        
        return cell
    }
    
    
}


extension ArtistDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = workTableView.cellForRow(at: indexPath) as? WorkTableViewCell else {
            return
        }
        
        var work = selectedArtist.works[indexPath.row]
        
        work.isExpanded = !work.isExpanded
        selectedArtist.works[indexPath.row] = work
        
        cell.selected(with: work)
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
}
