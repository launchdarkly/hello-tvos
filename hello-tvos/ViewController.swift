//
//  ViewController.swift
//  hello-tvos
//
//  Created by Danial Zahid on 4/9/17.
//  Copyright © 2017 LaunchDarkly. All rights reserved.
//

import UIKit
import LaunchDarkly_tvOS

class ViewController: UIViewController {

    let mobileKey = ""
    let flagKey = "test-flag"

    @IBOutlet weak var valueLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupLDClient()
        checkFeatureValue()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupLDClient() {
        var user = LDUser(key: "bob@example.com")
        user.firstName = "Bob"
        user.lastName = "Loblaw"
        user.custom = ["groups":["beta_testers"]]

        let config = LDConfig(mobileKey: mobileKey)

        LDClient.shared.observe(key: flagKey, owner: self) { [weak self] (changedFlag) in
            self?.featureFlagDidUpdate(changedFlag.key)
        }
        LDClient.shared.start(config: config, user: user)
    }
    
    func checkFeatureValue() {
        let showFeature = LDClient.shared.variation(forKey: flagKey, fallback: false)
        updateLabel(value: "\(showFeature)")
    }
    
    func updateLabel(value: String){
        valueLabel.text = "Flag value: \(value)"
    }

    //MARK: - ClientDelegate Methods
    
    func featureFlagDidUpdate(_ key: String!) {
        if key == flagKey {
            checkFeatureValue()
        }
    }
    
}

