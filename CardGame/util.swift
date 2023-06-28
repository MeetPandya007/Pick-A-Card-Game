//
//  util.swift
//  CardGame
//
//  Created by appmatictech on 27/06/23.
//

import Foundation
struct Util {
  static let shared = Util()
    private let ud = UserDefaults.standard
  

  private init() {  }
    
    func getTimeStamp() -> String{
        let d = Date()
        let df = DateFormatter()
        df.dateFormat = "yy-MM-dd H:mm:ss"
        return df.string(from: d)
    }
    
    func setScore(score: String){
        var scoreHistory = getScore()
        
        var dict : [String:Any] = [:]
        dict["time"] = getTimeStamp()
        dict["score"] = score
        
        scoreHistory.append(dict)
        ud.set(scoreHistory, forKey: "scoreHistory")
    }
    func getScore() -> [[String:Any]]{
        return ud.value(forKey: "scoreHistory") as? [[String:Any]] ?? []
    }
}
