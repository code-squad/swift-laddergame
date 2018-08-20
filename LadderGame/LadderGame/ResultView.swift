import Foundation

struct ResultView {
    
    private(set) var ladderStep: [LadderStep]
    
    init(input: [[Bool]] ) {
        var allLadderElements = [LadderStep]()
        for ladderElements in input {
            let ladderElements = LadderStep(ladderStep: [ladderElements])
            allLadderElements.append(ladderElements)
        }
        self.ladderStep = allLadderElements
        }
    
    enum LadderElements: String {
        case line = "-----"
        case whiteSpace = "     "
    }
    
    func transferBooltoLadder(existLadder: Bool) -> String {
        return existLadder ? LadderElements.line.rawValue : LadderElements.whiteSpace.rawValue
    }
    
   
    func printLadder() {
        var allLadderElements:[[Bool]] = [[]]
        var ladderStepElement:[LadderStep] = self.ladderStep
        for ladderElement in 0 ..< ladderStepElement.count {
            allLadderElements += ladderStepElement[ladderElement].ladderStep
        }

        for createLadderElement in allLadderElements {
            for createLadder in createLadderElement {
                let ladder = transferBooltoLadder(existLadder: createLadder)
                print("|\(ladder)", terminator: "")
            }
            print("|")
        }
    }
  
    func printNames(_ playerName:[LadderPlayer]) {
        
        for name in 0 ..< playerName.count {
            print(playerName[name].name, terminator: "  ")
        }
    }
}

