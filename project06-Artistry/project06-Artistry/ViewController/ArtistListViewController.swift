//
//  ArtistListViewController.swift
//  project06-Artistry
//
//  Created by 박성민 on 2021/05/17.
//

import UIKit

class ArtistListViewController: UIViewController {
    let artists = Artist.artistsFromBundle()
    
    @IBOutlet weak var artistTableView: UITableView!
    
    override func viewDidLoad() {
        artistTableView.dataSource = self
        artistTableView.delegate = self
        artistTableView.rowHeight = UITableView.automaticDimension
        artistTableView.estimatedRowHeight = 150
        
        NotificationCenter.default.addObserver(forName: UIContentSizeCategory.didChangeNotification, object: .none, queue: OperationQueue.main) { [weak self] _ in
            self?.artistTableView.reloadData()
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ArtistDetailViewController,
           let indexPath = artistTableView.indexPathForSelectedRow {
            destination.selectedArtist = artists[indexPath.row]
        }
    }
    
}

extension ArtistListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "artistCell", for: indexPath) as? ArtistTableViewCell else {
            return UITableViewCell()
        }
        
        let artist = artists[indexPath.row]
        cell.configure(artist: artist)
        
        return cell
    }
}
