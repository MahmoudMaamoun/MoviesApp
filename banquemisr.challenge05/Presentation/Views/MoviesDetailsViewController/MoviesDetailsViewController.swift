//
//  MoviesDetailsViewController.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 30/08/2024.
//

import UIKit

class MoviesDetailsViewController: UIViewController {

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var releasedDate: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var generes: UILabel!
    @IBOutlet weak var runtime: UILabel!
    @IBOutlet weak var adult: UILabel!
    @IBOutlet weak var activityIndecator: UIActivityIndicatorView!

    var movieId:Int!
    var initialMovie:Movie!
    private var movieDetailsViewModel:MovieDetailViewModel!
    private let apiClient = APIClient()
    private lazy var moviesRepo = MoviesDataRepositoriy(apiClient: apiClient)
    private lazy var fetchMovieDetailsUseCase = FetchMovieDetailsUseCase(moviesRepositiory: moviesRepo)

    init(movie:Movie) {
        self.movieId = movie.id
        self.initialMovie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        movieDetailsViewModel = MovieDetailViewModel(fetchMovieDetailsUseCase: fetchMovieDetailsUseCase, movie: initialMovie)
        movieDetailsViewModel.fetchMovieDetails(movieId: movieId)
        bindToModel()
    }
    private func bindToModel() {
        movieDetailsViewModel.isLoading.bind {[weak self] loading in
            if let self = self , let isLoading = loading {
                if isLoading {
                    DispatchQueue.main.async {
                        self.activityIndecator.startAnimating()
                    }
                } else {
                    DispatchQueue.main.async {
                        self.activityIndecator.stopAnimating()
                    }
                }
            }
        }
        
        movieDetailsViewModel.movie.bind { [weak self] movieDetails in
            if let self = self ,let movie = movieDetails {
                DispatchQueue.main.async {
                    self.updateUI(with: movie!)
                }
            }
           
        }
        movieDetailsViewModel.error.bind { [weak self] error in
            if let self = self, let error = error {
                self.showErrorAlert(with: error!.localizedDescription)
            }
        }
    }
    private func updateUI(with details:MovieDetails) {
        self.movieTitle.text = details.title
        self.overview.text = details.overview
        self.releasedDate.text = details.releaseDate
        if let vote_count = details.vote_count, let vote_average = details.vote_average {
            self.ratingLabel.text = "\(vote_average) / \(vote_count) vote"
        }
        if let genres = details.genres {
            self.generes.text = genres.joined(separator: " | ")
        }
        if let adult = details.adult {
            self.adult.text = "Adult (Yes)"
        }
        if let runtime = details.runtime {
            self.runtime.text = movieDetailsViewModel.convertMinutesToHoursAndMinutes(minutes:runtime)
        }
        if let posterPath = details.posterPath {
            movieDetailsViewModel.loadImage(for: posterPath) { [weak self] imgData in
                if let data = imgData {
                    self?.posterImage.image = UIImage(data: data)
                }
            }
        }
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
