//
//  AppleMusicUITests.swift
//  AppleMusicUITests
//
//  Created by Alex Peterson on 5/8/21.
//

import XCTest

class AppleMusicUITests: XCTestCase {
    
    private let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func test_if_grid_exists() throws {
        app.launch()
        XCTAssert(app.otherElements["albumGrid"].exists)
    }
    
//    func test_if_api_loaded_correctly() throws {
//        app.launch()
//        XCTAssert(app.collectionViews["item24"].exists)
//    }
}
