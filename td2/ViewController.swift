//
//  ViewController.swift
//  td2
//
//  Created by Baptiste Godard on 30/11/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var lesPhotosDuFun: UITableView!
    
    var myMovie = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lesPhotosDuFun.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myMovie.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "lacelluledejoline", for: indexPath) as! TableViewCell
        
        cell.ltitrelo.text = myMovie[indexPath.row]._title
        cell.ldescriptionlo.text = myMovie[indexPath.row]._desc
        cell.limagelo.image = UIImage(named: myMovie[indexPath.row]._nom_toph)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Find the row of the cell
            let row = indexPath.row
            myMovie.remove(at: row)
            lesPhotosDuFun.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            let detailsViewController = segue.destination as! ChaudViewController
            let myIndexPath = lesPhotosDuFun.indexPathForSelectedRow!
            let row = myIndexPath.row
            detailsViewController.myMovie = myMovie[row]
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
