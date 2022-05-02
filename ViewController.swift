//
//  ViewController.swift
//  readaton
//
//  Created by Bof on 24/03/22.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    //declaring all variables to be received as input
    @IBOutlet var ResultView: UIView!
    @IBOutlet var InitialView: UIScrollView!
    
    @IBOutlet var lineControl: UISegmentedControl!
    
    
    @IBOutlet var titleInserted: UITextField!
    @IBOutlet var genreInserted: UITextField!
    @IBOutlet var namesRemem: UISlider!
    @IBOutlet var eventsRemem: UISlider!
    @IBOutlet var sessionDuration: UIDatePicker!
    @IBOutlet var opinionWritten: UITextView!
    
    var maxLines: Int = 5
    
    @IBOutlet var returnButton: UIButton!
    @IBOutlet var nameResult: UILabel!
    @IBOutlet var durationResult: UILabel!
    @IBOutlet var resultCalc: UILabel!


    @IBAction func clickBack(_ sender: UIButton) {
        let viewToAnimate = InitialView

        UIView.animate(withDuration: 1) {
            viewToAnimate!.alpha = 1
            // if clicar no textview
        }
        
        titleInserted.text = ""
        genreInserted.text = ""
        namesRemem.value = 0
        eventsRemem.value = 0
        // reiniciar datepicker
        opinionWritten.text = ""
    }

    func getTitle() -> String {
        let title: String = titleInserted.text ?? ""
        return title
    }
    
    func getGenre() -> String {
        let genre: String = genreInserted.text ?? ""
        return genre
    }
    
    func getNames() -> Float {
        let names: Float = namesRemem.value
        print("nomes: \(names)")
        return names
    }
    
    func getEvents() -> Float {
        let events: Float = eventsRemem.value
        print("events: \(events)")
        return events
    }
    
    func getDuration() -> Int {
        let hours: Int = Int(sessionDuration.countDownDuration/3600)
        let minutes: Int = (Int(sessionDuration.countDownDuration) - hours*3600)/60
        let duration: Int = Int(sessionDuration.countDownDuration)
        print("horas: ")
        print(hours)
        print("agr minutos:")
        print(minutes)
        print("duration total: \(duration)")
        return hours
    }
    
    func getOpinion() -> Int {
        let opinion:Int = Int(opinionWritten.contentSize.height / (opinionWritten.font!.lineHeight))
        print("linhas: ")
        if opinion == 7 {
                let new_opinion = 0
                return(new_opinion)
        }
        print(opinion)
        return opinion
        // return number of lines written based on opinionWritten
    }
    
    @IBAction func getMax(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                maxLines = 5
            case 1:
                maxLines = 25
            case 2:
                maxLines = 50
            case 3:
                maxLines = 100
            default:
                maxLines = 5
            break
            }
        }
    
    @IBAction func clickGo(_ sender: UIButton) {
        let session: ReadSession
        
        session = ReadSession(getTitle(),getGenre(),getNames(),getEvents(),getDuration(),getOpinion(),maxLines)
        
        resultScreen(session)
    }

    
    func resultScreen(_ session: ReadSession) {
        let viewToAnimate = InitialView

        UIView.animate(withDuration: 1) {
            viewToAnimate!.alpha = 0
        }
        
        ResultView.isHidden = false
        
        nameResult.text = titleInserted.text
        
        let hours: Int = Int(sessionDuration.countDownDuration/3600)
        let minutes: Int = (Int(sessionDuration.countDownDuration) - hours*3600)/60
        
        durationResult.text = "\(hours)h \(minutes)'"
        
        let result: Int = session.absorption()
        
        resultCalc.text = "\(result) % "
    }
}
// print_result => snake case
// printResult => camel case
