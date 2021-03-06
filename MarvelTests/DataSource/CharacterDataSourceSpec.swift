//
//  CharacterDataSourceSpec.swift
//  Marvel
//
//  Created by Albert Arroyo on 5/9/16.
//  Copyright © 2016 AlbertArroyo. All rights reserved.
//

import Nimble
import Quick

@testable import Marvel

class CharacterDataSourceSpec: QuickSpec {
    
    override func spec() {
        
        describe("character data source") {
            
            var charactersData = CharacterDataType()
            let dataSource = CharacterDataSource()
            let dataController = CharactersDataController()
            let tableView = UITableView()
            var numberOfRows : Int!
            var firstCharacter : CharacterModel!
            
            beforeEach({
                waitUntil(timeout: 5, action: { (done) in
                    
                    dataController.loadDataFromServer(
                        success: { (characters) in
                            charactersData = characters
                            firstCharacter = charactersData.characterAtPosition(0)
                            dataSource.dataObject = charactersData
                            numberOfRows = dataSource.tableView(tableView, numberOfRowsInSection: 0)
                            done()
                        }, fail: { (error) in
                            numberOfRows = 0
                            done()
                    })
                })
            })
            
            context("number of rows", {
                it("compare the number of rows, should be 20") {
                    expect(numberOfRows) == 20
                }
            })
            
            context("cell for row", {
                it("first character name should be 3-D Man") {
                    expect(firstCharacter.name) == "3-D Man"
                }
            })
        }
    }
}

