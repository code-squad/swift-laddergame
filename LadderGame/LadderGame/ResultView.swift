import Foundation

struct ResultView {
    func printLadder(_ playerNumber:Array<String>, _ inputMaxLadderNumber:Int) {
        let ladderGame = LadderGame()
        print(ladderGame.createLadder(playerNumber, inputMaxLadderNumber))
        print(ladderGame.createNames(playerNumber))
    }
}
