import Foundation

func main() throws {
    let players = try InputControl.readNameOfPlayers()
    let height = try InputControl.readHeight()
    let ladderGame = LadderGame(players: players, height: height)
    let ladderGameView = LadderGameView(ladderGame: ladderGame)
    ladderGameView.printPlayersAndLadder()
}

do {
    try main()
} catch InputError.invalidPlayerName {
    print("오류: 참여자 이름이 5글자보다 큽니다.")
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

