/*
 커밋할 때는 최소 작업단위로 나눠서 커밋 PR은 여러 개 커밋이 합쳐져 있어야 한다.
 struct를 추가하면 파일을 나눠서 작업하기 파일을 추가하면 커밋을 해야
 좋은 커밋 로그 공부
 */

/*
 들여쓰기 depth를  1단계로 줄이기
 메소드의 라인 최대 10줄
 method가 한 가지일만 하도록
 
 위 3개 다 메소드를 분리하기
 
 
 /*
 LadderGame 이 모든 객체를 생성해서 소유하고 있어서 의존성을 갖고 있는 것보다는
 다른 객체가 할 일을 넘겨주도록 (=의존성을 줄이도록) 작성하는 게 좋습니다.
 여기 변수들이 (극단적으로보면) 존재하지 않고, LadderGame을 호출하는 상위 객체에서 넘겨주도록 작성하는 게 좋습니다. 이 부분은 3단계를 할 때 개선해봅시다.
 ->감이 안 잡힘.
 */
 
 
 */

import Foundation

extension Int{
    var arc4random:Int{
        return Int(arc4random_uniform(UInt32(self)))
    }
}

/*
 Printer 객체에 관련있는 함수를 모아놓은 것 자체는 좋습니다.
 다만 입력이 있고, 처리하고, 출력이 있는 구조에서는 이런 구조보다는
 (print가 포함되어 있지만) Input 관련 객체, 입력받은 값들로 사다리게임을 처리하는 객체, 사다리게임 구조를 출력하는 Output 객체 이런식으로 구분하는 게 좋습니다.
 그래야 하나의 기능을 변경할 때 하나의 파일만 바꾸게 됩니다.
 -> 역시 감이 안 잡힘.
 */
struct Printer {
    static let questionNumberOfPerson = "참여할 사람은 몇 명 인가요?"
    static let questionumberOfLadder = "최대 사다리 높이는 몇 개인가요?"
    
    func askNumberOfPerson(){
        print(Printer.questionNumberOfPerson)
    }
    
    func askNUmberOfLadder(){
        print(Printer.questionumberOfLadder)
    }
    
    func printLadder(_ ladderMatrix:[[String]]){
        for row in ladderMatrix{
            print("|", terminator:"")
            print(row.joined(separator: ""), terminator:"")
            print()
        }
    }
}


struct Scanner {
    func userInputValue() -> Int {
        
        let rawUserInputValue = readLine()
        
        guard rawUserInputValue == nil || (rawUserInputValue?.isEmpty ?? false) else {
            return 0
        }
        
        return Int(rawUserInputValue!) ?? 0
    }
}

var ladderGame = LadderGame()
ladderGame.start()

