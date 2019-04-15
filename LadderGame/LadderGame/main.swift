import Foundation

let input : InputView = InputView()
let buildLadder : LadderStep = LadderStep()
let output : ResultView = ResultView()
let ladderElement : LadderGame = LadderGame(inputText: input.inputCount())
let ladder = buildLadder.makeLadder(players: ladderElement.names, ladderHeight: ladderElement.ladderHeight)

output.printLadder(ladders: ladder, names: ladderElement.names)
