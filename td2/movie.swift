//
//  model.swift
//  td2
//
//  Created by Baptiste Godard on 30/11/2021.
//

import Foundation

class Movie {
    var _title = ""
    var _desc = ""
    var _nom_toph = ""
    var _vu = false
    var _date : Date?
    
    init(_ title : String,_ desc : String,_ nom_toph:String) {
        _title=title
        _desc=desc
        _nom_toph=nom_toph
    }
    
    func changeVu() {
        _vu = !_vu
        if (_vu){
            setDate()
        } else {
            resetDate()
        }
    }
    
    func setDate(){
        _date = Date()
    }
    
    func resetDate() {
        _date=nil
    }
    
    func dateToString() -> String {
        let french       = DateFormatter()
        french.dateStyle = .medium
        french.timeStyle = .medium
        french.locale    = Locale(identifier: "FR-fr")
        if _date != nil {
            return (french.string(from: _date!))
        }
        else {
            return ""
        }
    }
}

class MovieList {
    var _movies : [Movie] = []
    var _categorie = ""
    
    func addMovie(movie : Movie){
        _movies.append(movie)
    }
    
    func setCategorie(name : String) {
        _categorie = name
    }
    
    //yiefggviuzdgvziuvfgbziu
}
