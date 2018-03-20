//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

func main() {
    let ladder = Ladder()
    let input = InputrController()
    do {
        let userCount = try input.number()
        let ladderHieght = try input.number()
        
        guard ladderHieght > 0 else {
            throw LadderGameError.zeroError
        }
        
        for _ in 1 ... ladderHieght {
            let ladderLine = try ladder.makeLadderLine(userCount)
            print(ladderLine)
        }
    } catch {
        print("사다리 게임 에러")
        return
    }
}
main()

