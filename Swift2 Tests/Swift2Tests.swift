//
//  Swift2Tests.swift
//  Swift2
//
//  Created by Patrick Jayet on 23/06/15.
//  Copyright © 2015 Extrabright. All rights reserved.
//

import XCTest

@testable import Swift2


class Swift2Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()

    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    func testExample() {
        
        let controller = ViewController()
        assert(controller.plusOne(5) == 6)
        
    }
    
}
