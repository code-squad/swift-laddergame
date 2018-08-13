import Foundation

struct LadderGame {
    
    func createLadderElement() -> Bool {
        let ladderStep = LadderStep()
        let boolLadderElement = ladderStep.createLadderFoothold()
        
        return boolLadderElement
    }
    
    func makeOneLadderLineElement (_ playerNumber: Int) -> Array<Bool> {
        var oneLadderLineElement = Array<Bool>()
        for _ in 0 ..< playerNumber-1 {
            oneLadderLineElement.append(createLadderElement())
        }
        return oneLadderLineElement
    }
    
    func makeAllLadderElement (_ height: Int) -> Array<Array<Bool>> {
        var AllLadderElement = Array<Array<Bool>>()
        for _ in 0 ..< height {
            AllLadderElement.append(makeOneLadderLineElement(height))
        }
        return AllLadderElement
    }
}

