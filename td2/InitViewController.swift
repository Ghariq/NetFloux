//
//  InitViewController.swift
//  td2
//
//  Created by Baptiste Godard on 09/12/2021.
//

import UIKit

class InitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        sleep(2)
        
       /* let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController

        self.navigationController?.pushViewController(secondViewController, animated: true)
        */
        let secondViewController = ViewController(nibName: "ListViewController", bundle: nil)
        self.presentViewController(secondViewController, animated: true, completion: nil)
    }
    
}


