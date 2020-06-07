import Foundation

struct Engine {
    
    var matrix = [Int: Bool]()
    var oScore: Int = 0
    var xScore: Int = 0
    
    mutating func checkSelectedField(mark: Int, turn: Bool) -> Bool {
        if matrix[mark] == nil {
            matrix[mark] = turn
            return true
        } else {
            return false
        }
    }
    
    mutating func clearMatrix() {
        matrix.removeAll()
    }
    
    func checkForWinConditions() -> Bool?{
        var whoWin: Bool? = nil
        if matrix[0] == true && matrix[1] == true && matrix[2] == true {
            whoWin = true
        } else if matrix[0] == false && matrix[1] == false && matrix[2] == false {
            whoWin = false
        } else if matrix[0] == true && matrix[3] == true && matrix[6] == true {
            whoWin = true
        } else if matrix[0] == false && matrix[3] == false && matrix[6] == false {
            whoWin = false
        } else if matrix[0] == true && matrix[4] == true && matrix[8] == true {
            whoWin = true
        } else if matrix[0] == false && matrix[4] == false && matrix[8] == false {
            whoWin = false
        } else if matrix[1] == true && matrix[4] == true && matrix[7] == true {
            whoWin = true
        } else if matrix[1] == false && matrix[4] == false && matrix[7] == false {
            whoWin = false
        } else if matrix[2] == true && matrix[5] == true && matrix[8] == true {
            whoWin = true
        } else if matrix[2] == false && matrix[5] == false && matrix[8] == false {
            whoWin = false
        } else if matrix[2] == true && matrix[4] == true && matrix[6] == true {
            whoWin = true
        } else if matrix[2] == false && matrix[4] == false && matrix[6] == false {
            whoWin = false
        } else if matrix[3] == true && matrix[4] == true && matrix[5] == true {
            whoWin = true
        } else if matrix[3] == false && matrix[4] == false && matrix[5] == false {
            whoWin = false
        } else if matrix[6] == true && matrix[7] == true && matrix[8] == true {
            whoWin = true
        } else if matrix[6] == false && matrix[7] == false && matrix[8] == false {
            whoWin = false
        }
        return whoWin
    }
    
    func checkIfTableFull() -> Bool {
        if matrix.count == 9 {
            return true
        }
    return false
    }
}
