import Foundation


enum LadderComponent: String {
    case rung = "-"
    case empty = " "
}


func insertRungsRandomlyWithoutSuccession(row: [LadderComponent]) -> [LadderComponent] {
    var rungPlacedJustBefore = false
    var rowWithRung = row
    for index in row.indices {
        if !rungPlacedJustBefore && Bool.random() {
            rowWithRung[index] = LadderComponent.rung
            rungPlacedJustBefore = true
        } else {
            rungPlacedJustBefore = false
        }
    }
    return rowWithRung
}



func createLadder(numberOfParticipants: Int, height: Int) -> [[LadderComponent]] {
    let row = [LadderComponent](repeating: LadderComponent.empty, count: numberOfParticipants - 1)
    let ladder = [[LadderComponent]](repeating: row, count: height)
    var ladderWithRung: [[LadderComponent]] = []
    for index in ladder.indices {
        ladderWithRung.append(insertRungsRandomlyWithoutSuccession(row: ladder[index]))
        ladderWithRung[index].insert(LadderComponent.empty, at: 0)
        ladderWithRung[index].append(LadderComponent.empty)
    }
    return ladderWithRung
}

/// 한 열을 사다리를 표현하는 문자열로 변환합니다.
func stringize(row: [LadderComponent]) -> String {
    let stringizedInfo = row.map { $0.rawValue }
    return stringizedInfo.joined(separator: "|")
}

/// 사다리를 사다리를 표현하는 문자열로 변환합니다.
func print(ladder: [[LadderComponent]]) {
    var stringizedLadder = ""
    for row in ladder {
        stringizedLadder.append("\(stringize(row: row))\n")
    }
    print(stringizedLadder)
}


enum InputError: Error {
    case notACountableNumber
}

func getNumberOfParticipants() throws -> Int {
    print("참여할 사람은 몇 명 인가요?")
    return try getCountableNumberFromUser()
}

func getLadderHeight() throws -> Int {
    print("최대 사다리 높이는 몇 개인가요?")
    return try getCountableNumberFromUser()
}


func getCountableNumberFromUser() throws -> Int {
    guard let countableNumber = Int(readLine()!) else {
        throw InputError.notACountableNumber
    }
    return countableNumber
}


func run() {
    do {
        let numberOfParticipants = try getNumberOfParticipants()
        let ladderHeight = try getLadderHeight()
        let ladder = createLadder(numberOfParticipants: numberOfParticipants, height: ladderHeight)
        print(ladder: ladder)
    } catch InputError.notACountableNumber {
        print("셀 수 있는 숫자가 아닙니다.")
    } catch {
        print("알 수 없는 오류 입니다.")
    }
}

run()
