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
    
    fileprivate let indexPath = IndexPath(row: 0, section: 0)
    
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
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: flowLayout)
        collectionView.dataSource = self
        flowLayout.headerReferenceSize = CGSize(width: 300, height: 200)
        
        collectionView <= TestCollectionViewCell.self
        collectionView <= (TestCollectionReusableView.self, UICollectionElementKindSectionHeader)
        
        let cell: TestCollectionViewCell = collectionView.cellForClass(self.indexPath)
        let header: TestCollectionReusableView = collectionView.headerForClass(indexPath)
        XCTAssertNotNil(cell, "Cell register cannot be nil")
        XCTAssertNotNil(header, "Header or Footer register cannot be nil")
    }

}

extension UIKit_RegisterCellTest: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 40)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 100, height: 40)
    }

}
