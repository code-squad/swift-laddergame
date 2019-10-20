import Foundation

func baseData() -> (Int, Int) {
    print("참여할 사람은 모두 몇 명인가")
    let pplNum = Int(readLine() ?? "0")!

    print("최대 사다리 높이는 모두 몇 개인가")
    let ladderheight = Int(readLine() ?? "0")!
    
    return (pplNum, ladderheight)
}

func makeLadders(_ participants: Int, _ height: Int){
    var ladder = Array<Array<Bool>>()
    for _ in 0..<height {
        var ladderRow = Array<Bool>()
        for _ in 0..<participants {
            ladderRow.append(Bool.random())
        }
        ladder.append(ladderRow)
    }

    for ladderRow in ladder {
        for step in ladderRow {
            print(step ? "-|" : " |", terminator: "")
        }
        print("")
    }
}

let (pplNum, ladderheight) = baseData()
makeLadders(pplNum, ladderheight)
