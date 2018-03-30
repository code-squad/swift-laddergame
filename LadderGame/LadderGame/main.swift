//
//  main.swift
//  xYLadder
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

/// 이름 입력글자수 제한을 걸기위한 상수클래스 선언
class Limiter {
    /// 이름입력 글자수 한도
    static func nameLengthLimit()->Int{
        // 현재 요구사항은 5글자까지
        return 5
    }
}

/// 사다리 종류를 품는 열거형.
enum  LadderType : String {
    case side = "-"
    case up = "|"
    case none = " "
    // 게임 시작시 맨 처음에 추가되는 값
    case startSpace = "  "
}

/// 사다리게임을 생성하는 구조체
struct LadderGameMaker {
    /// 50%의 확률로 참 리턴
    private func randomChance()->Bool{
        return arc4random_uniform(2)==0
    }
    
    /// 문자열과 숫자를 입력받아서 횟수만큼 붙여서 리턴. 입력받는 이름수에 맞춰서 가로사다리 사이즈 조절가능하도록 하는 함수.
    private func textMultiplier(text : String, number : Int) -> String {
        var multipledText = ""
        for _ in 0..<number {
            multipledText += text
        }
        return multipledText
    }
    
    /// 앞칸의 가로사다리 여부를 받아서 있으면 없음을, 없으면 확률로 있다고 리턴
    private func sideLadderAfter(aheadSideLadder : Bool) -> Bool{
        // 앞자리 사다리가 빈가로사다리 일경우 && 확률이 성공할 경우
        if aheadSideLadder == false && randomChance() {
            // 확률로 가로사다리를 리턴
            return true
            
        }
        // 앞자리에 가로사다리가 있을경우 빈 사다리 리턴
        return false
    }
    
    /// 가로사다리를 넣어도 되면 가로사다리를, 안되면 빈가로사다리를 리턴
    private func sideLadderFrom(aheadLadder : Bool)->String{
        if aheadLadder {
            return textMultiplier(text: LadderType.side.rawValue, number: Limiter.nameLengthLimit())
        }
        return textMultiplier(text: LadderType.none.rawValue, number: Limiter.nameLengthLimit())
    }
    
    /// 사다리게임 가로줄만 있는 1차원 배열 리턴
    private func makeSideLadders(peopleNumber : Int)-> Array<String>{
        // 앞자리 가로사다리 우선 없다고 체크
        var aheadSideLadder = false
        // 리턴용 배열 생성
        var sideLadders = Array<String>()
        // 입력받은 사람수 -1 만큼 반복문을 돌린다. 가로사다리는 사람보다 1개 적다.
        for _ in (0..<peopleNumber-1){
            // 앞자리에 가로사다리 여부 체크 후 변수에 가로나 세로사다리 입력
            aheadSideLadder = sideLadderAfter(aheadSideLadder: aheadSideLadder)
            // 현제 자리에 사다리를 넣어준다.
            sideLadders.append(sideLadderFrom(aheadLadder: aheadSideLadder))
        }
        return sideLadders
    }
    
    /// 사다리게임의 가로줄 1개에 해당하는 1차원 배열을 리턴. 입력값 사람수.
    private func makeLadders(sideLadders : Array<String>) -> Array<String>{
        // 리턴용 배열 선언. 이름길이 5자를 위해서 두칸 공백을 입력
        var ladders = [LadderType.startSpace.rawValue]
        // 첫번째 칸은 세로 사다리
        ladders.append(LadderType.up.rawValue)
        // 가로사다리의 개수만큼 반복한다
        for sideLadder in sideLadders{
            // 현제 자리에 사다리를 넣어준다.
            ladders.append(sideLadder)
            // 가로사다리 입력 후 다시 세로사다리 추가
            ladders.append(LadderType.up.rawValue)
        }
        return ladders
    }
    
    /// 입력받은 횟수만큼 사다리 1채원 배열을 생성해서 2차원 배열로 리턴
    func makeLadderGameBoard(peopleNumber : Int, ladderNumber : Int)->Array<Array<String>>{
        // 리턴용 2차원 배열을 생성
        var ladderGameBoard = Array<Array<String>>()
        // 입력받은 사다리 수 만큼 반복한다
        for _ in (0..<ladderNumber){
            // 1차원 배열을 생성해서 2차원 배열에 추가해준다. 우선 가로사다리만 있는 배열 생성 후
            let sideladders = makeSideLadders(peopleNumber: peopleNumber)
            // 세로사다리를 합친 1차원 배열을 2차원 배열에 추가
            ladderGameBoard.append(makeLadders(sideLadders: sideladders))
        }
        return ladderGameBoard
    }
}
/// 유저 입력을 받는 구조체
struct Receiver {
    /// 유저의 입력을 받는 함수
    private func receiveUserInput()->String {
        //유저 입력을 받아서 userInput 에 입력
        guard let userInput = readLine() else {
            return ""
        }
        return userInput
    }
    
    /// 입력받은 사람들을 , 를 기준으로 나누어 리턴
    private func makePeopleList(people : String) -> (peopleList : Array<Substring>, peopleCount : Int ) {
        let peopleList = people.split(separator: ",")
        let peopleCount = peopleList.count
        return (peopleList,peopleCount)
    }
    
