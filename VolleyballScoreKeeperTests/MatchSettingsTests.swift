//
//  VolleyballScoreKeeperTests.swift
//  VolleyballScoreKeeperTests
//
//  Created by Xuanson On on 23/1/17.
//  Copyright © 2017 Xuanson On. All rights reserved.
//

import XCTest
@testable import VolleyballScoreKeeper

class MatchSettingsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testMatchSettingsExists() {
        let maxPtInput = Int(arc4random_uniform(25) + 1)
        let maxSetInput = Int(arc4random_uniform(5) + 1)
        let settings = MatchSettings(aMaxPts: maxPtInput, aMaxSets: maxSetInput)
        XCTAssertTrue(settings.getMaxPoints() == maxPtInput)
        XCTAssertTrue(settings.getMaxSets() == maxSetInput)
    }
    
}
