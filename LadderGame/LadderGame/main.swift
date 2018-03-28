//
//  main.swift
//  xYLadder
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

/// 50%의 확률로 참 리턴
func randomChance()->Bool{
    return arc4random_uniform(2)==0
}

/// 확률로 가로사다리나 공백 리턴. 앞자리에 가로사다리가 없을 경우 확률에 의해 가로사다리의 여부를 결정한다.
func randomSideLadder()->String{
    // 확률 함수를 불러서
    if randomChance(){
        // 성공하면 가로사다리 리턴
        return "-----"
    }
    return " "
}

/// 앞칸의 가로사다리 여부를 받아서 있으면 빈칸, 없으면 확률로 사다리를 리턴
func sideLadderAfter(aheadSideLadder : String) -> String{
    // 앞자리 사다리가 가로사다리가 아닐경우
    if aheadSideLadder == " "{
        // 확률로 가로사다리를 리턴
        return randomSideLadder()
    }
    // 앞자리에 가로사다리가 있을경우 빈 사다리 리턴
    return " "
}

/// 사다리게임 가로줄만 있는 1차원 배열 리턴
func makeSideLadders(peopleNumber : Int)-> Array<String>{
    // 앞자리 가로사다리 우선 없다고 체
    var aheadSideLadder = " "
    // 리턴용 배열 생성
    var sideLadders = Array<String>()
    // 입력받은 사람수 -1 만큼 반복문을 돌린다. 가로사다리는 사람보다 1개 적다.
    for _ in (0..<peopleNumber-1){
        // 앞자리에 가로사다리 여부 체크 후 변수에 가로나 세로사다리 입력
        aheadSideLadder = sideLadderAfter(aheadSideLadder: aheadSideLadder)
        // 현제 자리에 사다리를 넣어준다.
        sideLadders.append(aheadSideLadder)
    }
    return sideLadders
}

/// 사다리게임의 가로줄 1개에 해당하는 1차원 배열을 리턴. 입력값 사람수.
func makeUpAndSideLadder(sideLadders : Array<String>) -> Array<String>{
    // 리턴용 배열 선언. 첫번째 칸은 세로 사다리.
    var upAndSideLadder = ["|"]
    // 가로사다리의 개수만큼 반복한다
    for sideLadder in sideLadders{
        // 현제 자리에 사다리를 넣어준다.
        upAndSideLadder.append(sideLadder)
        // 가로사다리 입력 후 다시 세로사다리 추가
        upAndSideLadder.append("|")
    }
    return upAndSideLadder
}

/// 입력받은 횟수만큼 사다리 1채원 배열을 생성해서 2차원 배열로 리턴
func makeLadderGameBoard(peopleNumber : Int, ladderNumber : Int)->Array<Array<String>>{
    // 리턴용 2차원 배열을 생성
    var ladderGameBoard = Array<Array<String>>()
    // 입력받은 사다리 수 만큼 반복한다
    for _ in (0..<ladderNumber){
        // 1차원 배열을 생성해서 2차원 배열에 추가해준다
        let sideladders = makeSideLadders(peopleNumber: peopleNumber)
        ladderGameBoard.append(makeUpAndSideLadder(sideLadders: sideladders))
    }
    return ladderGameBoard
}

/// 입력받은 2차원 사다리게임을 보기 좋게 프린트
func printLadderGame(ladderGame : Array<Array<String>>){
    // 출력용 변수 선언
    var printedLadderGame = ""
    // 입력값으로 받은 2차원 배열을 반복문에 돌려서
    for layer in ladderGame {
        // 각 배열을 출력용 변수에 추가. 줄바꿈 문자도 끝에 추가.
        printedLadderGame += layer.joined()+"\n"
    }
    print (printedLadderGame)
}

/// 유저의 입력을 받는 함수
func receiveUserInput()->String {
    //유저 입력을 받아서 userInput 에 입력
    guard let userInput = readLine() else {
        return ""
    }
    return userInput
}

/// 사람수를 입력받아서 리턴
func inputPeopleNumber()->Int?{
    // 인원수 입력메세지 출력
    print("참여할 사람은 몇 명 인가요?")
    guard let peopleNumber = Int(receiveUserInput()) else {
        return nil
    }
    return peopleNumber
}

/// 사다리높이를 입력받아서 리턴
func inputUpLadderNumber()->(Int)?{
    // 인원수 입력메세지 출력
    print("최대 사다리 높이는 몇 개인가요?")
    guard let ladderNumber = Int(receiveUserInput()) else {
        return nil
    }
    return (ladderNumber)
}

/// 사람수와 사다리높이를 입력받아서 튜플로 리턴
func inputPeopleAndUpLadderNumber()->(peopleNumber:Int,ladderNumber:Int)?{
    guard let peopleNumber = inputPeopleNumber() else {
        print("잘못된 인원 입력입니다")
        return nil
    }
    guard let ladderNumber = inputUpLadderNumber() else {
        print("잘못된 사다리 개수 입력입니다")
        return nil
    }
    return (peopleNumber,ladderNumber)
}

/// 프로그램 실행을 위한 메인함수
func main(){
    guard let (peopleNumber,ladderNumber) = inputPeopleAndUpLadderNumber() else {
        return ()
    }
    let ladderGameBoard = makeLadderGameBoard(peopleNumber: peopleNumber, ladderNumber: ladderNumber)
    printLadderGame(ladderGame: ladderGameBoard)
}

// 메인함수 실행
main()


