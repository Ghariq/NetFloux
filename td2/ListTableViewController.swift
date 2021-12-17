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
        
        var josee = Movie("Josée, le tigre et les poissons", "Kumiko, paraplégique depuis l’enfance, vit avec sa grand-mère, qui la sur-protège du monde extérieur. Elle sort peu et s’est créé son propre univers, aidée par la lecture, sa fascination pour la mer et son imagination débordante. Elle demande qu’on l’appelle Josée, du nom d'une jeune héroïne d’un roman de Sagan. Tsuneo, brillant étudiant en biologie marine, aimerait poursuivre ses études au Mexique où il pourrait vivre son rêve, plonger dans les eaux tropicales. Pour cela il lui faut de l’argent et il cherche donc des petits boulots. Un soir, il tombe littéralement sur Josée et la sauve d’une horrible chute. Suite à cette rencontre accidentelle, la grand-mère de Josée engage Tsuneo comme aide-soignant. Josée se révèle autoritaire et têtue, mais Tsunéo est d’une grande patience. Ils apprennent à se connaître et même à s’apprécier. Un jour, il emmène Josée à la mer…", "1")
        var oss117_3 = Movie("OSS 117 : Alerte Rouge en Afrique noire", "1981. Hubert Bonisseur de La Bath, alias OSS 117, est de retour. Pour cette nouvelle mission, plus délicate, plus périlleuse et plus torride que jamais, il est contraint de faire équipe avec un jeune collègue, le prometteur OSS 1001.", "2")
        var raya = Movie("Raya et le dernier dragon", "Il y a de cela fort longtemps, au royaume imaginaire de Kumandra, humains et dragons vivaient en harmonie. Mais un jour, une force maléfique s’abattit sur le royaume et les dragons se sacrifièrent pour sauver l’humanité. Lorsque cette force réapparait cinq siècles plus tard, Raya, une guerrière solitaire, se met en quête du légendaire dernier dragon pour restaurer l’harmonie sur la terre de Kumandra, au sein d’un peuple désormais divisé. Commence pour elle un long voyage au cours duquel elle découvrira qu’il lui faudra bien plus qu’un dragon pour sauver le monde, et que la confiance et l’entraide seront essentiels pour conduire au succès cette périlleuse mission.", "3")
        var sw = Movie("Rogue One : A Star Wars Story", "Situé entre les épisodes III et IV de la saga Star Wars, le film nous entraîne aux côtés d’individus ordinaires qui, pour rester fidèles à leurs valeurs, vont tenter l’impossible au péril de leur vie. Ils n’avaient pas prévu de devenir des héros, mais dans une époque de plus en plus sombre, ils vont devoir dérober les plans de l’Étoile de la Mort, l’arme de destruction ultime de l’Empire.", "4")
        var arcane = Movie("Arcane", "Championnes de leurs villes jumelles et rivales (la huppée Piltover et la sous-terraine Zaun), deux sœurs Vi et Powder se battent dans une guerre où font rage des technologies magiques et des perspectives diamétralement opposées.", "5")
        var teampuceau = Movie("40 ans, toujours puceau", "Le lundi matin, lorsque ses collègues décrivent avec force détails leurs exploits libidineux du week-end, Andy Stitzer, 40 ans, se sent bien penaud, car il est encore puceau. Partagés entre hilarité, incrédulité et consternation, ses amis David, Jay et Cal décident de prendre en main sa tardive initiation : de gré ou de force, Andy va devoir franchi le Rubicon...", "6")
        
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
    
   @IBAction func unwindToMainView(_ unwindSegue: UIStoryboardSegue) {
        let addCateViewController = unwindSegue.source as! AddCateViewController
        if unwindSegue.identifier == "cancel_cate" {
            addCateViewController.dismiss(animated: true, completion: nil)
        }
        if unwindSegue.identifier == "save_cate" {
            if let new_name = addCateViewController.nom_cate.text{
                
                let new_data = MovieList()
                new_data.setCategorie(name: new_name)
                
                myMovieLists.append(new_data)
                CategoriesTableView.reloadData()
            }
        }
        // Use data from the view controller which initiated the unwind segue
    }
}
