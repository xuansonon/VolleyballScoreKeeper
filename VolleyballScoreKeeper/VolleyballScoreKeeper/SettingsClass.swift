//
//  SettingsClass.swift
//  VolleyballScoreKeeper
//
//  Created by Xuanson On on 1/09/2016.
//  Copyright © 2016 Xuanson On. All rights reserved.
//

import Foundation

class Settings {
    fileprivate var numSets: Int
    fileprivate var numPts: Int
    fileprivate var isCompleted: Bool
    
    init(inputSets: Int, inputPts: Int) {
        numSets = inputSets
        numPts = inputPts
        isCompleted = false
    }
    
    func getSets() -> Int { return numSets }
    func getPts() -> Int {return numPts }
    func getStatus() -> Bool {return isCompleted }
    func setStatus(_ state: Bool) { isCompleted = state }
    
}
