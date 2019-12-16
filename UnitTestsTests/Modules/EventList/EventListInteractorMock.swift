//
//  EventListInteractorMock.swift
//  UnitTestsTests
//
//  Created by Yris Siqueira on 08/12/19.
//  Copyright © 2019 Siqueira. All rights reserved.
//

import Foundation
@testable import UnitTests

class EventListInteractorMock: EventListInteractorProtocol {
    
    func fetchEvents(completion: @escaping (Error?, [Event]?) -> Void) {
        guard let path = Bundle.main.path(forResource: "events", ofType: "json") else {
            fatalError("Doesnt find any events.json on this project")
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
            fatalError("Error on creating data from events.json")
        }
        
        if let events = try? JSONDecoder.init().decode([Event].self, from: data) {
            completion(nil, events)
        } else {
            completion(nil, [])
        }
    }
    
}
