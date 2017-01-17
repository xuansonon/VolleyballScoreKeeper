//
//  TeamClass.swift
//  VolleyballScoreKeeper
//
//  Created by Xuanson On on 1/09/2016.
//  Copyright © 2016 Xuanson On. All rights reserved.
//

import Foundation

class Team {
    
    fileprivate var name: String
    fileprivate var set: Int
    fileprivate var scores: [Int]
    
    init(teamName: String) {
        name = teamName.uppercased()
        set = 0
        scores = [Int]()
    }
    
    func getName() -> String { return name }
    func changeName(_ nameInput: String) { name = nameInput.uppercased() }
    
    func getSets() -> Int { return set }
    func changeSets(_ setInput: Int) { set = setInput }
    
    func getScores() -> [Int] {
        var result = [Int]()
        for i in scores {
            result.append(i)
        }
        return result
    }
    
    func addScore(_ score: Int) { scores.append(score) }
    func deleteScore(_ index: Int) { scores.remove(at: index) }
    
}
