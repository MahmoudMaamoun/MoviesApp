//
//  FetchMovieDetailsUseCaseUnitTest.swift
//  banquemisr.challenge05Tests
//
//  Created by Mahmoud Maamoun on 31/08/2024.
//

import XCTest
@testable import banquemisr_challenge05

final class FetchMovieDetailsUseCaseUnitTest: XCTestCase {
    let mockMovie = Movie(id: 1, title: "Expandables", releaseDate: "12-2-2017", posterPath: "https://api.themoviedb.org/3/discover.png", overview: "Lorem Ipsum..")
    
    lazy var mockMovieDetails = MovieDetails(with: mockMovie)
    
    var repository: MockFetchMoviesRepository!
    var useCase: FetchMovieDetailsUseCase!
    
    class MockFetchMoviesRepository:MoviesRepository {
        
        var movieDetails:MovieDetails!
        func fetchMovies(category: MovieCategory, page: Int, completion: @escaping (Result<MoviePage, any Error>) -> Void) {
            return
        }
        
        func fetchMovieDetails(movieId: Int, completion: @escaping (Result<MovieDetails, any Error>) -> Void) {
            completion(.success(movieDetails))
        }
        
        
    }
    override func setUpWithError() throws {
        repository = MockFetchMoviesRepository()
        mockMovieDetails.adult = true
        mockMovieDetails.genres  = ["Action","Drama","Romantic"]
        mockMovieDetails.runtime = 120
        repository.movieDetails = mockMovieDetails
        
        useCase = FetchMovieDetailsUseCase(moviesRepositiory: repository)
        
    }

    func testFetchMovieDetails() {
        let expectation = self.expectation(description: "Fetch movie Details")
        useCase.excute(movieId: 1) { result in
            switch result {
            case .success(let movieDetails):
                XCTAssertEqual(movieDetails.title, "Expandables")
                XCTAssertEqual(movieDetails.adult, true)
                XCTAssertEqual(movieDetails.genres, ["Action","Drama","Romantic"])
                XCTAssertEqual(movieDetails.overview, "Lorem Ipsum..")
                XCTAssertEqual(movieDetails.runtime, 120)
          case .failure(let err):
                XCTFail("Excpected succese but got error \(err.localizedDescription)")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil) // Wait for the expectation to be fulfilled
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
