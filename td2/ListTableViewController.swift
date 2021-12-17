//
//  ListTableViewController.swift
//  td2
//
//  Created by Valentin Berthoz on 17/12/2021.
//

import UIKit

class ListTableViewController: UITableViewController {

    @IBOutlet var CategoriesTableView: UITableView!
    var myMovieLists = [MovieList]()
    
    override func viewDidLoad() {
        
        var josee = Movie("Josée, le tigre et les poissons", "desc", "1")
        var oss117_3 = Movie("OSS 117 : Alerte Rouge en Afrique noire", "desc", "2")
        var raya = Movie("Raya et le dernier dragon", "desc", "3")
        var sw = Movie("Rogue One : A Star Wars Story", "desc", "4")
        var arcane = Movie("Arcane", "desc", "5")
        var teampuceau = Movie("40, toujours puceau", "desc", "6")
        
        var films = MovieList()
        films.setCategorie(name: "Films")
        films.addMovie(movie: sw)
        films.addMovie(movie: oss117_3)
        films.addMovie(movie: teampuceau)
        
        var films_animations = MovieList()
        films_animations.setCategorie(name: "Films d'animations")
        films_animations.addMovie(movie: josee)
        films_animations.addMovie(movie: raya)
        
        var series = MovieList()
        series.setCategorie(name: "Séries")
        series.addMovie(movie: arcane)
        
        myMovieLists.append(films)
        myMovieLists.append(films_animations)
        myMovieLists.append(series)
        
        
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myMovieLists.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "nom_categorie", for: indexPath) as! LesCategoriesTableViewCell
        let row = indexPath.row

        cell.nom_categorie.text = myMovieLists[row]._categorie

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "aff_films" {
            let filmsViewController = segue.destination as! ViewController
            let myIndexPath = CategoriesTableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            filmsViewController.myMovie = myMovieLists[row]._movies
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
