import Foundation

struct resultPrint {
    
    mutating func playPrint(_ names:[LadderPlayer],_ playerNumber:Int, _ ladderHeight:Int, _ widthLadderIsExistence:[[Bool]]){
        printPlayerNameBoard(playerNumber,names)
        ladderBoardPrint(playerNumber,ladderHeight,widthLadderIsExistence)
        
    }
    
    private mutating func printPlayerNameBoard(_ playerNumber:Int,_ names:[LadderPlayer]){
        var printEmptySTD = 2
        addEmpty(printEmptySTD)
        for i in 0..<names.count {
            printEmptySTD = 6 - names[i].name.count
            addEmpty(printEmptySTD - (printEmptySTD/2))
            addName(names,i)
            addEmpty(printEmptySTD/2)
        }
        print("")
    }
    
    private mutating func addEmpty(_ numberOfEmpty:Int) {
        for _ in 0..<numberOfEmpty {
            print(" ",terminator:"")
        }
        
    }
    
    private mutating func addName(_ names:[LadderPlayer],_ i:Int) {
        print(names[i].name,terminator:"")
    }
    
    private func ladderBoardPrint(_ playerNumber:Int, _ ladderHeight:Int, _ widthLadderIsExistence:[[Bool]]) {
        for i in 0..<ladderHeight {
            print(Ladder.emptyStep.rawValue, terminator: "")
            printWidthLadder(i,playerNumber,widthLadderIsExistence)
            print(Ladder.bar.rawValue)
        }
    }
    
    private func printWidthLadder(_ i:Int, _ playerNumber:Int, _ widthLadderIsExistence:[[Bool]]) {
        for j in 0..<playerNumber-1 {
            print(Ladder.bar.rawValue, terminator: "")
            if widthLadderIsExistence[i][j] == true {
                print(Ladder.existStep.rawValue, terminator: "")
                continue
            }
            print(Ladder.emptyStep.rawValue, terminator: "")
        }
    }
}

