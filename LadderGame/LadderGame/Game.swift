//
//  Game.swift
//  LadderGame
//
//  Created by 이동건 on 17/07/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    private var height: Int
    private var applicants: [LadderPlayer]
    
    init?(height: Int, applicants: [LadderPlayer]) {
        if height == 0 || applicants.count == 0 {
            return nil
        }
        self.height = height
        self.applicants = applicants
    }
    
    func generateLadder() -> [[Bool]]{
        var ladder: [[Bool]] = []
        for _ in 0..<height{
            ladder.append(generateValidStage(applicants.count))
        }
        return ladder
    }
    
    private func generateValidStage(_ applicant: Int) -> [Bool] {
        var stage = generateRandomStage(applicant: applicant)
        while !isValidStage(stage) {
            stage = generateRandomStage(applicant: applicant)
        }
        return stage
    }
    
    private func isValidStage(_ stage: [Bool]) -> Bool {
        let typeCastedStage = stage.map {String($0)}
        return !typeCastedStage.joined().contains("truetrue")
    }
    
    private func generateRandomStage(applicant: Int) -> [Bool]{
        var stage:[Bool] = []
        for _ in 0..<applicant - 1 {
            stage.append(generateBridge())
        }
        return stage
    }
    
    private func generateBridge()-> Bool {
        let newBridge = arc4random_uniform(2)
        return newBridge == 1 ? true : false
    }
}
