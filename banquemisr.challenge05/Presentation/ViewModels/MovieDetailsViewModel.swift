//
//  MovieDetailsViewModel.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 30/08/2024.
//

import Foundation

class MovieDetailViewModel {
    
    private let fetchMovieDetailsUseCase: FetchMovieDetailsUseCase
    var movie: Observable<MovieDetails?> = Observable(nil)
    var error: Observable<Error?> = Observable(nil)
    var isLoading: Observable<Bool> = Observable(false)
    private let imageService: ImageServicesProtocol
    
    init(fetchMovieDetailsUseCase: FetchMovieDetailsUseCase,movie:Movie? = nil) {
        self.fetchMovieDetailsUseCase = fetchMovieDetailsUseCase
        if let initialMovie = movie {
            self.movie.value = MovieDetails(with: initialMovie)
        }
        self.imageService = ImageService.shared
    }

    func fetchMovieDetails(movieId: Int) {
        isLoading.value = true
        fetchMovieDetailsUseCase.excute(movieId: movieId) { [weak self] result in
            self?.isLoading.value = false
            switch result {
            case .success(let movie):
                self?.movie.value = movie
            case .failure(let error):
                self?.error.value = error
            }
        }
    }
    func convertMinutesToHoursAndMinutes(minutes: Int) -> String {
        let hours = minutes / 60
        let remainingMinutes = minutes % 60
        return "\(hours)h \(remainingMinutes)m"
    }
    func loadImage(for posterPath: String, completion: @escaping (Data?) -> Void) {
        imageService.loadImage(from: posterPath, completion: completion)
    }
}
