//
//  matchCollectionViewController.swift
//  VolleyballScoreKeeper
//
//  Created by Xuanson On on 9/08/2016.
//  Copyright © 2016 Xuanson On. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class matchCollectionViewController: UICollectionViewController {
    
    var matches = [Match]()
    
    func loadSampleMatches() {
        let match1 = Match(homeTeamName: "CGS", awayTeamName: "FIN", numSets: 3, numPoints: 25)
        let match2 = Match(homeTeamName: "FIN", awayTeamName: "TOO", numSets: 3, numPoints: 25)
        let match3 = Match(homeTeamName: "IVA", awayTeamName: "CGS", numSets: 3, numPoints: 25)
        let match4 = Match(homeTeamName: "MLC", awayTeamName: "STR", numSets: 3, numPoints: 25)
        let match5 = Match(homeTeamName: "IVA", awayTeamName: "MLC", numSets: 3, numPoints: 25)
        let match6 = Match(homeTeamName: "FIN", awayTeamName: "STR", numSets: 3, numPoints: 25)
        let match7 = Match(homeTeamName: "CGS", awayTeamName: "FIN", numSets: 3, numPoints: 25)
        let match8 = Match(homeTeamName: "FIN", awayTeamName: "TOO", numSets: 3, numPoints: 25)
        let match9 = Match(homeTeamName: "IVA", awayTeamName: "CGS", numSets: 3, numPoints: 25)
        let match10 = Match(homeTeamName: "MLC", awayTeamName: "STR", numSets: 3, numPoints: 25)
        let match11 = Match(homeTeamName: "IVA", awayTeamName: "MLC", numSets: 3, numPoints: 25)
        let match12 = Match(homeTeamName: "FIN", awayTeamName: "STR", numSets: 3, numPoints: 25)
        
        matches += [match1, match2, match3, match4, match5, match6, match7, match8, match9, match10, match11, match12]
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleMatches()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return matches.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdent = "matchCollectionCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdent, for: indexPath)
        let match = matches[(indexPath as NSIndexPath).row]
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
