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
    /// 입력받은 2차원 사다리게임을 보기 좋게 프린트
    private func printLadderGameBoard(ladderGameBoard : Array<Array<String>>){
        // 출력용 변수 선언
        var printedLadderGame = ""
        // 입력값으로 받은 2차원 배열을 반복문에 돌려서
        for layer in ladderGameBoard {
            // 각 배열을 출력용 변수에 추가. 줄바꿈 문자도 끝에 추가.
            printedLadderGame += layer.joined()+"\n"
        }
        print (printedLadderGame)
    }
    
    /// 입력받은 1차원 배열을 보기 좋게 프린트
    private func printPeopleList(list : Array<String>){
        print ( list.joined())
    }
    
    /// 전체 게임 내용을 프린트
    func printLadderGame(ladderGameBoard : Array<Array<String>>,peopleList : Array<String>){
        printLadderGameBoard(ladderGameBoard : ladderGameBoard)
        printPeopleList(list : peopleList)
    }
}
