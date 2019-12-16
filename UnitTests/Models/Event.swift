//
//  Event.swift
//  UnitTests
//
//  Created by Yris Siqueira on 08/12/19.
//  Copyright © 2019 Siqueira. All rights reserved.
//

import Foundation

class Event: Codable {
    
    let id: String
    let title: String
    let date: Int
    let description: String
    let image: String
    let price: Float
    
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: EventCodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        date = try values.decode(Int.self, forKey: .date)
        description = try values.decode(String.self, forKey: .description)
        image = try values.decode(String.self, forKey: .image)
        price = try values.decode(Float.self, forKey: .price)
    }
    
}

extension Event {
    
    enum EventCodingKeys: String, CodingKey {
        case id, title, date, description, image, price
    }
    
}
