//
//  Receiver.swift
//  LadderGame
//
//  Created by Yoda Codd on 2018. 4. 3..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

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
    private func makePeopleList(people : String) -> Array<String> {
        let peopleList = people.components(separatedBy: ",")
        return peopleList
    }
    
    /// 사람을 입력받고 , 로 나누고 카운트 해서 리턴하는 함수 집합
    func receivePeople()-> Array<String>{
        // 인원수 입력메세지 출력
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        // 유저가 입력한 사람들을 받는다
        let people = receiveUserInput()
        // 받은 유저들을 리스트화해서 리턴한다.
        return makePeopleList(people: people)
    }
    
    /// 사다리높이를 입력받아서 리턴
    func receiveUpLadderNumber()->String{
        // 인원수 입력메세지 출력
        print("최대 사다리 높이는 몇 개인가요?")
        return receiveUserInput()
    }
}
