import Foundation

struct LadderGame {
    
    func createLadder(_ playerNames: Array<String>, _ maxLadderNumber: Int) {
        var maxLadderNumber = maxLadderNumber
        let playerNumberCount = playerNames.count
        while 0 < maxLadderNumber {
            createLadderLine(playerNumberCount)
            print("ㅣ")
            maxLadderNumber -= 1
        }
        createNames(playerNames)
    }
    
    func createLadderLine(_ playerNumberCount: Int) -> (String, terminator: String)?{
        for _ in 0..<playerNumberCount-1 {
            createOneLadderLine()
        return createOneLadderLine()
        }
        return nil
    }
    
    func createOneLadderLine () -> (String, terminator: String){
        let ladderStep = LadderStep()
        let oneLadderStep = ("ㅣ", terminator: ladderStep.createLadderFoothold())
        return oneLadderStep
    }
    
    func createNames(_ playerNames: Array<String>) -> Array<String> {
        let playerNames = playerNames.joined(separator: ",")
        let printingPlayerNames = (playerNames.replacingOccurrences(of: ",", with: " "))
        return [printingPlayerNames]
    }
}
