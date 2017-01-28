//
//  TeamClassTests.swift
//  VolleyballScoreKeeper
//
//  Created by Xuanson On on 24/1/17.
//  Copyright © 2017 Xuanson On. All rights reserved.
//

import XCTest

class TeamClassTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testTeamClassExists() {
        let someTeam = TeamClass(aTeamName: "Team")
        XCTAssertTrue(someTeam.getName() == "Team")
        XCTAssertTrue(someTeam.getSetsWon() == 0)
        XCTAssertTrue(someTeam.getCurrentScore() == 0)
        XCTAssertTrue(someTeam.getAllScores() == [])
    }
    
    func testTeamCanChangeName() {
        let someTeam = TeamClass(aTeamName: "This Team Sucks")
        XCTAssertTrue(someTeam.getName() == "This Team Sucks")
        XCTAssertFalse(someTeam.getName() == "This Team Rules")
        someTeam.changeName(aNewName: "This Team Rules")
        XCTAssertFalse(someTeam.getName() == "This Team Sucks")
        XCTAssertTrue(someTeam.getName() == "This Team Rules")
    }
    
    func testTeamCanChangeCurrentScore() {
        let someTeam = TeamClass(aTeamName: "Team")
        XCTAssertTrue(someTeam.getCurrentScore() == 0)
        someTeam.changeCurrentScore(aDirection: 1)
        XCTAssertFalse(someTeam.getCurrentScore() == 0)
        XCTAssertTrue(someTeam.getCurrentScore() == 1)
        someTeam.changeCurrentScore(aDirection: 1)
        XCTAssertFalse((someTeam.getCurrentScore() == 0) && (someTeam.getCurrentScore() == 1))
        XCTAssertTrue(someTeam.getCurrentScore() == 2)
        someTeam.changeCurrentScore(aDirection: -1)
        XCTAssertFalse((someTeam.getCurrentScore() == 0) && (someTeam.getCurrentScore() == 2))
        XCTAssertTrue(someTeam.getCurrentScore() == 1)
    }
    
    func testTeamCanSoftReset() {
        let someTeam = TeamClass(aTeamName: "Team")
        XCTAssertTrue(someTeam.getCurrentScore() == 0)
        someTeam.changeCurrentScore(aDirection: 12)
        XCTAssertTrue(someTeam.getCurrentScore() == 12)
        XCTAssertFalse(someTeam.getCurrentScore() == 0)
        someTeam.softReset()
        XCTAssertTrue(someTeam.getCurrentScore() == 0)
        XCTAssertFalse(someTeam.getCurrentScore() == 12)
    }
    
    func testTeamCanHardReset() {
        let someTeam = TeamClass(aTeamName: "Team")
        XCTAssertTrue(someTeam.getCurrentScore() == 0)
        XCTAssertTrue(someTeam.getSetsWon() == 0)
        someTeam.changeCurrentScore(aDirection: 12)
        someTeam._alterSetsWon(aNumber: 2)
        XCTAssertTrue(someTeam.getCurrentScore() == 12)
        XCTAssertTrue(someTeam.getSetsWon() == 2)
        someTeam.hardReset()
        XCTAssertTrue(someTeam.getCurrentScore() == 0)
        XCTAssertTrue(someTeam.getSetsWon() == 0)
    }
    
    func testTeamCanFinishSet() {
        let someTeam = TeamClass(aTeamName: "Team")
        XCTAssertTrue(someTeam.getCurrentScore() == 0)
        XCTAssertTrue(someTeam.getSetsWon() == 0)
        XCTAssertTrue(someTeam.getAllScores() == [])
        someTeam.changeCurrentScore(aDirection: 25)
        someTeam.finishSet(setStatus: true)
        XCTAssertTrue(someTeam.getAllScores() == [25])
        XCTAssertTrue(someTeam.getSetsWon() == 1)
        XCTAssertTrue(someTeam.getCurrentScore() == 0)
        someTeam.changeCurrentScore(aDirection: 21)
        someTeam.finishSet(setStatus: false)
        XCTAssertTrue(someTeam.getAllScores() == [25,21])
        XCTAssertTrue(someTeam.getSetsWon() == 1)
        XCTAssertFalse(someTeam.getSetsWon() == 2)
        XCTAssertTrue(someTeam.getCurrentScore() == 0)
        
    }

    
}
