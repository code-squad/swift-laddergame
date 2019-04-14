//
//  main.swift
//  LadderGame
//
//  Created by kcushy
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    while true {
        do {
            let participant = InputView.receiveName()
            let ladder = InputView.receiveLadder()
            let inspection : Inspection = Inspection()

            let (names, height) = try inspection.meetMinimum(of: participant, of: ladder)
            try inspection.meetLength(of: names)
            let game = LadderGame(people: names, height: height)
            let ladders = game.FullLadder()
            ResultView.printFull(of: ladders)
            ResultView.printName(of: names)
            return
        }
        catch inputError.lackValue {
            print(inputError.lackValue.description)
        }
        catch inputError.wrongValue {
            print(inputError.wrongValue.description)
        }
        catch inputError.exceedLength {
            print(inputError.exceedLength.description)
        }
        catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }
}

main()
