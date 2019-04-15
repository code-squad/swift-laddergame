import Foundation

func main() throws {
    let playerInfo = try InputControl.readNameOfPlayers()
    let height = try InputControl.readHeight()
    let ladderGame = try LadderGame(players: playerInfo.Players, height: height)
    let ladderGameView = LadderGameView(ladderGame: ladderGame, maxNameLength: playerInfo.maxNameLength)
    ladderGameView.printLadderGame()
}


do {
    try main()
} catch InputError.invalidNumberOfPlayers {
    print("오류: 참여자 수가 유효하지 않습니다.")
} catch InputError.invalidLadderHeight {
    print("오류: 사다리 높이가 유효하지 않습니다.")
} catch InputError.invalidInput {
    print("오류: 입력이 유효하지 않습니다.")
} catch InputError.cannotClassifyNumber {
    print("오류: 입력에서 숫자를 구별할 수 없습니다.")
} catch {
    print("예상치 못한 오류 발생: \(error)")
}
