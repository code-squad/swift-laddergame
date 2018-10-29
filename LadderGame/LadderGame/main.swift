//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation
/// << LadderGame Step_3 >> ///
/** << 요구사항 >>
 1. 기존 코드를 모두 삭제하고 처음부터 다시 구현을 시작하거나, 이전 단계 메소드 분리 요구사항을 구현한 상태에서 시작한다.
 2. 구조체 타입 강의 슬라이드 자료를 학습한다.
 3. 사다리 게임에 참여하는 사람에 이름을 최대5글자까지 부여할 수 있다. 사다리를 출력할 때 사람 이름도 같이 출력한다.
 4. 사람 이름은 쉼표(,)를 기준으로 구분한다.
 5. 사람 이름을 5자 기준으로 출력하기 때문에 사다리 폭도 넓어져야 한다.
 **/

/// LadderGame
struct LadderGame {
    var players: [LadderPlayer] = [LadderPlayer]()
    var ladderLegs: LadderLeg = LadderLeg(playerNum: 0)
    var ladderHeight: Int = 0
    var playersCount: Int = 0
    
    /// Player
    struct LadderPlayer {
        var name: String = ""
    }
    
    /// Ladder Leg
    struct LadderLeg {
        var playerNum: Int
        init(playerNum: Int) {
            self.playerNum = playerNum
        }
        
        func makeRandomBool() -> Bool {
            return arc4random_uniform(2) == 0 ? true : false
        }
        func makeRandomBoolSet() -> [Bool] {
            var boolSet: [Bool] = []
            for _ in 1...playerNum-1 {
                boolSet.append(makeRandomBool())
            }
            return boolSet
        }
        func getLadderLeg(randomBoolSet: [Bool]) -> [Bool] {
            var randomLadderLeg: [Bool] = randomBoolSet
            for index in 0..<randomLadderLeg.count-1 {
                if randomLadderLeg[index] == true {
                    randomLadderLeg[index+1] = false
                }
            }
            return randomLadderLeg
        }
    }
}

/// inputView
func inputView() -> [String] {
    var inputSet: [String?] = []
    print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요.)")
    inputSet.append(readLine())
    print("최대 사다리 높이는 몇 개 인가요?")
    inputSet.append(readLine())
    return bindOptional(optionalStrSet: inputSet)
}
// 입력받은 compactMap메서드를 통하여 [String?] -> [String]으로 변환한다.
func bindOptional(optionalStrSet: [String?]) -> [String] {
    return optionalStrSet.compactMap{ $0 }
}
/// OutputView
func printerOneOrderLadder(_ ladderLeg: LadderGame.LadderLeg) -> String {
    var result: String = "  |"
    for item in ladderLeg.getLadderLeg(randomBoolSet: ladderLeg.makeRandomBoolSet()) {
        result += item == true ? "-----|" : "     |"
    }
    return result
}
func printerWholeLadder(_ ladderHeight: Int, _ ladderLeg: LadderGame.LadderLeg) {
    let ladderLeg: LadderGame.LadderLeg = ladderLeg
    for _ in 1...ladderHeight {
        print(printerOneOrderLadder(ladderLeg))
    }
}
func printPlayeName(_ ladderPlayers: LadderGame) {
    for item in ladderPlayers.players {
        switch item.name.count {
        case 1:
            print("  \(item.name)   ", terminator: "")
        case 2:
            print("  \(item.name)  ", terminator: "")
        case 3:
            print(" \(item.name)  ", terminator: "")
        case 4:
            print(" \(item.name) ", terminator: "")
        case 5:
            print("\(item.name) ", terminator: "")
        default:
            print("Error")
        }
    }
    print("")
}
// 플레이어 이름 글자수 체크
func checkInputNameCount(playerNames: [String]) -> Bool {
    for item in playerNames {
        if item.count < 1 || item.count > 5 {
            return false
        }
    }
    return true
}
/// main function
func main() {
    while(true) {
    // inputView호출을 통하여 정보를 입력받는다.
    let ladderGameInformation = inputView()
    /// 입력받은 정보를 객체의 타입에 맞게 분리한다.
    // ladderPlayer의 정보를 [String]타입으로 분리
    let ladderPlayerStrSet = ladderGameInformation[0].components(separatedBy: ",").map { $0.components(separatedBy: " ").joined() }
    // LadderGame Instance 만들기
    var ladderGameInstance: LadderGame = LadderGame()
    // LadderGamePlayer Instance 만들기
    var ladderGameLadderPlayerInstance: LadderGame.LadderPlayer = LadderGame.LadderPlayer()
    // 플레이어의 이름수를 체크한다.
    switch checkInputNameCount(playerNames: ladderPlayerStrSet) {
    case true:
    // For문을 통해 LadderGamePlayer 이름정보를 players에 저장
    for index in 0..<ladderPlayerStrSet.count {
        ladderGameInstance.players.append(ladderGameLadderPlayerInstance)
        ladderGameInstance.players[index].name = ladderPlayerStrSet[index]
        }
    case false:
    print("플레이어의 이름은 1~5문자입니다.")
    break
    }
    
    // LadderGame인스턴스의 사다리 높이를 저장
    ladderGameInstance.ladderHeight = Int(ladderGameInformation[1])!
    // LadderGame인스턴스의 플레이어의 수를 저장
    ladderGameInstance.playersCount = ladderGameInstance.players.count
    // LadderGame의 ladderLeg 인스턴스를 생성과 동시에 초기화
    var ladderGameLadderLegInstance: LadderGame.LadderLeg = LadderGame.LadderLeg(playerNum: ladderGameInstance.playersCount)
    // Ladder부터 PlayerName까지 출력
    printerWholeLadder(ladderGameInstance.ladderHeight, ladderGameLadderLegInstance)
    printPlayeName(ladderGameInstance)
    }
}

//// call main
main()

