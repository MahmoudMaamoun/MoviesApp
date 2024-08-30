//
//  MoviesDetailsViewController.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 30/08/2024.
//

import UIKit

class MoviesDetailsViewController: UIViewController {

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var releasedDate: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var generes: UILabel!
    @IBOutlet weak var runtime: UILabel!
    @IBOutlet weak var adult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        overview.text = " Do any additional setup after loading the view.  Do any additional setup after loading the view.  Do any additional setup after loading the view.  Do any additional setup after loading the view.  Do any additional setup after loading the view.  Do any additional setup after loading the view.  Do any additional setup after loading the view. "
        
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
