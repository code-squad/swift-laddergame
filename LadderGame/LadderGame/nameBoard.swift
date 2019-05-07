import Foundation

struct NameBoard {
    private var nameBoard  = Array<String>()
    
    mutating func drawPlayerNameBoard(_ playerNumber:Int,_ names:[LadderPlayer])->[String] {
        var previous = 0
        var numberOfEmpty = 0
        
        for i in 0..<names.count {
            numberOfEmpty = 5 - (names[i].name.count / 2)-(previous)
            addEmpty(numberOfEmpty)
            addName(names,i)
            previous = names[i].name.count / 2
        }
        return nameBoard
    }
    
    private mutating func addEmpty(_ numberOfEmpty:Int) {
        for _ in 1...numberOfEmpty {
            nameBoard.append(" ")
        }
    }
    
    private mutating func addName(_ names:[LadderPlayer],_ i:Int) {
        nameBoard.append(names[i].name)
    }
}
