//
//  gameDetailView.swift
//  VolleyballScoreKeeper
//
//  Created by Xuanson On on 7/07/2016.
//  Copyright © 2016 Xuanson On. All rights reserved.
//

import Foundation
import UIKit

class GameDetailView: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var homeNameTextField: UITextField!
    @IBOutlet weak var awayNameTextField: UITextField!
    
    @IBOutlet weak var setTextField: UITextField!
    @IBOutlet weak var pointsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        homeNameTextField.delegate = self
        awayNameTextField.delegate = self
        setTextField.delegate = self
        pointsTextField.delegate = self
        
        self.homeNameTextField.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor
        self.homeNameTextField.layer.borderWidth = CGFloat(Float(1.0))
        self.homeNameTextField.layer.cornerRadius = CGFloat(Float(5.0))
        //Textbox Placeholder
        self.homeNameTextField.attributedPlaceholder = NSAttributedString(string:"Enter a name for the home team",
                                                                          attributes:[NSForegroundColorAttributeName: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)])
        
        self.awayNameTextField.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor
        self.awayNameTextField.layer.borderWidth = CGFloat(Float(1.0))
        self.awayNameTextField.layer.cornerRadius = CGFloat(Float(5.0))
        //Textbox Placeholder
        self.awayNameTextField.attributedPlaceholder = NSAttributedString(string:"Enter a name for the away team",
                                                                          attributes:[NSForegroundColorAttributeName: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)])
    
        self.setTextField.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor
        self.setTextField.layer.borderWidth = CGFloat(Float(1.0))
        self.setTextField.layer.cornerRadius = CGFloat(Float(5.0))
        //Textbox Placeholder
        self.setTextField.attributedPlaceholder = NSAttributedString(string:"How many sets in a match",
                                                                          attributes:[NSForegroundColorAttributeName: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)])
        
        self.pointsTextField.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor
        self.pointsTextField.layer.borderWidth = CGFloat(Float(1.0))
        self.pointsTextField.layer.cornerRadius = CGFloat(Float(5.0))
        //Textbox Placeholder
        self.pointsTextField.attributedPlaceholder = NSAttributedString(string:"Number of points required to win a set",
                                                                          attributes:[NSForegroundColorAttributeName: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2)])
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //create obj here
        let match = Match(homeTeamName: homeNameTextField.text!, awayTeamName: awayNameTextField.text!, numSets: (Int)(setTextField.text!)!, numPoints: (Int)(pointsTextField.text!)!)
        
        let Destination: LiveGameView = segue.destination as! LiveGameView
        Destination.match = match
        
        
    }
    
}

