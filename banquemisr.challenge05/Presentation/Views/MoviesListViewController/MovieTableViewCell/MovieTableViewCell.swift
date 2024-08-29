//
//  MovieTableViewCell.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 28/08/2024.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var moviePosterView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }

    private func setupView() {
        moviePosterView.layer.cornerRadius = 10
        moviePosterView.clipsToBounds = true
   
    }
    func setup(with cellViewModel:MoviesCellViewModel){
        self.movieDate.text = cellViewModel.releaseDate
        self.movieTitle.text = cellViewModel.title
        cellViewModel.loadImage(into: moviePosterView)
//        self.moviePosterView.image = UIImage(data: Data(contentsOf: URL(string: "C\(Constants.shared.)")))
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
