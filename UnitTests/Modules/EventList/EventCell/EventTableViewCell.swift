//
//  EventTableViewCell.swift
//  UnitTests
//
//  Created by Yris Siqueira on 08/12/19.
//  Copyright © 2019 Siqueira. All rights reserved.
//

import UIKit
import Kingfisher

class EventCell: UITableViewCell {
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var price: UILabel!
    
    func configure(event: Event) {
        eventName.text = event.title
        eventDescription.text = event.description
        price.text = String(event.price)
        
        if let imageURL = URL(string: event.image) {
            eventImage.kf.setImage(with: imageURL)
        }
    }
    
}
