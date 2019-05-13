import Foundation

struct Inputview {
    private var playerNames = [LadderPlayer]()
    private var ladderHeight = 0
    
    mutating func readNames()throws -> [LadderPlayer] {
        let userInput = ask(.nameOfPlayer)
        try checkNumberOfPlayer(userInput)
        try checkNameLengthOfPlayer()
        return playerNames
    }
    
    private func ask(_ massage:Massage)->String?{
        print(massage.rawValue)
        return readLine()
    }
    
    mutating func checkNumberOfPlayer(_ userInput:String?)throws{
        let convertedString = try removerOptionalToString(userInput)
        separateName(convertedString)
        try self.isOverOne(playerNames.count)
    }
    
    mutating func separateName(_ convertedString:String){
        let names = convertedString.components(separatedBy: ",")
        for name in names {
            playerNames.append(LadderPlayer(name: String(name)))
        }
    }
    
    private func removerOptionalToString(_ optionalString:String?)throws -> String{
        if let convertedString = optionalString{
            return convertedString
        }
        throw InputError.isNotString
        
    }
    
    private func isOverOne(_ pram:Int)throws{
        guard pram > 1 else {
            throw InputError.isLessThanOne
        }
    }
    
    func checkNameLengthOfPlayer()throws{
        let maximumplayerNameLength = self.findMaximumPlayerNameLength
        try self.isLessThanFive(maximumplayerNameLength)
    }
    
    private func isLessThanFive(_ MaximumPlayerNameLength:Int)throws{
        guard MaximumPlayerNameLength < 6 else{
            throw InputError.isMoreThanSix
        }
    }
    
    private var findMaximumPlayerNameLength:Int{
        if let maximumplayerName = playerNameLength.max(){
            return maximumplayerName
        }
        return 0
    }
    
    private var playerNameLength : [Int] {
        var playerNameLength = [Int]()
        for i in playerNames {
            playerNameLength.append(i.name.count)
        }
        return playerNameLength
    }
    
    mutating func readLadderHeight()throws -> Int {
        let userInput = ask(.numberOfHeight)
        try checkNumberOfHeight(userInput)
        return ladderHeight
    }
    
    mutating func checkNumberOfHeight(_ userInput:String?)throws{
        let convertedString = try removerOptionalToString(userInput)
        ladderHeight = Int(convertedString) ?? 0
        if ladderHeight == 0 {
            throw InputError.isNotInt
        }
        try self.isOverOne(ladderHeight)
    }
}
