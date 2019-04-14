import Foundation

extension Array where Element == LadderComponent {
    
    /// 사다리 열을 문자열로 변환합니다.
    func stringized() -> String {
        let stringizedInfo = self.map { String(repeating: $0.rawValue, count: LadderGame.maximumNameLength) }
        return stringizedInfo.joined(separator: "|")
    }
    
}

extension Array where Element == [LadderComponent] {
    
    /// 사다리를 문자열로 변환합니다.
    func stringized() -> String {
        var stringizedRows: [String] = []
        for row in self {
            stringizedRows.append(row.stringized())
        }
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
    
    //MARK: 정적 속성
    /// Player 이름의 최대 길이입니다. 변경하면 사다리의 크기도 함께 변경됩니다.
    static let maximumNameLength = 5
    
    //MARK: 이니셜라이저
    init(ladderGame: LadderGame) {
        stringizedLadder = ladderGame.ladder.stringized()
        let players = ladderGame.players.map { $0.name.alignedToCenter(length: maximumNameLength) }
        let results = ladderGame.results().map { $0.name.alignedToCenter(length: maximumNameLength) }
        stringizedPlayers = players.joined(separator: space)
        stringizedResults = results.joined(separator: space)
    }
    
    //MARK: 메소드
    func printLadderGame() {
        let leadingSpaces = String(repeating: space, count: LadderGame.maximumNameLength / 2 + 1)
        print(
            """
            \(leadingSpaces)\(stringizedPlayers)
            \(stringizedLadder)
            \(leadingSpaces)\(stringizedResults)
            """
        )
    }
    
}

