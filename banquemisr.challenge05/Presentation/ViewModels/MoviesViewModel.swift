//
//  MoviesViewModel.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 29/08/2024.
//

import Foundation

class MoviesViewModel {
    
    private let moviesRepository:MoviesRepository
    // Observable properties
    var movies: Observable<[MoviesCellViewModel]> = Observable([])
    var error: Observable<Error> = Observable(nil)
    var isLoadingData: Observable<Bool> = Observable(false)
        
    var currentPage: Int = 1
    var totalPages: Int = 1
    
    init(moviesRepository: MoviesRepository) {
        self.moviesRepository = moviesRepository
    }
    
    func fetchMovies() {
     
        guard let isLoading = self.isLoadingData.value, !isLoading else {return}
        self.isLoadingData.value = true
        
        moviesRepository.fetchMovies(type: "") { [weak self] res in
            self?.isLoadingData.value = false
            
            switch res {
            case .success(let newMovies):
                self?.movies.value?.append(contentsOf: newMovies.map({MoviesCellViewModel(movie: $0)}))
                return
            case .failure(let err):
                self?.error.value = err
                return
            }
        }
    }
    
    func numOfRows()->Int {
        guard let count = movies.value?.count else {return 0}
        return count
    }
}
