//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//


/*
 JK's feedback:
 ✅ getNumberOfPeople함수의 변수명 :
 - 개선 : number -> numberOfPeople 로 개선
 ✅ 의도를 명확하게 하여 주석이 필요 없을 정도가 되기! :
 - 개선 : 함수의 이름과 매개변수 등을 통해 문장처럼 개선
 ✅ drawLine() 은 뭔가 출력하거나 그리는 동작을 할 것 같은데 문자열을 리턴하고 있네요. 함수 이름으로 기대하는 바와 조금 다른 것 같습니다.
 - 개선 : drawLine() -> makeBar(element)로 변경
 ✅ width를 계산해서 반복문을 구현한 방식은 처음이네요. 사람수 만큼만 반복하는 방법은 없을까요?
 특히 짝수일때마다 비교해서 "|"를 쓰고 있는데 비교문도 최소화할 수 있을 것 같습니다.
 반복 개수나 비교 횟수를 줄일 방법이 있다면 그게 더 좋습니다.
 ✅ 사다리를 표현하는 데이터 구조를 [[String]] 으로 선택한 이유가 있나요?
 - 개선 : 전체 로직 변경, 데이터 구조 변경
    - 데이터구조 변경 : [[Bool]], 기존에는 의미없는 세로줄도 데이터에 넣고 배열을 생성하여 데이터가 커질수록 비효율적인 구조에서
 변칙이 있는 가로줄에 관한 데이터만 담는 배열을 생성하여 사용. 배열에는 true, false만 갖고 있고 출력하는 곳에 이에 따라 출력하는 문자열을 달리함.
    - width를 사람수와 frame 기준으로 변경하여 비교문과 반복 횟수를 줄임.
 ✅ 0 아니라 100이나 1000, 10000을 입력하면 어떤가요? 처리 가능한가요? checkInvalid() 함수는 검사를 하는 함수인가요?
 검사 결과를 출력하는 함수인가요? 둘 다 하는 함수보다는 함수 하나가 한 가지 일을 하도록 만들어주세요.
 - 개선 :
    - 함수이름 변경 : 입력 중 0이 있는지 없는지 검사만 하면되는 함수이기에 hasNumberZero로 이름 변경
    - 함수역할 변경 : 기존에 출력하는 로직을 삭제 후 0이 있는지 없는지 검사한 결과값만을 반환(Bool 타입)
 */


import Foundation


enum Question: String {
    case numberOfPeople = "참여할 사람은 몇 인가요?"
    case numberOfHeight = "최대 사다리 높이는 몇 개인가요?"
}

func ask(question: Question) {
    print(question.rawValue)
}

func getNumberOfPeople() -> Int {
    guard let input = readLine(), let numberOfPeople = Int(input) else {
        return 0
    }
    
    return numberOfPeople
}

func getHeightOfLadder() -> Int {
    guard let input = readLine() else {
        return 0
    }
    
    guard let heightOfLadder = Int(input) else {
        return 0
    }
    
    return heightOfLadder
}

func hasNumberZero(_ people: Int, _ height: Int) -> Bool {
    return (people == 0 || height == 0)
}

func makeLadder(numberOfColumn: Int, numberOfRow: Int) -> [[Bool]] {
    var ladder = [[Bool]](repeating: Array(repeating: false, count: numberOfColumn), count: numberOfRow)
    
    for row in 0..<numberOfRow {
        for column in 0..<numberOfColumn {
            ladder[row][column] = generateRandom()
        }
    }
    
    return ladder
}

func generateRandom() -> Bool {
    return arc4random_uniform(2) == 1
}

func drawLadder(_ ladder: [[Bool]]) {
    
    for row in ladder {
        print("|", terminator: "")
        for column in row {
            print(makeBar(element: column), terminator: "|")
        }
        print()
    }
}

func makeBar(element: Bool) -> String {
    return element ? "-" : " "
}

func numberOfFrameFor(_ numberOfPeople: Int) -> Int {
    return numberOfPeople - 1
}

func runLadderGame() {
    
    ask(question: Question.numberOfPeople)
    let numberOfPeople: Int = getNumberOfPeople()
    
    ask(question: Question.numberOfHeight)
    let heightOfLadder = getHeightOfLadder()
    
    guard !hasNumberZero(numberOfPeople, heightOfLadder) else {
        return
    }
    
    let numberOfFrame = numberOfFrameFor(numberOfPeople)
    
    let ladder = makeLadder(numberOfColumn: numberOfFrame, numberOfRow: heightOfLadder)
    drawLadder(ladder)
}


// MARK: Run a program.
runLadderGame()
