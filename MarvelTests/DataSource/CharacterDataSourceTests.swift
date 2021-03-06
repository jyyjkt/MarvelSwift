//
//  CharacterDataSourceTests.swift
//  Marvel
//
//  Created by Albert Arroyo on 6/9/16.
//  Copyright © 2016 AlbertArroyo. All rights reserved.
//

import XCTest

@testable import Marvel

class CharacterDataSourceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        super.tearDown()
    }
    
    func testGetCharacters() {
        var charactersData : CharacterDataType!
        let dataSource = CharacterDataSource()
        let dataController = CharactersDataController()
        var firstCharacter : CharacterModel!
        var numberOfItems : Int!
        var numberOfRows : Int!
        let tableView = UITableView()
        
        let expectation = self.expectation(description: "Get Characters number of items")
        
        dataController.loadDataFromServer(
            success: { (characters) in
                charactersData = characters
                firstCharacter = charactersData.characterAtPosition(0)
                dataSource.dataObject = charactersData
                numberOfRows = dataSource.tableView(tableView, numberOfRowsInSection: 0)
                numberOfItems = charactersData.numberOfItems
            
                XCTAssertEqual(numberOfItems, 20, "When the WS success, the number of items should be 20")
                XCTAssertEqual(numberOfRows, numberOfItems, "When the WS success, the number of rows should be the number of items")
                XCTAssertEqual(firstCharacter.name, "3-D Man", "When the WS success, the name of the first character should be 3-D Man")
                expectation.fulfill()
            
            }, fail: { (error) in
                numberOfItems = 0
                XCTAssertEqual(numberOfItems, 0, "When the WS fails, the number of items should be 0")
                expectation.fulfill()
        })
        
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                dump("Error: \(error.localizedDescription)")
            }
        }
    }
}


