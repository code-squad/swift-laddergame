//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

struct Player {
    let name: String
}

struct LadderGame {
    let players: [Player]
    let heightOfLadders: Int
    
    var ladders = [[Bool]]()
    
    init(players: [Player], heightOfLadders: Int) {
        self.players = players
        self.heightOfLadders = heightOfLadders
    }
    
    mutating func makeLadders() {
        for _ in 1...heightOfLadders {
            var line = [Bool]()
            for _ in 1...players.count {
                let random = Int.random(in: 0...1)
                line.append(random == 1)
            }
            ladders.append(line)
        }
    }
    
    func printLadders() {
        for line in ladders {
            print("|", terminator: "")
            for step in line {
                step ? print("-----", terminator: "") : print("     ", terminator: "")
                print("|", terminator: "")
            }
            print("")
        }
        players.forEach {
            print($0.name, terminator: " ")
        }
        print()
    }
}


struct InputView {
    func makeGame() -> LadderGame {
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        let playerNamesInput = readLine() ?? ""
        print("최대 사다리 높이는 몇 개인가요?")
        let heightOfLadders = readLine() ?? ""
        
        let players = playerNamesInput.trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: " ", with: "")
            .split(separator: ",")
            .map { String($0) }
            .map { Player(name: $0) }
        
        var game = LadderGame(players: players, heightOfLadders: Int(heightOfLadders) ?? 0)
        game.makeLadders()
        return game
    }
}

struct ResultView {
    let game: LadderGame
    
    func print() {
        game.printLadders()
    }
}

let inputView = InputView()
let game = inputView.makeGame()
let resultView = ResultView(game: game)
resultView.print()
