//
//  ViewController.swift
//  VolleyballScoreKeeper
//
//  Created by Xuanson On on 23/1/17.
//  Copyright © 2017 Xuanson On. All rights reserved.
//

import UIKit
import Foundation

class MatchStatisticsController: UIViewController {
    
    var currentMatchStatistics: Match?
    
    private var HTScoreLabels = [UILabel]()
    private var ATScoreLabels = [UILabel]()
    
    @IBOutlet weak var HomeTeamNameLabel: UILabel!
    @IBOutlet weak var HomeTeamSetsWonLabel: UILabel!
    @IBOutlet weak var HomeTeamAllScoresLabel: UILabel!
    
    @IBOutlet weak var HTScore1: UILabel!
    @IBOutlet weak var HTScore2: UILabel!
    @IBOutlet weak var HTScore3: UILabel!
    @IBOutlet weak var HTScore4: UILabel!
    @IBOutlet weak var HTScore5: UILabel!
    @IBOutlet weak var HTScore6: UILabel!
    @IBOutlet weak var HTScore7: UILabel!
    @IBOutlet weak var HTScore8: UILabel!
    @IBOutlet weak var HTScore9: UILabel!
    @IBOutlet weak var HTScore10: UILabel!
    
    @IBOutlet weak var AwayTeamNameLabel: UILabel!
    @IBOutlet weak var AwayTeamSetsWonLabel: UILabel!
    @IBOutlet weak var AwayTeamAllScoresLabel: UILabel!
    
    @IBOutlet weak var ATScore1: UILabel!
    @IBOutlet weak var ATScore2: UILabel!
    @IBOutlet weak var ATScore3: UILabel!
    @IBOutlet weak var ATScore4: UILabel!
    @IBOutlet weak var ATScore5: UILabel!
    @IBOutlet weak var ATScore6: UILabel!
    @IBOutlet weak var ATScore7: UILabel!
    @IBOutlet weak var ATScore8: UILabel!
    @IBOutlet weak var ATScore9: UILabel!
    @IBOutlet weak var ATScore10: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HTScoreLabels = [HTScore1, HTScore2, HTScore3, HTScore4, HTScore5, HTScore6, HTScore7, HTScore8, HTScore9, HTScore10]
        ATScoreLabels = [ATScore1, ATScore2, ATScore3, ATScore4, ATScore5, ATScore6, ATScore7, ATScore8, ATScore9, ATScore10]
        for HTScore in HTScoreLabels {
            HTScore.text = ""
        }
        for ATScore in ATScoreLabels {
            ATScore.text = ""
        }
        
        HomeTeamNameLabel.text = currentMatchStatistics!.homeTeam.getName()
        HomeTeamSetsWonLabel.text = "\(currentMatchStatistics!.homeTeam.getSetsWon())"
        var homeTeamAllScores: String = String()
        for score in (currentMatchStatistics!.homeTeam.getAllScores()) {
            homeTeamAllScores += "\(score) | "
        }
        homeTeamAllScores += "\(currentMatchStatistics!.homeTeam.getCurrentScore())"
        HomeTeamAllScoresLabel.text = homeTeamAllScores
        
        AwayTeamNameLabel.text = currentMatchStatistics!.awayTeam.getName()
        AwayTeamSetsWonLabel.text = "\(currentMatchStatistics!.awayTeam.getSetsWon())"
        
        var awayTeamAllScores: String = String()
        for score in (currentMatchStatistics!.awayTeam.getAllScores()) {
            awayTeamAllScores += "\(score) | "
        }
        awayTeamAllScores += "\(currentMatchStatistics!.awayTeam.getCurrentScore())"
        AwayTeamAllScoresLabel.text = awayTeamAllScores
        //AwayTeamAllScoresLabel.text = "\(currentMatchStatistics!.awayTeam.getAllScores())"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

