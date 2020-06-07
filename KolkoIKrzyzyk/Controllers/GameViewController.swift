//
//  GameViewController.swift
//  KolkoIKrzyzyk
//
//  Created by Robert on 07/06/2020.
//  Copyright © 2020 Robert. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var selectedField: [UIButton]!
    @IBOutlet weak var whosTurn: UIImageView!
    @IBOutlet weak var oScore: UILabel!
    @IBOutlet weak var xScore: UILabel!
    
    private var whoWillStart = Bool.random()  //TRUE = Circle FALSE = X
    var engine = Engine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearAndSetData()
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    func clearAndSetData() {
        for item in selectedField {
            item.setTitle(nil, for: .normal)
        }
        oScore.text = "O: \(engine.oScore)"
        xScore.text = "X: \(engine.xScore)"
        changeTurnImage()
    }
    
    @IBAction func selectedFieldPressed(_ sender: UIButton) {
        let status = engine.checkSelectedField(mark: sender.tag, turn: whoWillStart)
        if status {
            whoWillStart = !whoWillStart
        }
        reloadTableData() //set X or O and reload view
        changeTurnImage() //reload current user turn move
        let winner = engine.checkForWinConditions()
        if winner != nil {
            setWinner(winner: winner!)
        } else {
            let draw = engine.checkIfTableFull()
            if draw {
                setWinner()
            }
        }
    }
    
    func changeTurnImage() {
        if whoWillStart {
            whosTurn.image = UIImage(systemName: "circle")
        } else {
            whosTurn.image = UIImage(systemName: "xmark")
        }
    }
    
    func reloadTableData(endRound: Bool? = nil) {
        if endRound == nil {
            let myMatrix = engine.matrix
            for item in myMatrix {
                for marks in selectedField {
                    if item.key == marks.tag {
                        var title = String()
                        if item.value {
                            title = "circle"
                        } else {
                            title = "xmark"
                        }
                        marks.setImage(UIImage(systemName: title), for: .normal)
                        marks.contentHorizontalAlignment = .fill
                        marks.contentVerticalAlignment = .fill
                    }
                }
            }
        } else {
            for marks in selectedField {
                marks.setImage(nil, for: .normal)
            }
        }
    }
    
    func setWinner(winner: Bool? = nil) {
        var winnerString = String()
        var message = String()
        var title = String()
        
        if winner != nil {
            title = "GRATULACJE!"
            if winner! {
                winnerString = "Kółka"
                engine.oScore += 1
            } else {
                winnerString = "Krzyżyki"
                engine.xScore += 1
            }
            message = "Wygrały: \(winnerString)"
        } else {
            title = "REMIS!"
            message = "Nikt nie wygrał"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Następna runda", style: .default, handler: { (UIAlertAction) in
            self.clearAndSetData()
            self.engine.clearMatrix()
            self.reloadTableData(endRound: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
