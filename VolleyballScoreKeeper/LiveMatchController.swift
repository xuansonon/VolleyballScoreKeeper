//
//  ViewController.swift
//  VolleyballScoreKeeper
//
//  Created by Xuanson On on 23/1/17.
//  Copyright © 2017 Xuanson On. All rights reserved.
//

import UIKit
import Foundation

class LiveMatchController: UIViewController {
    
    var currentMatch: Match?
    @IBOutlet weak var LeftTeamNameLabel: UILabel!
    @IBOutlet weak var LeftTeamCurrentScore: UILabel!
    @IBOutlet weak var RightTeamNameLabel: UILabel!
    @IBOutlet weak var RightTeamCurrentScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LeftTeamNameLabel.text = currentMatch!.homeTeam.getName()
        LeftTeamCurrentScore.text = "\(currentMatch!.homeTeam.getCurrentScore())"
        RightTeamNameLabel.text = currentMatch!.awayTeam.getName()
        RightTeamCurrentScore.text = "\(currentMatch!.awayTeam.getCurrentScore())"
        let leftIncreaseTap = UITapGestureRecognizer(target: self, action: #selector(LiveMatchController.leftIncreaseTap))
        let leftDecreaseTap = UITapGestureRecognizer(target: self, action: #selector(LiveMatchController.leftDecreaseTap))
        let rightIncreaseTap = UITapGestureRecognizer(target: self, action: #selector(LiveMatchController.rightIncreaseTap))
        let rightDecreaseTap = UITapGestureRecognizer(target: self, action: #selector(LiveMatchController.rightDecreaseTap))
        LeftTeamCurrentScore.isUserInteractionEnabled = true
        LeftTeamNameLabel.isUserInteractionEnabled = true
        RightTeamNameLabel.isUserInteractionEnabled = true
        RightTeamCurrentScore.isUserInteractionEnabled = true
        LeftTeamCurrentScore.addGestureRecognizer(leftIncreaseTap)
        LeftTeamNameLabel.addGestureRecognizer(leftDecreaseTap)
        RightTeamNameLabel.addGestureRecognizer(rightDecreaseTap)
        RightTeamCurrentScore.addGestureRecognizer(rightIncreaseTap)
    }
    
    @IBAction func resetScoresButton(_ sender: Any) {
        currentMatch!.resetScores()
        updateUI()
    }
    
    func swapSides() {
        if(LeftTeamNameLabel.text == currentMatch?.homeTeam.getName()) {
            LeftTeamNameLabel.text = currentMatch?.awayTeam.getName()
            LeftTeamCurrentScore.text = "\(currentMatch?.awayTeam.getCurrentScore())"
            RightTeamNameLabel.text = currentMatch?.homeTeam.getName()
            RightTeamCurrentScore.text = "\(currentMatch?.homeTeam.getCurrentScore())"
        } else {
            LeftTeamNameLabel.text = currentMatch?.homeTeam.getName()
            LeftTeamCurrentScore.text = "\(currentMatch?.homeTeam.getCurrentScore())"
            RightTeamNameLabel.text = currentMatch?.awayTeam.getName()
            RightTeamCurrentScore.text = "\(currentMatch?.awayTeam.getCurrentScore())"
        }
        updateUI()
    }
    
    @IBAction func swapSidesButton(_ sender: Any) {
        swapSides()
    }
    
    @IBAction func endSetsButton(_ sender: Any) {
        currentMatch!.finishSet()
        swapSides()
        updateUI()
    }
    
    func leftIncreaseTap(sender: UITapGestureRecognizer) {
        if(LeftTeamNameLabel.text == currentMatch!.homeTeam.getName()) {
            if((currentMatch!.homeTeam.getCurrentScore() != currentMatch!.tempMaxPoints) && (currentMatch!.awayTeam.getCurrentScore() != currentMatch!.tempMaxPoints)) {
                currentMatch!.homeTeam.changeCurrentScore(aDirection: 1)
            }
        } else {
            if((currentMatch!.awayTeam.getCurrentScore() != currentMatch!.tempMaxPoints) && (currentMatch!.homeTeam.getCurrentScore() != currentMatch!.tempMaxPoints)) {
                currentMatch!.awayTeam.changeCurrentScore(aDirection: 1)
            }
        }
        updateUI()
    }
    
    func rightIncreaseTap(sender: UITapGestureRecognizer) {
        if(RightTeamNameLabel.text == currentMatch!.homeTeam.getName()) {
            if((currentMatch!.homeTeam.getCurrentScore() != currentMatch!.tempMaxPoints) && (currentMatch!.awayTeam.getCurrentScore() != currentMatch!.tempMaxPoints)) {
                currentMatch!.homeTeam.changeCurrentScore(aDirection: 1)
            }
        } else {
            if((currentMatch!.awayTeam.getCurrentScore() != currentMatch!.tempMaxPoints) && (currentMatch!.homeTeam.getCurrentScore() != currentMatch!.tempMaxPoints)) {
                currentMatch!.awayTeam.changeCurrentScore(aDirection: 1)
            }
        }
        updateUI()
    }
    
    func leftDecreaseTap(sender: UITapGestureRecognizer) {
        if(LeftTeamNameLabel.text == currentMatch!.homeTeam.getName()) {
            if((currentMatch!.homeTeam.getCurrentScore()) > 0) {
                currentMatch!.homeTeam.changeCurrentScore(aDirection: -1)
            }
        } else {
            if((currentMatch!.awayTeam.getCurrentScore()) > 0) {
                currentMatch!.awayTeam.changeCurrentScore(aDirection: -1)
            }
        }
        updateUI()
    }
    
    func rightDecreaseTap(sender: UITapGestureRecognizer) {
        if(RightTeamNameLabel.text == currentMatch!.homeTeam.getName()) {
            if((currentMatch!.homeTeam.getCurrentScore()) > 0) {
                currentMatch!.homeTeam.changeCurrentScore(aDirection: -1)
            }
        } else {
            if((currentMatch!.awayTeam.getCurrentScore()) > 0) {
                currentMatch!.awayTeam.changeCurrentScore(aDirection: -1)
            }
        }
        updateUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToMatchView(segue: UIStoryboardSegue) {}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        let destination: MatchStatisticsController = segue.destination as! MatchStatisticsController
        destination.currentMatchStatistics = currentMatch
    }
    
    func updateUI() {
        if((currentMatch!.homeTeam.getCurrentScore() == ((currentMatch!.tempMaxPoints) - 1)) && ((currentMatch!.awayTeam.getCurrentScore()) == ((currentMatch!.tempMaxPoints) - 1))) {
            currentMatch!.increaseTempMaxPoints()
        }
        if(LeftTeamNameLabel.text == currentMatch!.homeTeam.getName()) {
            LeftTeamCurrentScore.text = "\(currentMatch!.homeTeam.getCurrentScore())"
            RightTeamCurrentScore.text = "\(currentMatch!.awayTeam.getCurrentScore())"
        } else {
            LeftTeamCurrentScore.text = "\(currentMatch!.awayTeam.getCurrentScore())"
            RightTeamCurrentScore.text = "\(currentMatch!.homeTeam.getCurrentScore())"
        }
    }
    
    
}

