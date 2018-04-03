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
    
    /// 가로사다리를 넣어도 되면 가로사다리를, 안되면 빈가로사다리를 리턴
    private func sideLadderFrom(aheadLadder : Bool)->String{
        var sideLadder = LadderType.none.rawValue
        if aheadLadder {
            sideLadder = LadderType.side.rawValue
        }
        return String(repeating : sideLadder, count: Limiter.nameLengthLimit())
    }
    
    /// 사다리게임 가로줄만 있는 1차원 배열 리턴
    private func makeSideLadders(peopleNumber : Int)-> Array<String>{
        // 앞자리 가로사다리 우선 없다고 체크
        var aheadSideLadder = false
        // 리턴용 배열 생성
        var sideLadders = Array<String>()
        // 입력받은 사람수 -1 만큼 반복문을 돌린다. 가로사다리는 사람보다 1개 적다.
        for _ in (0..<peopleNumber-1){
            // 앞자리에 가로사다리 여부 체크 후 변수에 가로나 세로사다리 입력
            aheadSideLadder = sideLadderAfter(aheadSideLadder: aheadSideLadder)
            // 현제 자리에 사다리를 넣어준다.
            sideLadders.append(sideLadderFrom(aheadLadder: aheadSideLadder))
        }
        return sideLadders
    }
    
    /// 사다리게임의 가로줄 1개에 해당하는 1차원 배열을 리턴. 입력값 사람수.
    private func makeLadders(sideLadders : Array<String>) -> Array<String>{
        // 리턴용 배열 선언. 이름길이 5자를 위해서 두칸 공백을 입력
        var ladders = [LadderType.startSpace.rawValue]
        // 첫번째 칸은 세로 사다리
        ladders.append(LadderType.up.rawValue)
        // 가로사다리의 개수만큼 반복한다
        for sideLadder in sideLadders{
            // 현제 자리에 사다리를 넣어준다.
            ladders.append(sideLadder)
            // 가로사다리 입력 후 다시 세로사다리 추가
            ladders.append(LadderType.up.rawValue)
        }
        return ladders
    }
    
    /// 입력받은 횟수만큼 사다리 1채원 배열을 생성해서 2차원 배열로 리턴
    func makeLadderGameBoard(peopleNumber : Int, ladderNumber : Int)->Array<Array<String>>{
        // 리턴용 2차원 배열을 생성
        var ladderGameBoard = Array<Array<String>>()
        // 입력받은 사다리 수 만큼 반복한다
        for _ in (0..<ladderNumber){
            // 1차원 배열을 생성해서 2차원 배열에 추가해준다. 우선 가로사다리만 있는 배열 생성 후
            let sideladders = makeSideLadders(peopleNumber: peopleNumber)
            // 세로사다리를 합친 1차원 배열을 2차원 배열에 추가
            ladderGameBoard.append(makeLadders(sideLadders: sideladders))
        }
        return ladderGameBoard
    }
}
