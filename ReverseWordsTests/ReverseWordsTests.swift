//
//  ReverseWordsTests.swift
//  ReverseWordsTests
//
//  Created by Jevgenijs Jefrosinins on 03/09/2021.
//

import XCTest
@testable import Reverse_words

class ReverseWordsTests: XCTestCase {

    var sut: ReverseWordsModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ReverseWordsModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testStringReverseSingleWordReversing() throws {
        
        // This is an example of a functional test case.
        let singleWordInput1 = "Reverse"
        let expectedSingleWordOutput1 = "esreveR"
        
        let singleWordInput2 = "string"
        let expectedSingleWordOutput2 = "gnirts"
        
        let singleWordInput3 = "force"
        let expectedSingleWordOutput3 = "ecrof"
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(singleWordInput1, sut.reverse(string: expectedSingleWordOutput1))
        XCTAssertEqual(singleWordInput2, sut.reverse(string: expectedSingleWordOutput2))
        XCTAssertEqual(singleWordInput3, sut.reverse(string: expectedSingleWordOutput3))
    }
    
    func testStringReverseMultiWordsReversing() throws {
        
        // This is an example of a functional test case.
        let multiWordsInput1 = "Blackbird singing"
        let expectedMultiWordsOutput1 = "dribkcalB gnignis"
        
        let multiWordsInput2 = "You were only waiting for this moment to arise"
        let expectedMultiWordsOutput2 = "uoY erew ylno gnitiaw rof siht tnemom ot esira"
        
        let multiWordsInput3 = "Take these broken wings and learn to fly"
        let expectedMultiWordsOutput3 = "ekaT eseht nekorb sgniw dna nrael ot ylf"
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(multiWordsInput1, sut.reverse(string: expectedMultiWordsOutput1))
        XCTAssertEqual(multiWordsInput2, sut.reverse(string: expectedMultiWordsOutput2))
        XCTAssertEqual(multiWordsInput3, sut.reverse(string: expectedMultiWordsOutput3))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
