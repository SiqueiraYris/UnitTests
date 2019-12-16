//
//  Protocols.swift
//  UnitTests
//
//  Created by Yris Siqueira on 08/12/19.
//  Copyright © 2019 Siqueira. All rights reserved.
//

import Foundation

protocol EventListInteractorProtocol: class {
    func fetchEvents(completion: @escaping (Error?, [Event]?) -> Void)
}
