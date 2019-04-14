//
//  main.swift
//  laddergame01
//
//  Created by 이희찬 on 10/04/2019.
//  Copyright © 2019 이희찬. All rights reserved.
//

import Foundation
//숫자 입력받기
func requestNumber()->Int{
    let userResponse = readLine()
    guard let number = Int(userResponse!) else{
        fatalError("양의정수를 입력하세요")
    }
    return number
}
//양수인지 검사후 아니라면 다시 입력유도
func requestCheck ()->Int{
    var number = requestNumber()
    while number <= 0 {
        print("양의정수를 입력하세요")
        number = requestNumber()
    }
    return number
}
//만들 배열의 가로길이 계산
func widthLength (width:Int)->Int{
    let len = ((width-1) * 2) + 1
    return len
}
//이차원 빈배열을 만든다
func emptyladders(width:Int, height:Int)->[[Character]]{
    let ladderArr : [[Character]] = Array(repeating: Array(repeating: " ",count:width ), count: height)
    return ladderArr
}
//"ㅣ"문자를 배열에 저장
func addHeight (width:Int,height:Int,ladders:[[Character]])->[[Character]]{
    var ladders = ladders
    for i in 0..<width{
        for j in 0..<height{
            ladders[j][i*2] = "ㅣ"
        }
    }
    return ladders
}
//무작위 y좌표(세로) 구하는 함수
func randomHeight (height:Int)->Int{
    let height = Int(arc4random_uniform(UInt32(height)))
    return height
}
//무작위 x좌표(가로) 구하는 함수
func randomWidth (width:Int)->Int{
    let Width = (Int(arc4random_uniform(UInt32(width-1))) * 2) + 1
    return Width
}
//"-"문자를 입력받은 개수 만큼 무작위로 배열에 저장
func addWidth (ladderNumber:Int,height:Int,width:Int,ladders:[[Character]])->[[Character]]{
    var index = 0
    var ladders = ladders
    while index < ladderNumber{
        let hightCoordinate = Int(arc4random_uniform(UInt32(height)))
        let widthCoordinate = (Int(arc4random_uniform(UInt32(width-1))) * 2) + 1
        guard ladders[hightCoordinate][widthCoordinate] == " " else{
            continue
        }
        ladders[hightCoordinate][widthCoordinate] = "-"
        index += 1
    }
    return ladders
}
//이쁘게 출력
func resultprint (ladders:[[Character]]){
    for i in ladders{
        print(String(i))
    }
}
//실행
func playLadderGame ()->Void{
    let playernumber = requestCheck()
    let WidthLadderNumber = requestCheck()
    let ladderHeight = requestCheck()
    let ladderWidthLength = widthLength(width:playernumber)
    var ladders = emptyladders(width:ladderWidthLength, height:ladderHeight)
    ladders = addHeight(width:playernumber,height:ladderHeight,ladders:ladders)
    ladders = addWidth(ladderNumber:WidthLadderNumber,height:ladderHeight,width:playernumber,ladders:ladders)
    resultprint(ladders: ladders)
}
playLadderGame()
