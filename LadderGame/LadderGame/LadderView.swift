struct LadderView {
    
    //MARK: 프로퍼티
    private let ladder: Ladder
    private let stringizedInfo: String
    
    //MARK: 이니셜라이저
    init(ladder: Ladder) {
        self.ladder = ladder
        
        /// 이름을 5글자에 맞게 가운데 정렬합니다.
        func nameChangedToFiveLetters() -> [String] {
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
        
        /// 사다리를 문자열로 변환합니다.
        func stringized() -> String {
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
        
        stringizedInfo = stringized()
    }
    
    func printLadder() {
        print(stringizedInfo)
    }
    
}
