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
    
    private let stringizedLadder: String
    private let stringizedPlayers: String
    
    init(ladderGame: LadderGame) {
        stringizedLadder = ladderGame.ladder.stringized()
        let players = ladderGame.players.map { $0.alignedName }
        self.stringizedPlayers = players.joined(separator: " ")
    }
    
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

