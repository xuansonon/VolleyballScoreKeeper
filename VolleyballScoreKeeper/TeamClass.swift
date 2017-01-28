//
//  TeamClass.swift
//  VolleyballScoreKeeper
//
//  Created by Xuanson On on 23/1/17.
//  Copyright © 2017 Xuanson On. All rights reserved.
//

import Foundation
class TeamClass {
    private var teamName: String
    private var setsWon: Int
    private var currentScore: Int
    private var allScores: [Int]
    var ScoreRuns: [Int]
    
    init(aTeamName: String) {
        teamName = aTeamName
        setsWon = 0
        currentScore = 0
        allScores = []
        ScoreRuns = []
    }
    
    func getName() -> String {
        return teamName
    }
    
    func changeName(aNewName: String) {
        teamName = aNewName
    }
    
    func getSetsWon() -> Int {
        return setsWon
    }
    
    func getCurrentScore() -> Int {
        return currentScore
    }
    
    func changeCurrentScore(aDirection: Int) {
        currentScore += aDirection
    }
    
    func getAllScores() -> [Int] {
        return allScores
    }
    
    func softReset() {
        currentScore = 0
        ScoreRuns = []
    }
    
    //A SUPER PRIVATE FUNCTION (ONLY FOR TESTING)
    func _alterSetsWon(aNumber: Int) {
        setsWon += aNumber
    }
    
    func hardReset() {
        softReset()
        setsWon = 0
    }
    
    func finishSet(setStatus: Bool) {
        if(setStatus) {
            setsWon += 1
        }
        allScores.append(currentScore)
        softReset()
    }
    
}
