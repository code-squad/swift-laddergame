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
            let people = InputView.receiveName()
            let ladder = InputView.receiveLadder()
            let pass = try Inspection.meetMinimum(people, ladder)
            let ladders = LadderGame.getFullLadder(pass.people, pass.ladder)
            ResultView.printFull(ladders)
            return
        }
        catch inputError.lackLadder {
            print(inputError.lackLadder.description)
        }
        catch inputError.wrongValue {
            print(inputError.wrongValue.description)
        }
        catch inputError.lackParticipant {
            print(inputError.lackParticipant.description)
        }
        catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }
}

main()
