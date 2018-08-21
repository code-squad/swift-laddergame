import Foundation

struct ResultView {
 
    func printLadder(_ allLadderElements: [[Bool]]) {
        
        func transferBooltoLadder(existLadder: Bool) -> String {
            return existLadder ? LadderStep.LadderElements.line.rawValue : LadderStep.LadderElements.whiteSpace.rawValue
        }

        for createLadderElement in allLadderElements {
            for createLadder in createLadderElement {
                let ladder = transferBooltoLadder(existLadder: createLadder)
                print("\(LadderStep.LadderElements.pole.rawValue)\(ladder)", terminator: "")
            }
            print("\(LadderStep.LadderElements.pole.rawValue)")
        }
    }
  
    func printNames(_ playerName:[LadderPlayer]) {
        
        for name in 0 ..< playerName.count {
            print(playerName[name].name, terminator: " ")
        }
    }
}

