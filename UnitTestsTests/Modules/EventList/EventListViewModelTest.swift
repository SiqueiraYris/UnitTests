//
//  EventListViewModelTest.swift
//  UnitTestsTests
//
//  Created by Yris Siqueira on 08/12/19.
//  Copyright © 2019 Siqueira. All rights reserved.
//

import XCTest
@testable import UnitTests

class EventListViewModelTest: XCTestCase {
    
    var viewModel: EventListViewModel!
    var interactor: EventListInteractorProtocol!

    override func setUp() {
        interactor = EventListInteractorMock()
        viewModel = EventListViewModel(interactor: interactor)
        viewModel.delegate = self
    }

    override func tearDown() {
        viewModel = nil
        interactor = nil
    }

    func testFetchEvents() {
        viewModel.fetchEvents()
    }

}

extension EventListViewModelTest: EventListViewModelDelegate {
    
    // Testing model decode
    func updateData(events: [Event]) {
        XCTAssertNotNil(events)
    }
    
    func hasError(error: Error) {
        XCTFail(error.localizedDescription)
    }
    
}
