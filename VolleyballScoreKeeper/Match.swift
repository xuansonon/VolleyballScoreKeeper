//
//  Match.swift
//  VolleyballScoreKeeper
//
//  Created by Xuanson On on 23/1/17.
//  Copyright © 2017 Xuanson On. All rights reserved.
//

import Foundation

class Match {
    var homeTeam: TeamClass
    var awayTeam: TeamClass
    var matchSettings: MatchSettings
    var tempMaxPoints: Int
    
    init(homeTeamName: String, awayTeamName: String, aMaxPts: Int, aMaxSets: Int) {
        homeTeam = TeamClass(aTeamName: homeTeamName)
        awayTeam = TeamClass(aTeamName: awayTeamName)
        matchSettings = MatchSettings(aMaxPts: aMaxPts, aMaxSets: aMaxSets)
        tempMaxPoints = matchSettings.getMaxPoints()
    }
    
    func teamScoreChange(aTeam: TeamClass, aFactor: Int) {
        aTeam.changeCurrentScore(aDirection: aFactor)
    }
    
    func teamChangeName(aTeam: TeamClass, aName: String) {
        aTeam.changeName(aNewName: aName)
    }
    
    func increaseTempMaxPoints() {
        tempMaxPoints += 1
    }
    
    func finishSet() {
        if(homeTeam.getCurrentScore() == tempMaxPoints) {
            homeTeam.finishSet(setStatus: true)
            awayTeam.finishSet(setStatus: false)
        }
        
        if(awayTeam.getCurrentScore() == tempMaxPoints){
            homeTeam.finishSet(setStatus: false)
            awayTeam.finishSet(setStatus: true)
        }
        resetScores()
    }
    
    func resetScores() {
        tempMaxPoints = matchSettings.getMaxPoints()
        homeTeam.softReset()
        awayTeam.softReset()
    }
    
    func resetMatch() {
        tempMaxPoints = matchSettings.getMaxPoints()
        homeTeam.hardReset()
        awayTeam.hardReset()
    }
    
}
