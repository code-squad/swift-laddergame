//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//


import Foundation

if let applicants = InputView.readApplicants(), let height = InputView.readLadderHeight() {
    let game = LadderGame(height: height, names: applicants)
    let resultView = Result(element: game.generateLadder(), applicants: applicants)
    resultView.display()
}
