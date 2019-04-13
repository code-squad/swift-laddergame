struct LadderView {
    
    //MARK: 프로퍼티
    
    
    //MARK: 이니셜라이저
    
    
    
    /// 사다리를 문자열로 변환합니다.
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

