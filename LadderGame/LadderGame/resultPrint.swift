import Foundation

struct resultPrint {
    
    mutating func playPrint(_ ladders:[[String]],_ nameBoard:[String]){
        nameBoardPrint(nameBoard)
        ladderBoardPrint(ladders)
        
    }
    
    private func nameBoardPrint(_ nameBoard:[String]) {
        print(nameBoard.joined())
    }
    
    private func ladderBoardPrint(_ ladders:[[String]]) {
        for i in ladders{
            print(i.joined())
        }
    }
}

