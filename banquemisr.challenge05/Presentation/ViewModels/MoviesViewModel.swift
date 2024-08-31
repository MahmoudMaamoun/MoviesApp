//
//  MoviesViewModel.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Maamoun on 29/08/2024.
//

import Foundation

class MoviesViewModel {
    
    private let fetchMoviesUseCase:FetchMoviesUseCase
    private let category:MovieCategory
    // Observable properties
    var movies: Observable<[MoviesCellViewModel]> = Observable([])
    var error: Observable<Error> = Observable(nil)
    var isLoadingData: Observable<Bool> = Observable(false)
        
    var currentPage: Int = 0
    var totalPages: Int = 1
    
    init(fetchMoviesUseCase: FetchMoviesUseCase,category:MovieCategory) {
        self.fetchMoviesUseCase = fetchMoviesUseCase
        self.category = category
    }
    
    func fetchMovies() {
     
        guard let isLoading = self.isLoadingData.value, !isLoading else {return}
        guard currentPage < totalPages else {return}
        currentPage+=1
        self.isLoadingData.value = true
        
        fetchMoviesUseCase.execute(category:category,page: currentPage) { [weak self] res in
            self?.isLoadingData.value = false
            
            switch res {
            case .success(let newMovies):
                self?.currentPage = newMovies.currentPage
                self?.totalPages = newMovies.totalPages
                self?.movies.value?.append(contentsOf: newMovies.movies.map({MoviesCellViewModel(movie: $0)}))
                return
            case .failure(let err):
                self?.error.value = err
                return
            }
        }
    }
    
    func fetchMovie(for index:Int) -> Movie
    {
        let movieCellVM = movies.value![index]
        return .init(id: movieCellVM.id, title: movieCellVM.title, releaseDate: movieCellVM.releaseDate, posterPath: movieCellVM.posterImage, overview: movieCellVM.overview)
    }
    func numOfRows()->Int {
        guard let count = movies.value?.count else {return 0}
        return count
    }
}
