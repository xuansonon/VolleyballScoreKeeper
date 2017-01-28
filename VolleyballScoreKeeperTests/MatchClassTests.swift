//
//  MatchClassTests.swift
//  VolleyballScoreKeeper
//
//  Created by Xuanson On on 24/1/17.
//  Copyright © 2017 Xuanson On. All rights reserved.
//

import XCTest

class MatchClassTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testMatchClassExists() {
        let maxPtInput = Int(arc4random_uniform(25) + 1)
        let maxSetInput = Int(arc4random_uniform(5) + 1)
        let match = Match(homeTeamName: "homeTeam", awayTeamName: "awayTeam", aMaxPts: maxPtInput, aMaxSets: maxSetInput)
        XCTAssertTrue(match.matchSettings.getMaxPoints() == maxPtInput)
        XCTAssertTrue(match.matchSettings.getMaxSets() == maxSetInput)
        XCTAssertTrue(match.homeTeam.getName() == "homeTeam")
        XCTAssertTrue(match.homeTeam.getSetsWon() == 0)
        XCTAssertTrue(match.homeTeam.getCurrentScore() == 0)
        XCTAssertTrue(match.homeTeam.getAllScores() == [])
        XCTAssertTrue(match.awayTeam.getName() == "awayTeam")
        XCTAssertTrue(match.awayTeam.getSetsWon() == 0)
        XCTAssertTrue(match.awayTeam.getCurrentScore() == 0)
        XCTAssertTrue(match.awayTeam.getAllScores() == [])
    }
    
    func testMatchCanChangeNames() {
        let match = Match(homeTeamName: "wrongHomeTeam", awayTeamName: "wrongAwayTeam", aMaxPts: 25, aMaxSets: 3)
        XCTAssertTrue((match.homeTeam.getName() == "wrongHomeTeam") && (match.awayTeam.getName() == "wrongAwayTeam"))
        match.teamChangeName(aTeam: match.homeTeam, aName: "homeTeam")
        match.teamChangeName(aTeam: match.awayTeam, aName: "awayTeam")
        XCTAssertFalse((match.homeTeam.getName() == "wrongHomeTeam") && (match.awayTeam.getName() == "wrongAwayTeam"))
        XCTAssertTrue((match.homeTeam.getName() == "homeTeam") && (match.awayTeam.getName() == "awayTeam"))
    }
    
    func testMatchCanChangeScores() {
        let match = Match(homeTeamName: "wrongHomeTeam", awayTeamName: "wrongAwayTeam", aMaxPts: 25, aMaxSets: 3)
        XCTAssertTrue(match.homeTeam.getCurrentScore() == 0 && match.awayTeam.getCurrentScore() == 0)
        match.teamScoreChange(aTeam: match.homeTeam, aFactor: 11)
        match.teamScoreChange(aTeam: match.awayTeam, aFactor: 16)
        XCTAssertTrue(match.homeTeam.getCurrentScore() == 11 && match.awayTeam.getCurrentScore() == 16)
    }
    
    func testMatchCanChangeTempMaxPoints() {
        let match = Match(homeTeamName: "wrongHomeTeam", awayTeamName: "wrongAwayTeam", aMaxPts: 25, aMaxSets: 3)
        XCTAssertTrue(match.tempMaxPoints == 25)
        match.increaseTempMaxPoints()
        XCTAssertTrue(match.tempMaxPoints == 26)
    }
    
    func testMatchCanFinishSet_ScenarioA() {
        let match = Match(homeTeamName: "wrongHomeTeam", awayTeamName: "wrongAwayTeam", aMaxPts: 25, aMaxSets: 3)
        match.teamScoreChange(aTeam: match.homeTeam, aFactor: 25)
        match.teamScoreChange(aTeam: match.awayTeam, aFactor: 21)
        match.finishSet()
        XCTAssertTrue(match.homeTeam.getCurrentScore() == 0 && match.awayTeam.getCurrentScore() == 0)
        XCTAssertTrue(match.homeTeam.getSetsWon() == 1 && match.awayTeam.getSetsWon() == 0)
        XCTAssertTrue(match.homeTeam.getAllScores() == [25] && match.awayTeam.getAllScores() == [21])
    }
    
    func testMatchCanFinishSet_ScenarioB() {
        let match = Match(homeTeamName: "wrongHomeTeam", awayTeamName: "wrongAwayTeam", aMaxPts: 25, aMaxSets: 3)
        match.teamScoreChange(aTeam: match.homeTeam, aFactor: 24)
        match.teamScoreChange(aTeam: match.awayTeam, aFactor: 24)
        match.increaseTempMaxPoints()
        match.teamScoreChange(aTeam: match.awayTeam, aFactor: 2)
        XCTAssertTrue(match.tempMaxPoints ==  26)
        match.finishSet()
        XCTAssertTrue(match.homeTeam.getCurrentScore() == 0 && match.awayTeam.getCurrentScore() == 0)
        XCTAssertTrue(match.homeTeam.getSetsWon() == 0 && match.awayTeam.getSetsWon() == 1)
        XCTAssertTrue(match.homeTeam.getAllScores() == [24] && match.awayTeam.getAllScores() == [26])
    }
    
    func testMatchCanFinishWithMultipleSets() {
        let match = Match(homeTeamName: "wrongHomeTeam", awayTeamName: "wrongAwayTeam", aMaxPts: 25, aMaxSets: 3)
        match.teamScoreChange(aTeam: match.homeTeam, aFactor: 25)
        match.teamScoreChange(aTeam: match.awayTeam, aFactor: 21)
        match.finishSet()
        match.teamScoreChange(aTeam: match.homeTeam, aFactor: 24)
        match.teamScoreChange(aTeam: match.awayTeam, aFactor: 24)
        match.increaseTempMaxPoints()
        match.teamScoreChange(aTeam: match.homeTeam, aFactor: 2)
        XCTAssertTrue(match.tempMaxPoints ==  26)
        match.finishSet()
        match.teamScoreChange(aTeam: match.homeTeam, aFactor: 25)
        match.teamScoreChange(aTeam: match.awayTeam, aFactor: 19)
        match.finishSet()
        XCTAssertTrue(match.homeTeam.getCurrentScore() == 0 && match.awayTeam.getCurrentScore() == 0)
        XCTAssertTrue(match.homeTeam.getSetsWon() == 3 && match.awayTeam.getSetsWon() == 0)
        XCTAssertTrue(match.homeTeam.getAllScores() == [25,26,25] && match.awayTeam.getAllScores() == [21,24,19])
    }
    
    func testMatchCanSoftReset() {
        let match = Match(homeTeamName: "wrongHomeTeam", awayTeamName: "wrongAwayTeam", aMaxPts: 25, aMaxSets: 3)
        match.teamScoreChange(aTeam: match.homeTeam, aFactor: 25)
        match.teamScoreChange(aTeam: match.awayTeam, aFactor: 21)
        match.finishSet()
        match.teamScoreChange(aTeam: match.homeTeam, aFactor: 14)
        match.teamScoreChange(aTeam: match.awayTeam, aFactor: 7)
        match.resetScores()
        XCTAssertTrue(match.homeTeam.getCurrentScore() == 0 && match.awayTeam.getCurrentScore() == 0)
        XCTAssertTrue(match.homeTeam.getAllScores() == [25] && match.homeTeam.getSetsWon() == 1)
        XCTAssertTrue(match.awayTeam.getAllScores() == [21] && match.awayTeam.getSetsWon() == 0)
    }
    
    func testMatchCanHardReset() {
        let match = Match(homeTeamName: "wrongHomeTeam", awayTeamName: "wrongAwayTeam", aMaxPts: 25, aMaxSets: 3)
        match.teamScoreChange(aTeam: match.homeTeam, aFactor: 25)
        match.teamScoreChange(aTeam: match.awayTeam, aFactor: 21)
        match.finishSet()
        match.teamScoreChange(aTeam: match.homeTeam, aFactor: 14)
        match.teamScoreChange(aTeam: match.awayTeam, aFactor: 7)
        match.resetMatch()
        XCTAssertTrue(match.homeTeam.getCurrentScore() == 0 && match.awayTeam.getCurrentScore() == 0)
        XCTAssertFalse(match.homeTeam.getAllScores() == [25] && match.homeTeam.getSetsWon() == 1)
        XCTAssertFalse(match.awayTeam.getAllScores() == [21] && match.awayTeam.getSetsWon() == 0)
        XCTAssertTrue(match.homeTeam.getSetsWon() == 0 && match.homeTeam.getSetsWon() == 0)
        XCTAssertTrue(match.homeTeam.getAllScores() == [] && match.awayTeam.getAllScores() == [])
    }
    
}
