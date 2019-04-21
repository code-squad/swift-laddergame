import Foundation

struct Test {
    func heightCoordinate(_ ladderHeight:Int)->Int{
        return Int(arc4random_uniform(UInt32(ladderHeight)))
    }
    
    func widthCoordinate(_ playerNumber:Int)->Int{
        return (Int(arc4random_uniform(UInt32(playerNumber-1))) * 2) + 1
    }
    
    func Randomcordinates(ladderHeight:Int,playerNumber:Int) -> Array<Int> {
        let height = heightCoordinate(ladderHeight) ,width = widthCoordinate(playerNumber)
        return [height,width]
    }
    
    func isEmpty(ladders:[[Character]],coordinates:Array<Int>,empty:Character,full:Character) -> Character {
        let ladders = ladders
        guard ladders[coordinates[0]][coordinates[1]] == empty else {
            return full
        }
        return empty
    }
    
    func checkRight (ladders:[[Character]],coordinates:Array<Int>,empty:Character,full:Character) -> Character {
        var coordinates = coordinates
        coordinates[1] = coordinates[1] + 2
        return isEmpty(ladders: ladders, coordinates: coordinates, empty: empty, full: full)
    }
    
    func checkLeft (ladders:[[Character]],coordinates:Array<Int>,empty:Character,full:Character) -> Character {
        var coordinates = coordinates
        coordinates[1] = coordinates[1] - 2
        return isEmpty(ladders: ladders, coordinates: coordinates, empty: empty, full: full)
    }
    
    func checkRightLeft(ladders:[[Character]],coordinates:Array<Int>,empty:Character,full:Character) -> Character {
        let right = checkRight(ladders: ladders, coordinates: coordinates, empty: empty, full: full)
        let left = checkLeft(ladders: ladders, coordinates: coordinates, empty: empty, full: full)
        guard right == empty && left == empty else{
            return full
        }
        return empty
    }
    
    
    func isContinue(ladders:[[Character]],coordinates:Array<Int>,ladderWidthLength:Int,empty:Character,full:Character) -> Character {
        switch coordinates[1] {
        case 1:
            return checkRight(ladders: ladders, coordinates: coordinates, empty: empty, full: full)
        case ladderWidthLength - 2 :
            return checkLeft(ladders: ladders, coordinates: coordinates, empty: empty, full: full)
        default:
            return checkRightLeft(ladders: ladders, coordinates: coordinates, empty: empty, full: full)
        }
    }
    
    func idontno(ladders:[[Character]],empty:Character,full:Character,ladderHeight:Int,playerNumber:Int) -> Array<Int> {
        let coordinates = Randomcordinates(ladderHeight:ladderHeight, playerNumber:playerNumber)
        guard isEmpty(ladders: ladders, coordinates: coordinates, empty: empty, full: full) == empty else {
            return idontno(ladders:ladders,empty:empty,full:full,ladderHeight:ladderHeight,playerNumber:playerNumber)
        }
        return coordinates
    }
    
    func canMarking(ladders:[[Character]],ladderWidthLength:Int,empty:Character,full:Character,ladderHeight:Int,playerNumber:Int) -> Array<Int> {
        let coordinates = idontno(ladders: ladders, empty: empty, full: full, ladderHeight: ladderHeight, playerNumber: playerNumber)
        guard isContinue(ladders: ladders, coordinates: coordinates, ladderWidthLength: ladderWidthLength, empty: empty, full: full) == empty else {
            return canMarking(ladders: ladders, ladderWidthLength: ladderWidthLength, empty: empty, full: full, ladderHeight: ladderHeight, playerNumber: playerNumber)
        }
        return coordinates
    }
    
    func marking(ladders:[[Character]],coordinates:Array<Int>) -> [[Character]] {
        var ladders = ladders
        ladders[coordinates[0]][coordinates[1]] = "-"
        return ladders
    }
    
    func addWidth(widthLadderNumber:Int,ladders:[[Character]],ladderHeight:Int,playerNumber:Int,ladderWidthLength:Int) -> [[Character]] {
        let empty:Character = " ", full:Character = "-"
        var ladders = ladders
        var index = 0
        let ladderNum = ladderWidthLength
        while index < ladderNum {
            let coordinates = canMarking(ladders: ladders, ladderWidthLength: ladderWidthLength, empty: empty, full: full, ladderHeight: ladderHeight, playerNumber: playerNumber)
            ladders = marking(ladders: ladders, coordinates: coordinates)
            index += 1
        }
        return ladders
    }
}
