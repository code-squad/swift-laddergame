import Foundation

extension Array where Element == Ladder.Component {
    
    /// 사다리 열을 문자열로 변환합니다.
    func stringized(maxNameLength: Int) -> String {
        let stringizedInfo = self.map { String(repeating: $0.rawValue, count: maxNameLength) }
        return stringizedInfo.joined(separator: "|")
    }
    
}

extension Array where Element == [Ladder.Component] {
    
    /// 사다리를 문자열로 변환합니다.
    func stringized(maxNameLength: Int) -> String {
        let stringizedRows: [String] = self.map { $0.stringized(maxNameLength: maxNameLength) }
        return stringizedRows.joined(separator: "\n")
    }
    
}

extension String {
    
    /// length 만큼 글자수를 늘리고 가운데 정렬합니다.
    func alignedToCenter(length: Int) -> String {
        
        let space = " "
        let numberOfSpacesToAdd = length - self.count
        let leadingSpaces = String(repeating: space, count: numberOfSpacesToAdd / 2)
        let trailingSpaces = String(repeating: space, count:  numberOfSpacesToAdd - leadingSpaces.count)
        return "\(leadingSpaces)\(self)\(trailingSpaces)"
    }
    
}

struct LadderGameView {
    
    //MARK: 비공개 속성
    private let stringizedLadder: String
    private let stringizedPlayers: String
    private let stringizedResults: String
    private let space = " "
    private let maxNameLength: Int
    
    //MARK: 이니셜라이저
    init(ladderGame: LadderGame, maxNameLength: Int) {
        self.maxNameLength = maxNameLength
        stringizedLadder = ladderGame.info().stringized(maxNameLength: maxNameLength)
        let players = ladderGame.gamePlayers().map { $0.name.alignedToCenter(length: maxNameLength) }
        let results = ladderGame.results().map { $0.name.alignedToCenter(length: maxNameLength) }
        stringizedPlayers = players.joined(separator: space)
        stringizedResults = results.joined(separator: space)
    }
    
    //MARK: 메소드
    func printLadderGame() {
        let leadingSpaces = String(repeating: space, count: maxNameLength / 2 + 1)
        print(
            """
            \(leadingSpaces)\(stringizedPlayers)
            \(stringizedLadder)
            \(leadingSpaces)\(stringizedResults)
            """
        )
    }
    
}

