struct LadderView {
    
    let ladder: Ladder
    let stringizedInfo: String
    
    init(ladder: Ladder) {

        self.ladder = ladder
        
        
        
        stringizedInfo = stringized()
    }
    
    func printLadder() {
        print(stringizedInfo)
    }
    
    
    
    
    private func nameChangedToFiveLetters() -> [String] {
        var alignedNames: [String] = []
        let space = " "
        for participant in ladder.participants {
            let numberOfSpacesToAdd = 5 - participant.count
            let spacesAtBeginning = String(repeating: space, count: numberOfSpacesToAdd / 2)
            let spacesAtEnd = String(repeating: space, count:  numberOfSpacesToAdd - spacesAtBeginning.count)
            alignedNames.append("\(spacesAtBeginning)\(participant)\(spacesAtEnd)")
        }
        return alignedNames
    }
    
    
    
    
    
    private func stringized() -> String {
        
        var stringizedInfo = ""
        let participants = nameChangedToFiveLetters()
        for row in ladder.info {
            stringizedInfo.append("\(row.stringized())\n")
        }
        
        stringizedInfo.append("   ") // 사다리와 위치를 맞추기 위한 공백입니다.
        for participant in participants {
            stringizedInfo.append("\(participant) ")
        }
        return stringizedInfo
    }
    
    
    
    
}
