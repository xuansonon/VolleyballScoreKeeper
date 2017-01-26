//
//  MatchSettings.swift
//  VolleyballScoreKeeper
//
//  Created by Xuanson On on 23/1/17.
//  Copyright © 2017 Xuanson On. All rights reserved.
//

import Foundation
class MatchSettings {
    private var maxPointsPerSet: Int
    private var maxSetsPerMatch: Int
    
    init(aMaxPts: Int, aMaxSets: Int) {
        maxPointsPerSet = aMaxPts
        maxSetsPerMatch = aMaxSets
    }
    
    func getMaxPoints() -> Int {
        return maxPointsPerSet
    }
    
    func getMaxSets() -> Int {
        return maxSetsPerMatch
    }
    
}
