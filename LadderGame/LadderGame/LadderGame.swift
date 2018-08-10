import Foundation

struct LadderGame {
    
    func createLadder(_ playersName: Array<String>, _ maxLadderNumber: Int) -> [[String]] {
        let playerNumber = playersName.count
        let makeLadder:[[String]] = Array(repeating: Array(repeating: createLadderLine(), count: playerNumber-1), count: maxLadderNumber)
        
        return makeLadder
    }
    func createLadderLine() -> String{
        let ladderStep = LadderStep()
        let oneLadderStep = ("ㅣ", terminator: ladderStep.createLadderFoothold())
        let oneLadderStepStr:(String, String) = oneLadderStep
        let oneLadderStepToArr:[(String, String)] = [oneLadderStepStr]
        let oneLadderStepCombineArr:[String] = oneLadderStepToArr.map { $0 + $1 }
        let returnLadderStep:String = oneLadderStepCombineArr.joined(separator: ", ")
        return returnLadderStep
    }

    func createNames(_ playerNames: Array<String>) -> String {
        let playerNames = playerNames.joined(separator: ",")
        let returnPlayerNames = (playerNames.replacingOccurrences(of: ",", with: " "))
        return returnPlayerNames
    }
}
