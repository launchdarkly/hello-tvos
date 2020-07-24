//
//  ViewController.swift
//  hello-tvos
//
//  Copyright © 2017 LaunchDarkly. All rights reserved.
//

import UIKit
import LaunchDarkly_tvOS

class ViewController: UIViewController {

    let flagKey = "test-flag"

    @IBOutlet weak var valueLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        registerLDClientObservers()
        checkFeatureValue()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerLDClientObservers() {
        LDClient.get()?.observe(key: flagKey, owner: self) { [weak self] changedFlag in
            self?.featureFlagDidUpdate(changedFlag.key)
        }
    }
    
    func checkFeatureValue() {
        let showFeature = LDClient.get()!.variation(forKey: flagKey, defaultValue: false)
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

