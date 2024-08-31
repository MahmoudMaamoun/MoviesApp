//
//  MovieCellViewModelUnitTests.swift
//  banquemisr.challenge05Tests
//
//  Created by Mahmoud Maamoun on 31/08/2024.
//

import XCTest
@testable import banquemisr_challenge05

final class MovieCellViewModelUnitTests: XCTestCase {
    var viewModel:MoviesCellViewModel!
    
    override func setUpWithError() throws {
        
        let movie = Movie(id: 1, title: "Awlad Rezk", releaseDate: "12-05-2024", posterPath:nil , overview: nil)
        viewModel = MoviesCellViewModel(movie: movie)
    }

    func testTitle() {
        XCTAssertEqual(viewModel.title, "Awlad Rezk")
    }

}
