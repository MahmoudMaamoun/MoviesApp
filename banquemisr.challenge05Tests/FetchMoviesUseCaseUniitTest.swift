//
//  FetchMoviesUseCaseUniitTest.swift
//  banquemisr.challenge05Tests
//
//  Created by Mahmoud Maamoun on 31/08/2024.
//

import XCTest
@testable import banquemisr_challenge05

final class FetchMoviesUseCaseUniitTest: XCTestCase {

    let mockMovies = [Movie(id: 1, title: "Expandables", releaseDate: "12-2-2017", posterPath: "https://api.themoviedb.org/3/discover.png", overview: nil)]
   
    var repository: MockFtchMoviesRepository!
    var useCase: FetchMoviesUseCase!
    
    class MockFtchMoviesRepository:MoviesRepository {
        
        var moviePage:MoviePage!
        func fetchMovies(category: MovieCategory, page: Int, completion: @escaping (Result<MoviePage, any Error>) -> Void) {
            completion(.success(moviePage))
        }
        
        func fetchMovieDetails(movieId: Int, completion: @escaping (Result<MovieDetails, any Error>) -> Void) {
            return
        }
        
        
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        repository = MockFtchMoviesRepository()
        repository.moviePage = MoviePage(movies: mockMovies, currentPage: 1, totalPages: 1)
        useCase = FetchMoviesUseCase(movieRepository: repository)
    }

    func testFetch_upcommingMoviesList(){
      
        let expectation = self.expectation(description: "Fetch upcoming movies")
        useCase.execute(category: .upComming, page: 1) { result in
            
            switch(result) {
            case .success(let moviesPage):
                XCTAssertEqual(moviesPage.movies.count, 1)
                XCTAssertEqual(moviesPage.movies.first?.title, "Expandables")
                XCTAssertEqual(moviesPage.currentPage, 1)
                XCTAssertEqual(moviesPage.totalPages, 1)
                
            case .failure(let error):
                XCTFail("Excpected succese but got error \(error.localizedDescription)")
                
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil) // Wait for the expectation to be fulfilled
    }
    
    func testFetch_popularMoviesList(){
        let expectation = self.expectation(description: "Fetch popular movies")
        useCase.execute(category: .popular, page: 1) { result in
            
            switch(result) {
            case .success(let moviesPage):
                XCTAssertEqual(moviesPage.movies.count, 1)
                XCTAssertEqual(moviesPage.movies.first?.title, "Expandables")
                XCTAssertEqual(moviesPage.currentPage, 1)
                XCTAssertEqual(moviesPage.totalPages, 1)
                
            case .failure(let error):
                XCTFail("EXcpected succese but got error \(error.localizedDescription)")
                
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil) // Wait for the expectation to be fulfilled
    }
    
    func testFetch_nowplayingMoviesList(){
        
        let expectation = self.expectation(description: "Fetch nowplaying movies")
        useCase.execute(category: .nowPlaying, page: 1) { result in
            
            switch(result) {
            case .success(let moviesPage):
                XCTAssertEqual(moviesPage.movies.count, 1)
                XCTAssertEqual(moviesPage.movies.first?.title, "Expandables")
                XCTAssertEqual(moviesPage.currentPage, 1)
                XCTAssertEqual(moviesPage.totalPages, 1)
                
            case .failure(let error):
                XCTFail("EXcpected succese but got error \(error.localizedDescription)")
                
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil) // Wait for the expectation to be fulfilled
    }
}
