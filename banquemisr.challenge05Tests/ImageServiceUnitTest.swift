//
//  ImageServiceUnitTest.swift
//  banquemisr.challenge05Tests
//
//  Created by Mahmoud Maamoun on 31/08/2024.
//

import XCTest
@testable import banquemisr_challenge05

final class ImageServiceUnitTest: XCTestCase {
    var imageService: ImageService!
    
    
    override func setUpWithError() throws {
        super.setUp()
        imageService = ImageService.shared
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        imageService.imageCache.removeAllObjects()
    }
    
    func testLoadImage_CacheImage(){
        let imageId = "/stKGOm8UyhuLPR9sZLjs5AkmncA.jpg"
       
        let expectation = self.expectation(description: "Image loaded and cached")
        
        imageService.loadImage(from: imageId) { data in
            XCTAssertNotNil(data, "Expected Data")
            
            if let data = data, let image = UIImage(data: data) {
                XCTAssertNotNil(image,"Expected Valid Image Data")
            }
            else {
                XCTFail("Data is not valid image data")
            }
            let cacheKey = NSString(string: imageId)
            let cachedImage = self.imageService.imageCache.object(forKey: cacheKey)
            XCTAssertNotNil(cachedImage, "Image should be cached")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
