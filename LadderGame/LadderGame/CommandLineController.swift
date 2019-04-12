struct CommandLineController {
    
    func askUserAndReadNumber(question: String) throws -> Int {
        print(question)
        guard let numberEnterd = Int(readLine()!) else {
            throw InputError.invalidInput
        }
        return numberEnterd
    }
    
    
    func readLadderInfo() throws -> (numberOfParticipants: Int, height: Int) {
        let numberOfParticipants = try askUserAndReadNumber(question: "참여할 사람은 몇 명 인가요?")
        guard numberOfParticipants > 1 else {
            throw InputError.invalidNumberOfParticipants
        }
        let height = try askUserAndReadNumber(question: "사다리 높이는 몇 개인가요?")
        guard height > 0 else {
            throw InputError.invalidLadderHeight
        }
        return (numberOfParticipants, height)
    }
    
    
    /// 한 열을 사다리를 표현하는 문자열로 변환합니다.
    private func stringize(row: [Ladder.Component]) -> String {
        let stringizedInfo = row.map { String(repeating: $0.rawValue, count: 5) }
        return stringizedInfo.joined(separator: "|")
    }
    
    
    /// 사다리 배열을 커맨드 라인 뷰에 출력합니다.
    func stringize(ladder: [[Ladder.Component]]) {
        var stringizedLadder = ""
        for row in ladder {
            stringizedLadder.append("\(stringize(row: row))\n")
        }
        print(stringizedLadder)
    }
    
    
    
    
    
    
    
    
}
