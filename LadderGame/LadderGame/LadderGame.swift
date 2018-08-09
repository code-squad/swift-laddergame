import Foundation

struct LadderGame {
    
    func createLadder(_ playersName: Array<String>, _ maxLadderNumber: Int) -> String {
        let playerNumber = playersName.count
        var maxLadderNumber = maxLadderNumber
        var ladder:String = ""
        let ladderLine = createLadderLine(playerNumber)
        while 0 < maxLadderNumber {
            ladder.append("\(ladderLine)\n")
            maxLadderNumber -= 1
        }
        return ladder
    }
    
    func createLadderLine(_ playerNumberCount: Int) -> String {
        var oneLadderLine = " "
        for _ in 0..<playerNumberCount-1 {
            oneLadderLine.append(createOneLadderLine())
        }
        return "\(oneLadderLine)|"
    }
    
    func createOneLadderLine () -> String {
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
