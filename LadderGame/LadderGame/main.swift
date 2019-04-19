import Foundation

func main(){
    var isError = false
    repeat{
        do{
            let inputView = InputView()
            let info = try inputView.run()
            
            let game = LadderGame.init(info: info)
            let ladder = game.makeLadder()
            
            let resultView = ResultView(players: info.getPlayers(), ladder: ladder)
            resultView.output()
            isError = false
        }
        catch let error as ErrorType{
            alertErrorMessage(type: error)
            isError = true
        }catch{
            alertErrorMessage()
            isError = true
        }
    }while isError
}

main()
