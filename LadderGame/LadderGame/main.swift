//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

///시작 함수
func main() {
    let userInput: InputView
    let ladderGame: LadderGame
    
    do {
        userInput = try InputView()
        ladderGame = try LadderGame(players: userInput.players, height: userInput.ladderHeight)
    } catch let error as InputError {
        print(error.localizedDescription)
        return
    } catch let error as PlayerNameError {
        print(error.localizedDescription)
        return
    } catch let error as LadderGameError {
        print(error.localizedDescription)
        return
    } catch {
        return
    }
    
    ResultView.printLadder(ladderGame: ladderGame)
}

main()
