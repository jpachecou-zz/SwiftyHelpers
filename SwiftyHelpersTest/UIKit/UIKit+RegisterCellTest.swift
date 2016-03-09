//
//  UIKit+RegisterCellTest.swift
//  SwiftUtils
//
//  Created by Jonathan Pacheco on 1/19/16.
//  Copyright © 2016 Grability. All rights reserved.
//

import XCTest
@testable import SwiftyHelpers

class UIKit_RegisterCellTest: XCTestCase {
    
    private let indexPath = NSIndexPath(forRow: 0, inSection: 0)
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRegisterTableViewCell() {
        
        let tableView = UITableView()
        tableView <= TestTableViewCell.self
        
        let cell: TestTableViewCell = tableView.cellForClass()
        XCTAssertNotNil(cell, "Cell register cannot be nil")
    }
    
    func testRegisterCollectionViewCell() {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRectMake(0, 0, 100, 100), collectionViewLayout: flowLayout)
        collectionView.dataSource = self
        
        collectionView <= TestCollectionViewCell.self
        let cell: TestCollectionViewCell = collectionView.cellForClass(self.indexPath)
        XCTAssertNotNil(cell, "Cell register cannot be nil")
    }

}

extension UIKit_RegisterCellTest: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}