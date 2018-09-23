//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

enum stateInput {
    case completeInput
    case faultInput
}

// 사용자의 입력을 받아서 Int를 추출하는 함수
func inputFromUser() -> Int{
    guard let userInput = readLine() else{
        return -1
    }
    return Int(userInput) ?? -1
}

// 제대로 입력한 경우  --> .completeInput 을 반환
// 음수를 입력하거나 숫자와 스트링을 섞어서 입력한 경우  --> .faultInput 을 반환
func isRightUserInput(peopleNumberInput : Int) -> stateInput{
    guard peopleNumberInput != -1 && peopleNumberInput > 0 else {
        return .faultInput
    }
    return .completeInput
}

// 사용자의 입력이 올바르게 될 떄까지 입력 받음
func repeatUntilRightInputFromUser(inputMessage : String) -> Int{
    var inputUser : Int
    repeat{
        print(inputMessage)
        inputUser = inputFromUser()
    }while isRightUserInput(peopleNumberInput: inputUser) == .faultInput
    
    return inputUser
}

// 랜덤 함수로 1일 경우 "-" 생성을 위해 true를 반환, 0일 경우 " " 생성을 위해 false를 반환
func isExistLadder() -> Bool{
    return arc4random_uniform(2) == 0
}

// isExistLadder함수의 결과로 ture일 경우 "-"를 생성, false일 경우 " "을 생성
func createLadderOrSpace() -> String{
    guard isExistLadder() else{
        return " "
    }
    return "-"
}

// 입력받은 사람 수와 사다리 최대 높이에 따라 사다리를 초기화
func initializeLadder(peopleCount : Int, heightLadder : Int) -> [[String]]{
    return Array(repeating: Array(repeating: "|", count: peopleCount), count: heightLadder)
}

// 사람과 사람 사이 랜덤으로 "-", " " 둘 중 하나를 생성시킴
func addRandomLadder(initialLadder : [[String]], peopleCount : Int, heightLadder : Int) -> [[String]]{
    var completeLadder : [[String]] = initialLadder
    for i in 0..<heightLadder{
        completeLadder[i] = addColummRandomLadder(rowLadder: completeLadder[i])
    }
    return completeLadder
}

// 각 행별로 따로 때어와서 addColummRandomLadder()에서 열에 랜덤으로 "-", " " 추가
func addColummRandomLadder(rowLadder : [String]) -> [String]{
    var addElementInLadder : [String] = rowLadder
    for index in 0..<rowLadder.count-1{
        addElementInLadder.insert(createLadderOrSpace(), at: 2*index+1)
    }
    return addElementInLadder
}

// 생성된 사다리 콘솔창에 출력
func printLadder(outputLadder : [[String]], heightLadder : Int){
    for i in 0..<heightLadder{
        printColummElement(rowLadder: outputLadder[i])
        print("")
    }
}

// 각 행별로 존재하는 Columm 요소 콘솔창에 출력
func printColummElement(rowLadder : [String]){
    for colummElement in rowLadder{
        print("\(colummElement)", terminator: "")
    }
}

func main(){
    let inputFromUserPeopleCount : Int = repeatUntilRightInputFromUser(inputMessage: "참여할 사람은 몇 명 인가요?")
    let inputFromUserHeightLadder : Int = repeatUntilRightInputFromUser(inputMessage: "최대 사다리 높이는 몇 개인가요?")
    
    var ladder : [[String]] = initializeLadder(peopleCount: inputFromUserPeopleCount, heightLadder: inputFromUserHeightLadder)
    ladder = addRandomLadder(initialLadder: ladder, peopleCount: inputFromUserPeopleCount, heightLadder: inputFromUserHeightLadder)
    printLadder(outputLadder: ladder, heightLadder: inputFromUserHeightLadder)
}

main()
