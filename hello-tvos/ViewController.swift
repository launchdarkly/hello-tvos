//
//  ViewController.swift
//  hello-tvos
//
//  Created by Danial Zahid on 4/9/17.
//  Copyright © 2017 LaunchDarkly. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ClientDelegate {

    let mobileKey = ""
    let flagKey = "test-flag"

    @IBOutlet weak var valueLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        LDClient.sharedInstance().delegate = self
        setupLDClient()
        checkFeatureValue()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupLDClient() {
        let builder = LDUserBuilder()
        builder.key = "bob@example.com"
        builder.firstName = "Bob"
        builder.lastName = "Loblaw"
        
        let groups = ["beta_testers"]
        builder.customArray("groups", value: groups)
        
        let config = LDConfig.init(mobileKey: mobileKey)

        LDClient.sharedInstance().start(config, with: builder)
    }
    
    func checkFeatureValue() {
        let showFeature = LDClient.sharedInstance().boolVariation(flagKey, fallback: false)
        updateLabel(value: "\(showFeature)")
    }
    
    func updateLabel(value: String){
        valueLabel.text = "Flag value: \(value)"
    }

    //MARK: - ClientDelegate Methods
    
    func featureFlagDidUpdate(_ key: String) {
        if key == flagKey {
            checkFeatureValue()
        }
    }
    
}

