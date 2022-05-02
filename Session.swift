//
//  Session.swift
//  readaton
//
//  Created by Bof on 11/04/22.
//

import Foundation

class ReadSession {
    let titleSession: String
    let genreSession: String
    let names: Float
    let events: Float
    let duration: Int
    let opinionLines: Int
    let maxLines: Int
    
    init(_ titleSession: String,_ genreSession: String,_ names: Float,_ events: Float,_ duration: Int,_ opinionLines: Int,_ maxLines: Int) {
        self.titleSession = titleSession
        self.genreSession = genreSession
        self.names = names
        self.events = events
        self.duration = duration + 1
        self.opinionLines = opinionLines
        self.maxLines = maxLines
        
    }
    
    func calcMax() -> Int {
        let perfScore = (100) / duration
        return perfScore
    }
    
    func absorption() -> Int {
        let result: Int = (Int(names*20 + events*30) / duration)
        let percentage: Int = result*100/calcMax()*(opinionLines + 1)/(maxLines + 1)
    // let result:Int = Int((names + events) + 30*Int(opinionLines))/100*Int(duration)
    // takes time in hours and number of lines written in thoughts textfield
    // divides number of lines by time in hours
        return percentage
    }
}
