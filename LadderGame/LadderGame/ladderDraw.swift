import Foundation

struct ladderBoard {
    private let playerNumber:Int
    private let ladderHeight:Int
    
    private var ladderWidthLength:Int {
        return ((playerNumber-1) * 2) + 1
    }
    
    private var widthLadderNumber:Int {
        return Int.random (in: 1...(playerNumber - 1) / 2 * ladderHeight)
    }
    
    private lazy var widthLadderIsExistence:[[Bool]] = Array(repeating:Array(repeating: false, count:playerNumber-1), count:ladderHeight)
    
    lazy var Ladders:[[String]] = Array(repeating:Array(repeating: Ladder.emptyStep.rawValue, count:ladderWidthLength+1), count:ladderHeight)
    
    private func createRandomCoordinates() -> (Int,Int) {
        let height = Int.random(in: 0..<ladderHeight)
        let width = Int.random(in: 0..<playerNumber - 1)
        return (height,width)
    }
    
    private var (x,y) = (0,0)
    
    private mutating func isEmpty(_ x:Int,_ y:Int) -> Bool {
        guard widthLadderIsExistence[x][y] == false else {
            return false
        }
        return true
    }
    
    private mutating func isContinue() -> Bool {
        switch y {
        case 0:
            return isEmpty(x, y+1)
        case playerNumber-2:
            return isEmpty(x, y-1)
        default:
            return isEmpty(x, y+1) && isEmpty(x, y-1)
        }
    }
    
    private mutating func findEmptyCoordinate(){
        repeat {
            (x,y) = createRandomCoordinates()
        }
            while isEmpty(x,y) == false
    }
    
    private mutating func mark(){
        widthLadderIsExistence[x][y] = true
    }
    private mutating func isCorrectCoordinate() -> Bool {
        (x,y) = createRandomCoordinates()
        let isEmpty = self.isEmpty(x,y)
        let isContinue = self.isContinue()
        return (isEmpty && isContinue)
    }
    
    private mutating func findCorrectCoordinate() {
        var isCorrectCoordinate:Bool
        repeat{
            isCorrectCoordinate = self.isCorrectCoordinate()
        } while isCorrectCoordinate == false
    }
    
    mutating func markAsmuchWidthLadderNumber(){
        var index = 0
        let ladderNumber = widthLadderNumber
        while index < ladderNumber {
            findCorrectCoordinate()
            mark()
            index += 1
        }
    }
    
    private mutating func loopOfPlayerNumberForHeight(_ i : Int) {
        for j in 0..<playerNumber{
            Ladders[i][j*2+1] = Ladder.bar.rawValue
        }
    }
    
    mutating func drawAllHeightLadder() {
        for i in 0..<ladderHeight {
            loopOfPlayerNumberForHeight(i)
        }
    }
    
    private mutating func drawWidthLadder(_ i:Int, _ j:Int) {
        if widthLadderIsExistence[i][j] == true {
            Ladders[i][j*2+2] = Ladder.existStep.rawValue
        }
    }
    
    private mutating func loopOfPlayerNumberForWidth(_ i : Int) {
        for j in 0..<playerNumber-1{
            drawWidthLadder(i,j)
        }
    }
    
    mutating func drawAllWidthLadder() {
        for i in 0..<ladderHeight {
            loopOfPlayerNumberForWidth(i)
        }
    }
    
    init (_ player:Int, _ ladderHeight:Int){
        self.playerNumber = player
        self.ladderHeight = ladderHeight
    }
}



