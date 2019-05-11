import Foundation

struct ladderBoard {
    init (_ player:Int, _ ladderHeight:Int){
        self.playerNumber = player
        self.ladderHeight = ladderHeight
    }
    
    private let playerNumber:Int
    private let ladderHeight:Int
    
    private(set) lazy var widthLadderIsExistence:[[Bool]] =  Array(repeating:Array(repeating: false, count:playerNumber-1), count:ladderHeight)
    
    mutating func markLadder() {
        for x in 0..<ladderHeight {
            widthLadderIsExistence[x][0] = Bool.random()
            for y in 1..<playerNumber-1{
                mark(x, y)
            }
        }
    }
    
    func playerNumberCheck()throws {
        guard playerNumber < 200 else{
            throw LadderDrawError.playerNumberOverRange
        }
    }
    
    func ladderHeightCheck()throws {
        guard ladderHeight < 200 else{
            throw LadderDrawError.ladderHeightOverRange
        }
    }
    
    private mutating func mark(_ x:Int,_ y:Int) {
        if isContinue(x, y) == false{
            widthLadderIsExistence[x][y] = Bool.random()
        }
    }
    
    private mutating func isContinue(_ x:Int,_ y:Int) -> Bool {
        guard isEmpty(x,y-1) == false else {
            return false
        }
        return true
    }
    
    private mutating func isEmpty(_ x:Int,_ y:Int) -> Bool {
        guard widthLadderIsExistence[x][y] == false else {
            return false
        }
        return true
    }
}



