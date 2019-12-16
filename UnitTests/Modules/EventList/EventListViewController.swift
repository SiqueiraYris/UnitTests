//
//  EventListViewController.swift
//  UnitTests
//
//  Created by Yris Siqueira on 08/12/19.
//  Copyright © 2019 Siqueira. All rights reserved.
//

import UIKit

class EventListViewController: UIViewController {

    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var eventsTableView: UITableView! {
        didSet {
            eventsTableView.dataSource = self
            eventsTableView.delegate = self
        }
    }
    
    var events: [Event] = []
    
    var viewModel: EventListViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = EventListViewModel()
        viewModel.fetchEvents()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToEventDetail" {
//            if let destination = segue.destination as? EventDetailViewController {
//                destination.event = events[sender as! Int]
//            }
        }
    }

}

extension EventListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToEventDetail", sender: indexPath.row)
    }
    
}

extension EventListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        if let cell = cell as? EventCell {
            cell.configure(event: events[indexPath.row])
        }
        return cell
    }
    
}

extension EventListViewController: EventListViewModelDelegate {
    
    func updateData(events: [Event]) {
        self.events = events
        self.eventsTableView.reloadData()
        self.eventsTableView.isHidden = false
        self.loader.stopAnimating()
    }
    
    func hasError(error: Error) {
        self.showAlert(title: "Erro", message: error.localizedDescription)
        self.loader.stopAnimating()
    }
    
}
