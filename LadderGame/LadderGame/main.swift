import Foundation


extension Array {
    
    /// 배열에 원소를 무작위로 삽입합니다.
    mutating func insertRandomly(_ element: Element) {
        for index in self.indices {
            if Bool.random() {
                self[index] = element
            }
        }
    }
    
}


struct Ladder {
    enum Component: String {
        case rung = "-"
        case empty = " "
    }
    
    var info: [[Component]]
    var printable = ""
    
    init(numberOfParticipants: Int, height: Int) {
        let row = [Component](repeating: Component.empty, count: numberOfParticipants - 1)
        info = [[Component]](repeating: row, count: height)
        for index in info.indices {
            info[index].insertRandomly(Ladder.Component.rung)
        }
    }
    
    /// 사다리를 출력가능한 문자열로 변환합니다.
    mutating func makePrintable() {
        /// 열에 세로줄을 추가합니다.
        func getPrintableRow(row: [Component]) -> String {
            var printableRow = ""
            let verticalLine = "|"
            printableRow += verticalLine
            for component in row {
                printableRow += component.rawValue
                printableRow += verticalLine
            }
            return printableRow
        }
        printable = ""
        for row in info {
            printable += "\(getPrintableRow(row: row))\n"
        }
    }
    
}


func run() {
    print("참여할 사람은 몇 명 인가요?")
    guard let numberOfParticipants = Int(readLine()!) else {
        print("오류: 숫자 아님")
        return
    }
    print("최대 사다리 높이는 몇 개인가요?")
    guard let height = Int(readLine()!) else {
        print("오류: 숫자 아님")
        return
    }
    var ladder = Ladder(numberOfParticipants: numberOfParticipants, height: height)
    ladder.makePrintable()
    print(ladder.printable)
}

run()
