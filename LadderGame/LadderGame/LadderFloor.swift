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
    private var steps = [LadderStep]() // init(){}
    // LadderStep에게 선언 및 기본 초기화
    private var ladderWidth: Int
    
    // LadderFloor 구조체로 생성된 인스턴스의 프로퍼티를 따로 빼오는 것
    public func getSteps()-> [LadderStep] {
        return steps
    }
    
    init(numberOfPlayer: Int) {
        self.ladderWidth = numberOfPlayer - 1
        steps = [LadderStep](repeating: LadderStep.init(), count: ladderWidth)
        // 크기가 정해져있으면 고정크기를 만들어 놓는 것이 더욱 효율적이다.
        
        // 동적으로 계속 append하는 느낌
        //        for _ in 0..<ladderWidth {
        //            steps.append(LadderStep.init())
        //        }
       
        setLadderStep()
    }
    
  // 초기화할 때 값이 있는지 없는지 체크하려면 (옵셔널)
    
    
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

