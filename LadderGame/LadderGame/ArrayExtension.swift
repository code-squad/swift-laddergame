extension Array where Element == Ladder.Component {
    /// 사다리 배열에 가로대를 무작위로 삽입합니다. 단, 바로 전에 가로대를 넣은 경우 넣지 않습니다.
    func rungsRandomlyInserted() -> [Ladder.Component]{
        var wasPlacedJustBefore = false
        var rowWithRungs = self
        for index in self.indices {
            if !wasPlacedJustBefore && Bool.random() {
                rowWithRungs[index] = Ladder.Component.rung
                wasPlacedJustBefore = true
            } else {
                wasPlacedJustBefore = false
            }
        }
        return rowWithRungs
    }
    /// 사다리 열을 문자열로 변환합니다.
    func stringized() -> String {
        let stringizedInfo = self.map { String(repeating: $0.rawValue, count: 5) }
        return stringizedInfo.joined(separator: "|")
    }
}
