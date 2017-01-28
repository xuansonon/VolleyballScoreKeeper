//
//  PreMatchController.swift
//  VolleyballScoreKeeper
//
//  Created by Xuanson On on 26/1/17.
//  Copyright © 2017 Xuanson On. All rights reserved.
//

import Foundation
import UIKit

class PreMatchController: UIViewController {
    
    @IBOutlet weak var HomeTeamTextbox: UITextField!
    @IBOutlet weak var AwayTeamTextbox: UITextField! 
    @IBOutlet weak var SetsPerMatchTextbox: UITextField!
    @IBOutlet weak var MaxPointsTextbox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "PreMatchToLiveMatch") {
            let HTNameInput: String = (HomeTeamTextbox.text!.isEmpty ? "Home Team" : HomeTeamTextbox.text!)
            let ATNameInput: String = (AwayTeamTextbox.text!.isEmpty ? "Away Team" : AwayTeamTextbox.text!)
            let MaxPtsInput: Int = (MaxPointsTextbox.text!.isEmpty ? 25 : Int(MaxPointsTextbox.text!)!)
            let MaxSetInput: Int = (SetsPerMatchTextbox.text!.isEmpty ? 5 : Int(SetsPerMatchTextbox.text!)!)
            let newMatch = Match(homeTeamName: HTNameInput, awayTeamName: ATNameInput, aMaxPts: MaxPtsInput, aMaxSets: MaxSetInput)
            let destination: LiveMatchController = segue.destination as! LiveMatchController
            destination.currentMatch = newMatch
        }
    }
}

