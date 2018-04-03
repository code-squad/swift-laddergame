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
    
    // 유저의 사람입력을 받아서 리스트화,숫자 를 선언
    let peopleList = receiver.receivePeople()
    // 사다리 높이를 입력받는다
    let inputLadderNumber = receiver.receiveUpLadderNumber()
    // 사다리높이가 숫자인지, 사람리스트가 정상인지 체크한다
    guard let ladderNumber = Checker.checkNumber(inputNumber: inputLadderNumber) , let checkedList = Checker.checkPeople(peopleList: peopleList) else {
        return ()
    }
    // 사람수와 사다리높이로 사다리게임을 만든다
    let ladderGameBoard = ladderGameBoardMaker.makeLadderGameBoard(peopleNumber: peopleList.count, ladderNumber: ladderNumber)
    // 체크가 끝난 사림 리스트를 정렬한다
    let alignedList = aligner.alignNameList(nameList:checkedList)
    
    // 작성완료된 게임과 리스트를 출력한다
    printer.printLadderGame(ladderGameBoard: ladderGameBoard,peopleList: alignedList)
}

// 메인함수 실행
main()


