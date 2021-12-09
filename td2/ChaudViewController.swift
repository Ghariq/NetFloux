//
//  ChaudViewController.swift
//  td2
//
//  Created by Baptiste Godard on 01/12/2021.
//

import UIKit

class ChaudViewController: UIViewController {

    var myMovie: Movie?

    @IBOutlet weak var myDescription: UILabel!
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = myMovie {
            myTitle.text = data._title
            myDescription.text = data._desc
            myImage.image = UIImage(named: data._nom_toph)
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
