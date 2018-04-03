//
//  main.swift
//  xYLadder
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation
/// 프로그램 실행을 위한 메인함수
func main(){
    //구조체들의 선언
    let ladderGameBoardMaker = LadderGameBoardMaker()
    let receiver = Receiver()
    let aligner = Aligner()
    let printer = Printer()
   
    // 유저의 사람입력과 세로사다리 높이를 입력받음
    guard  let (peopleList,upLadderNumber) = receiver.receiveElements() else {
        return ()
    }
    // 사람수와 사다리높이로 사다리게임을 만든다
    let ladderGameBoard = ladderGameBoardMaker.makeLadderGameBoard(peopleNumber: peopleList.count, ladderNumber: upLadderNumber)
    // 체크가 끝난 사림 리스트를 정렬한다
    let alignedList = aligner.alignNameList(nameList:peopleList)
    
    // 작성완료된 게임과 리스트를 출력한다
    printer.printLadderGame(ladderGameBoard: ladderGameBoard,peopleList: alignedList)
}

// 메인함수 실행
main()


