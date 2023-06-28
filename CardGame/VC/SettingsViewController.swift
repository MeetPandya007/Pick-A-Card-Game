//
//  SettingsViewController.swift
//  CardGame
//
//  Created on 26/06/23.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var easySwitch: UISwitch!
    @IBOutlet weak var hardSwitch: UISwitch!
    @IBOutlet weak var mediumSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        easySwitch.setOn(true, animated: true)
        mediumSwitch.setOn(false, animated: true)
        hardSwitch.setOn(false, animated: true)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickMediumSwitch(_ sender: UISwitch) {
        if sender.isOn{
            easySwitch.setOn(false, animated: true)
            hardSwitch.setOn(false, animated: true)
        }
    }
    @IBAction func onClickEasySwitch(_ sender: UISwitch) {
        if sender.isOn{
            mediumSwitch.setOn(false, animated: true)
            hardSwitch.setOn(false, animated: true)
        }
    }
    
    @IBAction func onClickHardSwitch(_ sender: UISwitch) {
        if sender.isOn{
            mediumSwitch.setOn(false, animated: true)
            easySwitch.setOn(false, animated: true)
        }
    }
}
