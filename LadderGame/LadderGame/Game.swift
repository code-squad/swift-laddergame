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
    private var names: [LadderPlayer]
    
    init(height: Int, names: [LadderPlayer]) {
        self.height = height
        self.names = names
    }
    
    func generateLadder() -> [[String]]{
        var ladder: [[String]] = []
        for _ in 0..<height{
            ladder.append(generateValidStage(names.count))
        }
        return ladder
    }
    
    private func generateValidStage(_ applicant: Int) -> [String] {
        var stage = generateRandomStage(applicant: applicant)
        while !isValidStage(stage) {
            stage = generateRandomStage(applicant: applicant)
        }
        return stage
    }
    
    private func isValidStage(_ stage: [String]) -> Bool {
        return !stage.joined().contains("----------")
    }
    
    private func generateRandomStage(applicant: Int) -> [String]{
        var stage:[String] = []
        for _ in 0..<applicant - 1 {
            stage.append(generateBridge())
        }
        return stage
    }
    
    private func generateBridge()-> String {
        let newBridge = arc4random_uniform(2)
        return newBridge == 1 ? "-----" : "     "
    }
}
