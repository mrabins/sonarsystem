//
//  ViewController.swift
//  Sonar
//
//  Created by Mark Rabins on 4/23/16.
//  Copyright © 2016 self.edu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var depthSounder: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var rangeValueLabel: UILabel!
    @IBOutlet weak var increaseSonarRangeButton: UIButton!
    @IBOutlet weak var sonarDistanceLabel: UILabel!
    @IBOutlet weak var multipliedValueLabel: UILabel!
    @IBOutlet weak var sonarIsActiveLabel: UILabel!
    @IBOutlet weak var pingButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var currentRange = 1
    var multipliedValue = 5
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor(red: 0/255, green: 102/255, blue: 204/255, alpha: 1.0)

        
        depthSounder.text = "Depth Sounder"
        depthSounder.backgroundColor = UIColor(red: 135/255, green: 206/255, blue: 235/255, alpha: 1.0)
        depthSounder.textColor = UIColor.whiteColor()
        depthSounder.textAlignment = NSTextAlignment.Center
        
        rangeLabel.text = "Range:"
        rangeLabel.textColor = UIColor.whiteColor()
        
        rangeValueLabel.text = currentRange.description
        rangeValueLabel.textColor = UIColor.whiteColor()
        
        increaseSonarRangeButton.setTitle("Increase Sonar Range", forState: UIControlState.Normal)
        increaseSonarRangeButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        increaseSonarRangeButton.backgroundColor = UIColor(red: 135/255, green: 206/255, blue: 235/255, alpha: 1.0)
        
        sonarDistanceLabel.text = "Sonar Distance:"
        sonarDistanceLabel.textColor = UIColor.whiteColor()
        
        multipliedValueLabel.text = "\(currentRange * multipliedValue)"
        multipliedValueLabel.textColor = UIColor.whiteColor()
        
        sonarIsActiveLabel.text = "Sonar is Active"
        sonarIsActiveLabel.textColor = UIColor.whiteColor()
        
        pingButton.setTitle("Ping", forState: UIControlState.Normal)
        pingButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        pingButton.backgroundColor = UIColor.redColor()
        
        sonarIsActiveLabel.hidden = true
        imageView.hidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func increaseSonarRangeButtonPressed(sender: UIButton) {
        
        sonarIsActiveLabel.hidden = false
        
        if (currentRange < 5) && currentRange > 0{
            currentRange += 1
            
        } else {
            currentRange = 5
        }
        
        rangeValueLabel.text = "\(currentRange)"
        let sonarDistance = currentRange * multipliedValue
        multipliedValueLabel.text = "\(sonarDistance)"
        
        
    }
    
    @IBAction func pingButtonPressed(sender: UIButton) {
        
        sonarIsActiveLabel.hidden = false
        
        for times in 1...currentRange {
            sonarIsActiveLabel.text = "Sonar Fired \(times)"
            print("Firing Sonar \(times) \n")
            
        }
        let sonarDistance = currentRange * multipliedValue
        
        if sonarDistance > 15 {
            imageView.hidden = false
            imageView.image = UIImage(named: "kingTut")
            
        } else if sonarDistance >= 10 {
            imageView.hidden = false
            imageView.image = UIImage(named: "helmet")
            
        }
        
        
        
        
    }
    
    

}

