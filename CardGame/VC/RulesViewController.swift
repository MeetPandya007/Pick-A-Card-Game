//
//  RulesViewController.swift
//  CardGame
//
//  Created on 26/06/23.
//

import UIKit

class RulesViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    let arrOfRules = ["You will have to click on \"Pick a card\" to get the random card.", "If latest card is same as the cards already opened in top, then you will get 20 points.", "If latest card is same but of different type then you will get 10 points.", "Score submission is only allowed after completing the whole game."]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.dataSource = self
        self.tableview.delegate = self
        self.registerTableViewCells()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func registerTableViewCells() {
        let cell = UINib(nibName: "ScoreViewCellTableViewCell",
                                  bundle: nil)
        self.tableview.register(cell,
                                forCellReuseIdentifier: "ScoreViewCellTableViewCell")
    }
}

extension RulesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrOfRules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreViewCellTableViewCell") as? ScoreViewCellTableViewCell {
            cell.lblText.text = arrOfRules[indexPath.row]
                return cell
            }
            
            return UITableViewCell()
    }
}
