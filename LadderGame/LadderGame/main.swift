import Foundation

/// 사다리의 구성 요소입니다.
enum LadderComponent: String {
    case verticalLine = "|"
    case rung = "-"
    case empty = " "
}

/// 빈 사다리를 생성합니다.
func createEmptyLadder(numberOfParticipant: Int, ladderHeight: Int) -> [[LadderComponent]] {
    var ladder: [[LadderComponent]] = [[]]
    ladder[0].append(LadderComponent.verticalLine)
    for _ in 1..<numberOfParticipant {
        ladder[0].append(LadderComponent.empty)
        ladder[0].append(LadderComponent.verticalLine)
    }
    for _ in 1..<ladderHeight {
        ladder.append(ladder[0])
    }
    return ladder
}

/// 사다리에 무작위로 가로대를 넣습니다.
func addRungs(to ladder: [[LadderComponent]]) -> [[LadderComponent]] {
    var ladderWithRungs = ladder
    for row in 0..<ladder.count {
        for colunm in stride(from: 1, to: ladder[row].count, by: 2) {
            if Bool.random() {
                ladderWithRungs[row][colunm] = LadderComponent.rung
            }
        }
    }
    return ladderWithRungs
}


func run() {
    print("참여할 사람은 몇 명 인가요?")
    guard let numberOfParticipant = Int(readLine()!) else {
        print("오류: 숫자 아님")
        return
    }
    print("최대 사다리 높이는 몇 개인가요?")
    guard let ladderHeight = Int(readLine()!) else {
        print("오류: 숫자 아님")
        return
    }
    
    var ladder = createEmptyLadder(numberOfParticipant: numberOfParticipant, ladderHeight: ladderHeight)
    ladder = addRungs(to: ladder)
    for row in ladder {
        for colunm in row {
            print(colunm.rawValue, terminator: "")
        }
        print()
    }
}

run()
