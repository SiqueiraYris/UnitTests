//
//  EventListInteractor.swift
//  UnitTests
//
//  Created by Yris Siqueira on 08/12/19.
//  Copyright © 2019 Siqueira. All rights reserved.
//

import Foundation
import Alamofire

class EventListInteractor: EventListInteractorProtocol {
    
    func fetchEvents(completion: @escaping (Error?, [Event]?) -> Void) {
        let url: String = "https://apiurl.aqui"
        
        Alamofire.request(url)
          .responseJSON { response in
            if let error = response.result.error {
                completion(error, nil)
            }

            if let data = response.data,
                let events = try? JSONDecoder.init().decode([Event].self, from: data) {
                completion(nil, events)
            } else {
                completion(nil, [])
            }
        }
    }
    
}
