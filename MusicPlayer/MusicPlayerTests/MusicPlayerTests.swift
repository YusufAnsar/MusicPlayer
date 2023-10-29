//
//  MusicPlayerTests.swift
//  MusicPlayerTests
//
//  Created by maple on 29/10/23.
//

import XCTest

final class MusicPlayerTests: XCTestCase {

    private var sut: MusicServiceMock!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of e
        sut = MusicServiceMock()
    }

    override func tearDownWithError() throws {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDataFetching() throws {
        let expectation = expectation(description: "music player")
        wait(for: [expectation], timeout: 10)
        Task(priority: .userInitiated) {
            let result = await sut.getMusicLists()
            expectation.fulfill()
            switch result {
                case .success(let response):
                    XCTAssert(response.count > 0, "No data available")
                case .failure:
                    XCTFail("Error occured")
            }
        }
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
