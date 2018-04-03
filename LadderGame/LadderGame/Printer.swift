//
//  Printer.swift
//  LadderGame
//
//  Created by Yoda Codd on 2018. 4. 3..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

//출력을 위한 구조체
struct Printer {
    /// 입력받은 1차원 배열을 보기 좋게 프린트
    private func printPeopleList(list : Array<String>){
        print ( list.joined())
    }
    
    /// 가로사다리를 넣어도 되면 가로사다리를, 안되면 빈가로사다리를 리턴
    private func sideLadderFrom(aheadLadder : Bool)->String{
        var sideLadder = LadderType.none.rawValue
        if aheadLadder {
            sideLadder = LadderType.side.rawValue
        }
        return String(repeating : sideLadder, count: Limiter.nameLengthLimit())
    }
    
    /// 사다리게임의 가로줄 1개에 해당하는 1차원 배열을 리턴. 입력값 사람수.
    private func makeLadders(sideLadders : Array<Bool>) -> Array<String>{
        // 리턴용 배열 선언. 이름길이 5자를 위해서 두칸 공백을 입력
        var ladders = [LadderType.startSpace.rawValue]
        // 첫번째 칸은 세로 사다리
        ladders.append(LadderType.up.rawValue)
        // 가로사다리의 개수만큼 반복한다
        for sideLadder in sideLadders{
            // 현제 자리에 사다리를 넣어준다.
            ladders.append(sideLadderFrom(aheadLadder: sideLadder))
            // 가로사다리 입력 후 다시 세로사다리 추가
            ladders.append(LadderType.up.rawValue)
        }
        return ladders
    }
    
    /// 입력받은 2차원 사다리게임을 보기 좋게 프린트
    private func printLadderGameBoard(ladderGameBoard : Array<Array<Bool>>){
        // 출력용 변수 선언
        var printedLadderGame = ""
        // 입력값으로 받은 2차원 배열을 반복문에 돌려서
        for layer in ladderGameBoard {
            // 각 배열을 출력용 변수에 추가. 줄바꿈 문자도 끝에 추가.
            printedLadderGame += makeLadders(sideLadders: layer).joined()+"\n"
        }
        print (printedLadderGame)
    }
    
    /// 전체 게임 내용을 프린트
    func printLadderGame(ladderGameBoard : Array<Array<Bool>>,peopleList : Array<String>){
        printLadderGameBoard(ladderGameBoard : ladderGameBoard)
        printPeopleList(list : peopleList)
    }
}
