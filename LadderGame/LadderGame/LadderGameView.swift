import Foundation

extension Array where Element == Ladder.Component {
    /// 사다리 열을 문자열로 변환합니다.
    func stringized() -> String {
        let stringizedInfo = self.map { String(repeating: $0.rawValue, count: LadderGame.maximumNameLength) }
        return stringizedInfo.joined(separator: "|")
    }
}

extension Array where Element == [Ladder.Component] {
    /// 사다리를 문자열로 변환합니다.
    func stringized() -> String {
        var stringizedLadder = ""
        for row in self {
            stringizedLadder.append("\(row.stringized())\n")
        }
        return stringizedLadder
    }
}

struct LadderGameView {
    
    let stringizedLadder: String
    let stringizedPlayers: String
    let stringizedResult: String
    
    
    func stringize(ladder: Ladder) -> String {
        <#function body#>
    }
    
    
    
    
    
    
    
}

