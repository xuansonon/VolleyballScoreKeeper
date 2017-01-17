//
//  MatchClass.swift
//  VolleyballScoreKeeper
//
//  Created by Xuanson On on 27/07/2016.
//  Copyright © 2016 Xuanson On. All rights reserved.
//

import Foundation

class Match {
    var homeTeam: Team
    var awayTeam: Team
    var settings: Settings
    
    var homeTeamScore: Int
    var awayTeamScore: Int
    
    init(homeTeamName: String, awayTeamName: String, numSets: Int, numPoints: Int) {
        if(homeTeamName.isEmpty) { homeTeam = Team(teamName: "home") }
            else { homeTeam = Team(teamName: homeTeamName) }
        
        if(awayTeamName.isEmpty) { awayTeam = Team(teamName: "away") }
            else { awayTeam = Team(teamName: awayTeamName) }
        
        settings = Settings(inputSets: numSets, inputPts: numPoints)
        
        homeTeamScore = 0
        awayTeamScore = 0
    }
}



