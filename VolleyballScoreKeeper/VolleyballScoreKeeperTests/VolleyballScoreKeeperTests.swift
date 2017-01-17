//
//  VolleyballScoreKeeperTests.swift
//  VolleyballScoreKeeperTests
//
//  Created by Xuanson On on 7/07/2016.
//  Copyright © 2016 Xuanson On. All rights reserved.
//

import XCTest
@testable import VolleyballScoreKeeper

class VolleyballScoreKeeperTests: XCTestCase {
    
    func testSettingClassCanCreate() {
        let settings = Settings(inputSets: 3, inputPts: 25);
        XCTAssertTrue(settings.getPts() == 25)
        XCTAssertTrue(settings.getSets() == 3)
        XCTAssertTrue(settings.getStatus() == false)
    }
    
    func testTeamClassCanCreate() {
        let team = Team(teamName: "Team Name")
        XCTAssertTrue(team.getName() == "TEAM NAME")
        XCTAssertFalse(team.getName() == "Team Name")
        XCTAssertTrue(team.getSets() == 0)
        XCTAssertTrue(team.getScores() == [Int]())
    }
    
    func testTeamClassCanChangeName() {
        let team = Team(teamName: "Team Name")
        team.changeName("Another Team")
        XCTAssertTrue(team.getName() == "ANOTHER TEAM")
        XCTAssertFalse(team.getName() == "TEAM NAME")
    }
    
    func testTeamClassCanChangeSets() {
        let team = Team(teamName: "Team Name")
        let teamSets: Int = team.getSets()
        team.changeSets(teamSets + 1)
        XCTAssertTrue(team.getSets() == 1)
        XCTAssertFalse(team.getSets() == 0)
    }
    
    func testTeamClassCanChangeScores() {
        let team = Team(teamName: "Team Name")
        let teamScoreA: Int = 25
        let teamScoreB: Int = 26
        let teamScoreC: Int = 27
        team.addScore(teamScoreA)
        team.addScore(teamScoreB)
        team.addScore(teamScoreC)
        XCTAssertFalse(team.getScores() == [Int]())
        XCTAssertTrue(team.getScores() == [25, 26, 27])
        team.deleteScore(1)
        XCTAssertTrue(team.getScores() == [25, 27])
    }
    
    func testMatchClassCanCreate() {
        let match = Match(homeTeamName: "Home", awayTeamName: "Away", numSets: 3, numPoints: 25)
        XCTAssertTrue(match.homeTeam.getName() == "HOME")
        XCTAssertTrue(match.homeTeam.getSets() == 0)
        XCTAssertTrue(match.homeTeam.getScores() == [Int]())
        XCTAssertTrue(match.awayTeam.getName() == "AWAY")
        XCTAssertTrue(match.awayTeam.getSets() == 0)
        XCTAssertTrue(match.awayTeam.getScores() == [Int]())
        XCTAssertTrue(match.settings.getSets() == 3)
        XCTAssertTrue(match.settings.getPts() == 25)
        XCTAssertTrue(match.settings.getStatus() == false)
        XCTAssertTrue(match.homeTeamScore == 0)
        XCTAssertTrue(match.awayTeamScore == 0)
    }
    
    func testMatchClassCanChangeTeamNames() {
        let match = Match(homeTeamName: "Home", awayTeamName: "Away", numSets: 3, numPoints: 25)
        match.homeTeam.changeName("HaMe")
        match.awayTeam.changeName("AwON")
        XCTAssertTrue(match.homeTeam.getName() == "HAME")
        XCTAssertFalse(match.homeTeam.getName() == "HOME")
        XCTAssertTrue(match.awayTeam.getName() == "AWON")
        XCTAssertFalse(match.awayTeam.getName() == "AWAY")
    }
    
    func testMatchClassCanChangeLiveScores() {
        let match = Match(homeTeamName: "Home", awayTeamName: "Away", numSets: 3, numPoints: 25)
        match.homeTeamScore + 1
        match.awayTeamScore + 1
        
        XCTAssertTrue(match.homeTeamScore == 1)
        
    }
    
    func testMatchClassCanChangeSets() {
        let match = Match(homeTeamName: "Home", awayTeamName: "Away", numSets: 3, numPoints: 25)
        match.homeTeam.changeSets(1)
        match.awayTeam.changeSets(2)
        XCTAssertTrue(match.homeTeam.getSets() == 1)
        XCTAssertFalse(match.homeTeam.getSets() == 0)
        XCTAssertTrue(match.awayTeam.getSets() == 2)
        XCTAssertFalse(match.awayTeam.getSets() == 0)
    }
    
}
