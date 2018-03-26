//
//  main.swift
//  xYLadder
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

//문자열과 숫자를 입력받아 숫자-1까지의 홀수 혹은 짝수 리스트를 배열로 리턴.
func intervalNumber(evenOrOdd : String , maxNumber : Int)->Array<Int>{
    // 리턴할 숫자 종류.
    let startNumber : Int
    // 짝수를 원할경우
    if evenOrOdd == "even" {
        // 짝수는 0부터 시작
        startNumber = 0
    } else {
        // 홀수는 1부터 시작
        startNumber = 1
    }
    let interval = 2
    // 결과값으로 리턴할 배열 선언
    var listOfOddOrEven = Array<Int>()
    // 시퀀스로 생성. to 는 해당 숫자를 포함하지 않음.
    let sequence = stride(from: startNumber, to: maxNumber, by: interval)
    //시퀀스의 값들만 배열에 추가
    for element in sequence {
        listOfOddOrEven.append(element)
    }
    return listOfOddOrEven
}

/// 50%의 확률로 참 리턴
func halfChance()->Bool{
    if arc4random_uniform(2)==0 {
        return true
    } else {
        return false
    }
}

/// 확률로 가로사다리나 공백 리턴. 앞자리에 가로사다리가 없을 경우 확률에 의해 가로사다리의 여부를 결정한다.
func xLadderByChance()->String{
    // 확률 함수를 불러서
    if halfChance(){
        // 성공하면 가로사다리 리턴
        return "-"
    } else {
        // 실패하면 공백 리턴
        return " "
    }
}

/// 앞칸의 가로사다리 여부를 받아서 있으면 빈칸, 없으면 확률로 사다리를 리턴
func xLadderAfter(aheadXLadder : String) -> String{
    // 앞자리 사다리가 가로사다리가 아닐경우
    if aheadXLadder == " "{
        // 확률로 가로사다리를 리턴
        return xLadderByChance()
    }
    // 앞자리에 가로사다리가 있을경우 빈 사다리 리턴
    return " "
}

/// 가로사다리만 있는 1차원 배열을 리턴. 입력값 사람수.
func makeXOnlyLadder(peopleNumber : Int) -> Array<String>{
    // 앞자리 가로사다리 우선 없다고 체크
    var aheadXLadderk : String = " "
    // 리턴용 배열 선언
    var xOnlyLadder = Array<String>()
    // 입력받은 사람수 -1 만큼 반복문을 돌린다. 가로사다리는 사람보다 1개 적다.
    for _ in (0..<peopleNumber-1){
        // 앞자리에 가로사다리 여부 체크
        aheadXLadderk = xLadderAfter(aheadXLadder: aheadXLadderk)
        // 현제 자리에 사다리를 넣어준다.
        xOnlyLadder.append(aheadXLadderk)
    }
    return xOnlyLadder
}

/// 가로 세로 사다리가 다 있는 1차원 배열을 리턴. 입력값 : 사람수
func makeXYLadder(peopleNumber : Int) -> Array<String>{
    // 가로사다리만 있는 배열 생성
    let xOnlyLadder = makeXOnlyLadder(peopleNumber: peopleNumber)
    // 리턴용 배열 선언
    var xYLadder = Array<String>()
    // 사다리의 시작은 세로사다리
    xYLadder.append("|")
    // 가로사다리 배열을 홀수칸에 채워준다.
    for xLadder in (xOnlyLadder){
        // 가로사다리의 내용을 넣고
        xYLadder.append(xLadder)
        // 그 뒤에 세로사다리를 넣어준다
        xYLadder.append("|")
    }
    return xYLadder
}

/// 입력받은 횟수만큼 사다리 1채원 배열을 생성해서 2차원 배열로 리턴
func makeLadderGameBoard(peopleNumber : Int, ladderNumber : Int)->Array<Array<String>>{
    // 리턴용 2차원 배열을 생성
    var ladderGameBoard = Array<Array<String>>()
    // 입력받은 사다리 수 만큼 반복한다
    for _ in (0..<ladderNumber){
        // 1차원 배열을 생성해서 2차원 배열에 추가해준다
        ladderGameBoard.append(makeXYLadder(peopleNumber: peopleNumber))
    }
    return ladderGameBoard
}

/// 입력받은 2차원 사다리게임을 보기 좋게 프린트
func printLadderGame(ladderGame : Array<Array<String>>){
    var printedLadderGame = ""
    for layer in ladderGame {
        printedLadderGame += layer.joined()+"\n"
    }
    print (printedLadderGame)
}

/// 유저입력받는 함수
func recieveUserInput()->String {
    //유저 입력을 받아서 userInput 에 입력
    if let userInput = readLine(){
        return userInput
    }
    else {
        return ""
    }
}

/// 사람수와 사다리높이를 입력받아서 튜플로 리턴
func inputPeopleAndLadderNumber()->(peopleNumber:Int,yLadderNumber:Int)?{
    // 인원수 입력메세지 출력
    print("참여할 사람은 몇 명 인가요?")
    guard let peopleNumber = Int(recieveUserInput()) else {
        print("잘못된 인원 입력입니다")
        return nil
    }
    // 인원수 입력메세지 출력
    print("최대 사다리 높이는 몇 개인가요?")
    guard let yLadderNumber = Int(recieveUserInput()) else {
        print("잘못된 개수 입력입니다")
        return nil
    }
    return (peopleNumber,yLadderNumber)
}

/// 프로그램 실행을 위한 메인함수
func main(){
    guard let (peopleNumber,yLadderNumber) = inputPeopleAndLadderNumber() else {
        return ()
    }
    
    printLadderGame(ladderGame: makeLadderGameBoard(peopleNumber: peopleNumber, ladderNumber: yLadderNumber))
    
}

// 메인함수 실행
main()


