    /// 사람들을 입력받아서 배열로 리턴.
    private func inputPeople()->(String){
        // 인원수 입력메세지 출력
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        // 유저가 입력한 사람들을 받는다
        return receiveUserInput()
    }
    
    /// 사람을 입력받고 , 로 나누고 카운트 해서 리턴하는 함수 집합
    func receivePeople()->(peopleList : Array<Substring>, peopleCount : Int){
        // 유저가 입력한 사람들을 받는다
        let people = inputPeople()
        // 받은 유저들을 리스트화 한다.
        let (peopleList,peopleCount) = makePeopleList(people: people)
        return (peopleList,peopleCount)
    }
    
    /// 사다리높이를 입력받아서 리턴
    func inputUpLadderNumber()->String{
        // 인원수 입력메세지 출력
        print("최대 사다리 높이는 몇 개인가요?")
        return receiveUserInput()
    }
}

/// 입력값에 대한 검증하는 구조체
struct Checker {
    /// 들어온 사람들 목록에 내용이 있는지 체크
    private func zeroCheck(peopleList : Array<Substring>) -> Bool{
        guard peopleList.count > 1 else {
            print("2명 이상을 입력해주세요")
            return false
        }
        return true
    }
    
    /// 입력받은 사람들이 5글자가 넘는지 체크
    private func checkNameLength(peopleList : Array<Substring>) -> Bool{
        for person in peopleList {
            guard person.count <= Limiter.nameLengthLimit() else {
                print("이름이 \(Limiter.nameLengthLimit())자를 넘어갔습니다 - \(person)")
                return false
            }
        }
        return true
    }
    
    /// 입력받은 사람에 대한 전체적인 검사
     func checkAll(peopleList : Array<Substring>)->Array<Substring>?{
        guard zeroCheck(peopleList : peopleList) && checkNameLength(peopleList : peopleList) else {
            return nil
        }
        return peopleList
    }
    
    /// 입력받은 숫자가 진짜 숫자인지 체크
    func checkNumber(inputNumber : String)->Int?{
        guard let number = Int(inputNumber) else {
            return nil
        }
        return number
    }
}

/// 사람이름 정렬해주는 구조체
struct Aligner {
    /// 받은 이름을 사다리게임에 맞게 조절해서 문자열로 리턴
    private func alignNameFrom(personName : String.SubSequence) -> String {
        // 글자수를 기준으로 6칸에 위치를 조정해서 리턴
        switch personName.count {
        case 1 :
            return (String(repeating: " ", count: 2)+String(personName)+String(repeating: " ", count: 3))
        case 2 :
            return (String(repeating: " ", count: 2)+String(personName)+String(repeating: " ", count: 2))
        case 3 :
            return (String(repeating: " ", count: 1)+String(personName)+String(repeating: " ", count: 2))
        case 4 :
            return (String(repeating: " ", count: 0)+String(personName)+String(repeating: " ", count: 2))
        case 5 :
            return (String(repeating: " ", count: 0)+String(personName)+String(repeating: " ", count: 1))
        default :
            return String(personName)
        }
    }
    
    /// 검증끝난 이름리스트를 받아서 정렬 후 배열로 리턴
    func alignNameList(nameList : Array<Substring>) -> Array<String>{
        //리턴용 배열 선언
        var alignedNameList = Array<String>()
        // 입력받은 이름들을 정렬해서 배열에 추가한다
        for name in nameList {
            alignedNameList.append(alignNameFrom(personName: name))
        }
        return alignedNameList
    }
}

struct Printer {
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
    
    /// 입력받은 1차원 배열을 보기 좋게 프린트
    func printList(list : Array<String>){
        print ( list.joined())
    }
}
/// 프로그램 실행을 위한 메인함수
func main(){
    //구조체들의 선언
    let ladderGameMaker = LadderGameMaker()
    let receiver = Receiver()
    let checker = Checker()
    let aligner = Aligner()
    let printer = Printer()
    
    // 유저의 사람입력을 받아서 리스트화,숫자 를 선언
    let (peopleList,peopleNumber) = receiver.receivePeople()
    // 사다리 높이를 입력받는다
    let inputLadderNumber = receiver.inputUpLadderNumber()
    // 사다리높이가 숫자인지 체크한다
    guard let ladderNumber = checker.checkNumber(inputNumber: inputLadderNumber) else {
        return ()
    }
    // 사람수와 사다리높이로 사다리게임을 만든다
    let ladderGameBoard = ladderGameMaker.makeLadderGameBoard(peopleNumber: peopleNumber, ladderNumber: ladderNumber)
    // 사람리스트에 대한 체크를 한다
    guard let checkedList = checker.checkAll(peopleList: peopleList) else {
        return ()
    }
    // 체크가 끝난 사림 리스트를 정렬한다
    let alignedList = aligner.alignNameList(nameList:checkedList)
    // 작성완료된 게임과 리스트를 출력한다
    
    printer.printLadderGame(ladderGame: ladderGameBoard)
    printer.printList(list: alignedList)
}

// 메인함수 실행
main()


