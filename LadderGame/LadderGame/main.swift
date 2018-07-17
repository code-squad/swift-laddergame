//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

/*
 1. Frame : 길만 있는 것. (세로)
 2. Bridge : 길과 길을 연결 (가로)
*/

import Foundation

let inputView = InputView()

if let applicants = inputView.readApplicants(), let height = inputView.readLadderHeight() {
    let game = LadderGame(height: height, names: applicants)
    let resultView = Result(element: game.generateLadder(), applicants: applicants)
    resultView.display()
}
