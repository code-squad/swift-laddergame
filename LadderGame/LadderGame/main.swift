//
//  LadderGame step1
//
//  요구사항
//  n개의 사람과 m개의 사다리 개수를 입력할 수 있어야 한다.
//  사다리는 랜덤으로 있거나 없을 수도 있다.
//  사다리가 있으면 -를 표시하고 없으면 " " 빈공백을 표시한다. 양옆에는 |로 세로를 표시한다.
//  사다리 상태를 화면에 출력한다. 어느 시점에 출력할 것인지에 대한 제약은 없다.
//
//  프로그래밍 요구사항
//  메소드가 너무 많은 일을 하지 않도록 분리하기 위해 노력해 본다.

//  실행결과
/*
 요구사항에 따라 3명의 사람을 위한 5개 높이 사다리를 만들 경우, 프로그램을 실행한 결과는 다음과 같다.
 참여할 사람은 몇 명 인가요?
 3
 최대 사다리 높이는 몇 개인가요?
 5
 |-| |
 | |-|
 |-| |
 | |-|
 |-| |
 */
// 힌트
/*
 랜덤값은 arc4random_uniform() 함수를 활용할 수 있다.
 2차원 배열을 활용하자.
 값이 있거나 없다면 Bool 타입을 사용할 수 있다.
 */

/*
 JK 피드백 입력/출력/메인 흐름까지 모두 역할과 책임에 따라 분리하기
 */
// 일단 객체를 뽑자
// LadderGame 전체를 조율
// scanner 입력 객체
// printer 출력 객체
// 혹시 makeLadder(), initLadderMatrix()도
// 객체를 만들어서 뺴야 하나요?

import Foundation

extension Int{
    var arc4random:Int{
        return Int(arc4random_uniform(UInt32(self)))
    }
}

struct LadderGame {
    var numberOfPerson:Int = 0
    var heightOfLadder:Int = 0
    var ladderMatrix = [[Bool]]()
    let printer:Printer = Printer()
    let scanner:Scanner = Scanner()
    
    mutating func start(){
        printer.askNumberOfPerson()
        numberOfPerson = scanner.userInputValue()
        printer.askNUmberOfLadder()
        heightOfLadder = scanner.userInputValue()
        initLadderMatrix()
        makeLadder()
        printer.printLadder(ladderMatrix)
    }
    
    mutating func makeLadder(){
        let numberOfLadder = ( numberOfPerson + heightOfLadder ) / 2
        for _ in 0..<numberOfLadder{
            ladderMatrix[heightOfLadder.arc4random][(numberOfPerson-1).arc4random] = true
        }
    }
    
    mutating func initLadderMatrix(){
        ladderMatrix = Array(repeating: Array(repeating: false, count: numberOfPerson-1), count: heightOfLadder)
    }
}

struct Printer {
    static let questionNumberOfPerson = "참여할 사람은 몇 명 인가요?"
    static let questionumberOfLadder = "최대 사다리 높이는 몇 개인가요?"
    
    func askNumberOfPerson(){
        print(Printer.questionNumberOfPerson)
    }
    
    func askNUmberOfLadder(){
        print(Printer.questionumberOfLadder)
    }
    
    func printLadder(_ ladderMatrix:[[Bool]]){
        let pillar = "|"
        for row in ladderMatrix{
            print(pillar, terminator:"")
            for colOfRow in row{
                if colOfRow == true {
                    print("-\(pillar)", terminator: "")
                } else {
                    print(" \(pillar)", terminator:"")
                }
            }
            print()
        }
    }
}


struct Scanner {
    func userInputValue() -> Int {
        guard let userInputValue = Int(readLine()!) else {
            return 0
        }
        return userInputValue
    }
}

var ladderGame = LadderGame()
ladderGame.start()
