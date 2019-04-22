//
//  LadderFloor.swift
//  LadderGame
//
//  Created by JieunKim on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderFloor {
    // 값을 변경할 수 없이 읽기만 가능한 steps
    private var steps = [LadderStep]()
    private var ladderWidth: Int
    
    // LadderFloor 구조체로 생성된 인스턴스의 프로퍼티를 따로 빼오는 것
    public func getSteps()-> [LadderStep] {
        return steps
    }
    
    init(numberOfPlayer: Int) {
        self.ladderWidth = numberOfPlayer - 1
        
        for _ in 0..<ladderWidth {
            steps.append(LadderStep.init())
        }
        setLadderStep()
    }
    
  
    
    private mutating func setLadderStep() {
        for current in 1..<ladderWidth {
            let previous = current - 1
            guard steps[previous].isConnceted else {
                continue
            }
            steps[current].isConnceted = false
        }
    }
    
    
}

