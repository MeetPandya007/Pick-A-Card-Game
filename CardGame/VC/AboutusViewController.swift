//
//  AboutusViewController.swift
//  CardGame
//
//  Created on 26/06/23.
//

import UIKit

class AboutusViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    let arrOfRules = ["\"Pick a card\" is easy to play game.", "You just have to click on \"Play\"  button on \"Home\" screen to start the game.", "Rules are already mentioned in \"Rules\" section, which you can go from \"Home\" screen", "Players can see their score history as well along with the exact time stamp when they had any particular score.", "Player will have \"Replay\" option in game to start the game again.", "Player will have to click on \"Pick a card\" to get the random card.", "If latest card is same as the cards already opened in top, then player will get 20 points.", "If latest card is same but of different type then player will get 10 points.", "Score submission is only allowed after completing the whole game."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.dataSource = self
        self.tableview.delegate = self
        self.registerTableViewCells()
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

extension AboutusViewController: UITableViewDataSource, UITableViewDelegate {
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
