//
//  ScoreViewController.swift
//  CardGame
//
//  Created on 26/06/23.
//

import UIKit

class ScoreViewController : UIViewController{
    
    @IBOutlet weak var tableview: UITableView!
    private let scoreData = Util.shared.getScore()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

extension ScoreViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        scoreData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreViewCellTableViewCell") as? ScoreViewCellTableViewCell {
            let score = scoreData[indexPath.row]["score"] as? String ?? ""
            let time = scoreData[indexPath.row]["time"] as? String ?? ""
            cell.lblText.text = "Your score was (\(score)) at \(time)."
                return cell
            }
            
            return UITableViewCell()
    }
}
