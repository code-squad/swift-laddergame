//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//


import Foundation

struct Main {
    static func start(){
        if let applicants = InputView.readApplicants(), let height = InputView.readLadderHeight() {
            let game = LadderGame(height: height, applicants: applicants)
            let resultView = Result(element: game.generateLadder(), applicants: applicants)
            OutputView.display(resultView.generateDisplayForm())
        }
    }
}

Main.start()
