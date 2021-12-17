//
//  ViewController.swift
//  td2
//
//  Created by Baptiste Godard on 30/11/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var lesPhotosDuFun: UITableView!
    @IBOutlet weak var search_movie: UISearchBar!
    
    var myMovie = [Movie]()
    var myFilteredMovie = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        search_movie.delegate = self
        lesPhotosDuFun.dataSource = self
        
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        myFilteredMovie = myMovie.filter({$0._title.lowercased().contains(searchText.lowercased()) || $0._desc.lowercased().contains(searchText.lowercased()) })
        lesPhotosDuFun.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if search_movie.text!.isEmpty {
            
            return myMovie.count
        }
        else {
            
            return myFilteredMovie.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "lacelluledejoline", for: indexPath) as! TableViewCell
        
        if search_movie.text!.isEmpty {
            cell.ltitrelo.text = myMovie[indexPath.row]._title
            cell.ldescriptionlo.text = myMovie[indexPath.row]._desc
            cell.limagelo.image = UIImage(named: myMovie[indexPath.row]._nom_toph)
        }
        else {
            cell.ltitrelo.text = myFilteredMovie[indexPath.row]._title
            cell.ldescriptionlo.text = myFilteredMovie[indexPath.row]._desc
            cell.limagelo.image = UIImage(named: myFilteredMovie[indexPath.row]._nom_toph)
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Find the row of the cell
            let row = indexPath.row
            if search_movie.text!.isEmpty {
                myMovie.remove(at: row)
            }
            else {
                myFilteredMovie.remove(at: row)
            }
            
            lesPhotosDuFun.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            let detailsViewController = segue.destination as! ChaudViewController
            let myIndexPath = lesPhotosDuFun.indexPathForSelectedRow!
            let row = myIndexPath.row
            if search_movie.text!.isEmpty {
                detailsViewController.myMovie = myMovie[row]
            }
            else {
                detailsViewController.myMovie = myFilteredMovie[row]
                
            }
            
        }
    }
    
    
    @IBAction func unwindToMainView(_ unwindSegue: UIStoryboardSegue) {
        let addViewController = unwindSegue.source as! AddViewController
        if unwindSegue.identifier == "cancel" {
            addViewController.dismiss(animated: true, completion: nil)
        }
        if unwindSegue.identifier == "save" {
            if let myTitle = addViewController.myTitle.text, let myDescription = addViewController.myDescription.text {
                let new_data = Movie(myTitle,
                                      myDescription,
                                      String(Int.random(in: 1...7)))
                myMovie.append(new_data)
                lesPhotosDuFun.reloadData()
            }
        }
        // Use data from the view controller which initiated the unwind segue
    }
    
    
    
}
