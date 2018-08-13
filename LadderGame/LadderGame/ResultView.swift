import Foundation

struct ResultView {
    
    enum LadderElements: String {
        case line = "-----"
        case whiteSpace = "     "
    }
    
    func transferBooltoLadder(existLadder: Bool) -> String {
        return existLadder ? LadderElements.line.rawValue : LadderElements.whiteSpace.rawValue
    }
    
    func printLadder(_  allLadderElement:Array<Array<Bool>>, _ maxLadderHeight:Int, _ players:[String]) {
        let playerNumber = players.count
        let playerNames = players.joined(separator: ",")
        let printPlayerNames = (playerNames.replacingOccurrences(of: ",", with: " "))
        
        for height in 0 ..< maxLadderHeight {
            for line in 0 ..< playerNumber-1 {
                let ladder = transferBooltoLadder(existLadder: allLadderElement[height][line])
                print("|\(ladder)", terminator: "")
            }
            print("|")
        }
        print(printPlayerNames)
    }
}
