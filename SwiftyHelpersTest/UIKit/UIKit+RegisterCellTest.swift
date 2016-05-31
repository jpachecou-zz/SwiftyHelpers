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
        tableView <= TestTableViewHeaderFooterView.self
        
        let cell: TestTableViewCell = tableView.cellForClass()
        let header: TestTableViewHeaderFooterView = tableView.headerFooterForClass()
        XCTAssertNotNil(cell, "Cell register cannot be nil")
        XCTAssertNotNil(header, "Header or Footer register cannot be nil")
    }
    
    func testRegisterCollectionViewCell() {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRectMake(0, 0, 100, 100), collectionViewLayout: flowLayout)
        collectionView.dataSource = self
        flowLayout.headerReferenceSize = CGSizeMake(300, 200)
        
        collectionView <= TestCollectionViewCell.self
        collectionView <= (TestCollectionReusableView.self, UICollectionElementKindSectionHeader)
        
        let cell: TestCollectionViewCell = collectionView.cellForClass(self.indexPath)
        let header: TestCollectionReusableView = collectionView.headerForClass(indexPath)
        XCTAssertNotNil(cell, "Cell register cannot be nil")
        XCTAssertNotNil(header, "Header or Footer register cannot be nil")
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

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 100, height: 40)
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 100, height: 40)
    }

}