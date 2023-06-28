//
//  ViewController.swift
//  CardGame
//
//  Created on 26/06/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        // Do any additional setup after loading the view.
    }


    @IBAction func onClickCard(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onClickScore(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ScoreViewController") as! ScoreViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func onClickSetting(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onClickRules(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RulesViewController") as! RulesViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onClickAboutUs(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AboutusViewController") as! AboutusViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

