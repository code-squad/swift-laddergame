import Foundation

struct ResultView {
    
 
    
    enum LadderElements: String {
        case line = "-----"
        case whiteSpace = "     "
    }
    
    func transferBooltoLadder(existLadder: Bool) -> String {
        return existLadder ? LadderElements.line.rawValue : LadderElements.whiteSpace.rawValue
    }
    
    func printLadder(_ allLadderElement:[[Bool]]) {
        for LadderElement in allLadderElement {
            for createLadder in LadderElement {
                let ladder = transferBooltoLadder(existLadder: createLadder)
                print("|\(ladder)", terminator: "")
            }
            print("|")
        }
    }
    
    func printNames(_ playerName:[LadderPlayer]) {
        for name in 0 ..< playerName.count {
            print(playerName[name].name, terminator: " ")
        }
    }
}
