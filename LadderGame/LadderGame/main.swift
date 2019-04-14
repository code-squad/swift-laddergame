import Foundation

let input : InputView = InputView()
let buildLadder : LadderStep = LadderStep()
let output : ResultView = ResultView()
let ladderElement : LadderGame = LadderGame(names: input.inputName(), height: input.inputHeight())

let ladder = buildLadder.makeLadder(players: ladderElement.names, ladderHeight: ladderElement.height)

output.printLadder(ladders: ladder, names: ladderElement.names)
