//
//  LadderGameMaker.swift
//  LadderGame
//
//  Created by Yoda Codd on 2018. 4. 3..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

/// 사다리게임을 생성하는 구조체
struct LadderGameBoardMaker {
    /// 50%의 확률로 참 리턴
    private func randomChance()->Bool{
        return arc4random_uniform(2)==0
    }
    
    /// 앞칸의 가로사다리 여부를 받아서 있으면 없음을, 없으면 확률로 있다고 리턴
    private func sideLadderAfter(aheadSideLadder : Bool) -> Bool{
        // 앞자리 사다리가 빈가로사다리 일경우 && 확률이 성공할 경우
        if aheadSideLadder == false && randomChance() {
            // 확률로 가로사다리를 리턴
            return true
        }
        // 앞자리에 가로사다리가 있을경우 빈 사다리 리턴
        return false
    }
    
    /// 사다리게임 가로줄만 있는 1차원 배열 리턴
    private func makeSideLadders(peopleNumber : Int)-> Array<Bool>{
        // 앞자리 가로사다리 우선 없다고 체크
        var aheadSideLadder = false
        // 리턴용 배열 생성
        var sideLadders = Array<Bool>()
        // 입력받은 사람수 -1 만큼 반복문을 돌린다. 가로사다리는 사람보다 1개 적다.
        for _ in (0..<peopleNumber-1){
            // 앞자리에 가로사다리 여부 체크 후 변수에 가로나 세로사다리 입력
            aheadSideLadder = sideLadderAfter(aheadSideLadder: aheadSideLadder)
            // 현제 자리에 사다리를 넣어준다.
            sideLadders.append(aheadSideLadder)
        }
        return sideLadders
    }
    
    /// 입력받은 횟수만큼 사다리 1채원 배열을 생성해서 2차원 배열로 리턴
    func makeLadderGameBoard(peopleNumber : Int, ladderNumber : Int)->Array<Array<Bool>>{
        // 리턴용 2차원 배열을 생성
        var ladderGameBoard = Array<Array<Bool>>()
        // 입력받은 사다리 수 만큼 반복한다
        for _ in (0..<ladderNumber){
            // 1차원 배열을 생성해서 2차원 배열에 추가해준다. 
            ladderGameBoard.append(makeSideLadders(peopleNumber: peopleNumber))
        }
        return ladderGameBoard
    }
}
