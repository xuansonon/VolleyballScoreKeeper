//
//  LiveGameView.swift
//  VolleyballScoreKeeper
//
//  Created by Xuanson On on 7/07/2016.
//  Copyright © 2016 Xuanson On. All rights reserved.
//

import Foundation
import UIKit

class LiveGameView: UIViewController {
    
    //Match Object
    var match: Match?
    
    //Objects
    @IBOutlet weak var matchLabel: UILabel!
    @IBOutlet weak var leftTeamLabel: UILabel!
    @IBOutlet weak var rightTeamLabel: UILabel!
    @IBOutlet weak var leftScoreLabel: UILabel!
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftTeamLabel.text = match!.homeTeam.getName()
        leftScoreLabel.text = (String)(match!.homeTeamScore)
        rightTeamLabel.text = match!.awayTeam.getName()
        rightScoreLabel.text = (String)(match!.awayTeamScore)
        matchLabel.text = ""
        // Do any additional setup after loading the view, typically from a nib.
        print("View has loaded!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction override func unwind(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {}
    
    //Buttons
    @IBAction func leftSideRemove(_ sender: AnyObject) {
        if(leftTeamLabel.text == match!.homeTeam.getName()) {
            if(match!.homeTeamScore > 0) {
                match!.homeTeamScore -= 1
            }
        }
        if(leftTeamLabel.text == match!.awayTeam.getName()) {
            if(match!.awayTeamScore > 0) {
                match!.awayTeamScore -= 1
            }
        }
        updateUI()
        print(leftTeamLabel.text)
    }
    
    @IBAction func rightSideRemove(_ sender: AnyObject) {
        if(rightTeamLabel.text == match!.homeTeam.getName()) {
            if(match!.homeTeamScore > 0) {
                match!.homeTeamScore -= 1
            }
        }
        if(rightTeamLabel.text == match!.awayTeam.getName()) {
            if(match!.awayTeamScore > 0) {
                match!.awayTeamScore -= 1
            }
        }
        updateUI()
        print("rightSideRemove button pressed")
    }
    
    @IBAction func leftSideAdd(_ sender: AnyObject) {
        if(leftTeamLabel.text == match!.homeTeam.getName()) {
            match!.homeTeamScore += 1
        }
        if(leftTeamLabel.text == match!.awayTeam.getName()) {
            match!.awayTeamScore += 1
        }
        updateUI()
        print("leftSideAdd button pressed")
    }
    
    @IBAction func rightSideAdd(_ sender: AnyObject) {
        if(rightTeamLabel.text == match!.homeTeam.getName()) {
            match!.homeTeamScore += 1
        }
        if(rightTeamLabel.text == match!.awayTeam.getName()) {
            match!.awayTeamScore += 1
        }
        updateUI()
        print("rightSideAdd button pressed")
    }
    
    @IBAction func swapSides(_ sender: AnyObject) {
        if(leftTeamLabel.text == match!.homeTeam.getName()) {
            leftTeamLabel.text = match!.awayTeam.getName()
            leftScoreLabel.text = (String)(match!.awayTeamScore)
            rightTeamLabel.text = match!.homeTeam.getName()
            rightScoreLabel.text = (String)(match!.homeTeamScore)
        } else {
            leftTeamLabel.text = match!.homeTeam.getName()
            leftScoreLabel.text = (String)(match!.homeTeamScore)
            rightTeamLabel.text = match!.awayTeam.getName()
            rightScoreLabel.text = (String)(match!.awayTeamScore)
        }
        print("swapSides button pressed")
    }
    
    @IBAction func resetScores(_ sender: AnyObject) {
        match!.homeTeamScore = 0
        match!.awayTeamScore = 0
        updateUI()
        print("resetScores button pressed")
    }
    
    func updateUI() {
        checkStatus()
        if(leftTeamLabel.text == match!.homeTeam.getName()) {
            leftScoreLabel.text = (String)(match!.homeTeamScore)
            rightScoreLabel.text = (String)(match!.awayTeamScore)
        } else {
            leftScoreLabel.text = (String)(match!.awayTeamScore)
            rightScoreLabel.text = (String)(match!.homeTeamScore)
        }
    }
    
    func checkStatus() {
        
    }
    
}

