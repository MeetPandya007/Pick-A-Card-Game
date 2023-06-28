//
//  GameViewController.swift
//  CardGame
//
//  Created on 26/06/23.
//

import UIKit

class GameViewController: UIViewController {
    
    let cardArr = ["2♠", "3♠", "4♠", "5♠", "6♠", "7♠", "8♠", "9♠", "10♠", "A♠", "J♠", "K♠", "Q♠", "2♦", "3♦", "4♦", "5♦", "6♦", "7♦", "8♦", "9♦", "10♦", "A♦", "J♦", "K♦", "Q♦", "2♣", "3♣", "4♣", "5♣", "6♣", "7♣", "8♣", "9♣", "10♣", "A♣", "J♣", "K♣", "Q♣", "2♥", "3♥", "4♥", "5♥", "6♥", "7♥", "8♥", "9♥", "10♥", "A♥", "J♥", "K♥", "Q♥"]
    private var tempArrForPlayingCard : [Int] = []
    private var arrOfTopCards : [Int] = []
    private var totalCard = 10
    private var score = 0
    
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet var topCardImages : [UIImageView]!
    @IBOutlet var playingCardImages : [UIImageView]!
    
    @IBOutlet weak var lblScore: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshView()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickPickACard(_ sender: Any) {
        if totalCard > 0{
            totalCard -= 1
            lblCount.text = "\(totalCard)"
            var i = Int.random(in: 0...51)
            while tempArrForPlayingCard.contains(i){
                i = Int.random(in: 0...51)
            }
            tempArrForPlayingCard.append(i)
            checkScore()
            UIView.transition(with: self.playingCardImages.first!,
                              duration: 0.6,
                              options: .transitionCrossDissolve,
                              animations: {
                self.playingCardImages.first?.image = UIImage(named: self.cardArr[i])
            }, completion: nil)
            
            if totalCard == 0{
                UIView.transition(with: self.playingCardImages.last!,
                                  duration: 0.6,
                                  options: .transitionCrossDissolve,
                                  animations: {
                    self.playingCardImages.last?.image = nil
                    self.lblCount.isHidden = true
                }, completion: nil)
            }
        }
    }
    
    @IBAction func onClickSubmit(_ sender: Any) {
        if totalCard == 0{
            Util.shared.setScore(score: String(score))
            let alert = UIAlertController(title: "Success", message: "Your score has been successfully stored. Plase visit score screen to check the history.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            let alert = UIAlertController(title: "Alert", message: "Please pick all the card to submit the score.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
        
    }
    @IBAction func onClickReplay(_ sender: Any) {
        refreshView()
    }
    
    private func refreshView(){
        tempArrForPlayingCard = []
        arrOfTopCards = []
        lblCount.isHidden = false
        lblCount.text = "10"
        totalCard = 10
        score = 0
        
        //reset lbl
        lblScore.text = "Your score is \(score)."
        
        playingCardImages.first?.image = nil
        playingCardImages.last?.image = UIImage(named: "backofcard")
        // set random images

        for imageview in topCardImages{
            var i = Int.random(in: 0...51)
            while arrOfTopCards.contains(i){
                i = Int.random(in: 0...51)
            }
            arrOfTopCards.append(i)
            imageview.image = UIImage(named: cardArr[i])
        }
    }
    
    private func checkScore(){
        if tempArrForPlayingCard.count > 0{
            let cardName = cardArr[tempArrForPlayingCard.last!]
            var isScoreIncreased = false
            for index in arrOfTopCards{
                if cardArr[index] == cardName{
                    score += 20
                    isScoreIncreased = true
                    break
                }
            }
            if !isScoreIncreased{
                for index in arrOfTopCards{
                    if cardArr[index].contains(cardName.first!){
                        score += 10
                        print("10 increased")
                        break
                    }
                }
            }
        }
        lblScore.text = "Your score is \(score)."
    }
}
