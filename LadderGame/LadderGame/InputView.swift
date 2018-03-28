//
//  InputView.swift
//  LadderGame
//
//  Created by moon on 2018. 3. 23..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//


struct InputView {
    
    enum Question: String {
        case namesOfPlayers = "참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)"
        case heightOfLadder = "최대 사다리 높이는 몇 개인가요?"
    }
    
    static func ask(question: Question) {
        print(question.rawValue)
    }
    
    static func getNamesOfPlayers() -> [LadderPlayer] {
        self.ask(question: self.Question.namesOfPlayers)
        
        guard let inputNames = readLine() else {
            return []
        }

        let stringInput = inputNames.split(separator: ",").map{ String($0) }
        return self.setupLadderPlayers(namesOfPlayers: stringInput)
    }
    
    static func setupLadderPlayers(namesOfPlayers: [String]) -> [LadderPlayer] {
        return namesOfPlayers.map{ LadderPlayer(name: $0) }
    }

    static func getHeightOfLadder() -> Int {
        self.ask(question: self.Question.heightOfLadder)
        
        guard let input = readLine(), let heightOfLadder = Int(input) else {
            return 0
        }
        
        return heightOfLadder
    }
}
