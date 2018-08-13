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
        let playerNames = players.joined(separator: ",")
        let printPlayerNames = (playerNames.replacingOccurrences(of: ",", with: " "))
        
        for LadderElement in allLadderElement {
            for createLadder in LadderElement {
                let ladder = transferBooltoLadder(existLadder: createLadder)
                print("|\(ladder)", terminator: "")
            }
            print("|")
        }
        print(printPlayerNames)
    }
}
