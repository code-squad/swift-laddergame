import Foundation


func main() throws {
    let ladderGameController = LadderGameController()
    let ladderInfo = try ladderGameController.readLadderInfo()
    let ladder = Ladder(participants: ladderInfo.participants, height: ladderInfo.height)
    let ladderView = LadderView(ladder: ladder)
    ladderView.printLadder()
}


do {
    try main()
} catch InputError.invalidNumberOfParticipants {
    print("오류: 유효하지 않은 참여자 수")
} catch InputError.invalidLadderHeight {
    print("오류: 유효하지 않은 사다리 높이")
} catch {
    print("예상치 못한 오류: \(error)")
}

