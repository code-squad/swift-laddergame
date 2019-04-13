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

struct LadderGameView {
    
    //MARK: 비공개 속성
    private let stringizedLadder: String
    private let stringizedPlayers: String
    
    //MARK: 이니셜라이저
    init(ladderGame: LadderGame) {
        stringizedLadder = ladderGame.ladder.stringized()
        let players = ladderGame.players.map { $0.alignedName }
        self.stringizedPlayers = players.joined(separator: " ")
    }
    
    //MARK: 메소드
    func printPlayersAndLadder() {
        let leadingSpaces = String(repeating: " ", count: LadderGame.maximumNameLength / 2 + 1)
        print(
            """
            \(leadingSpaces)\(stringizedPlayers)
            \(stringizedLadder)
            \(leadingSpaces)
            """
        )
    }
    
}

