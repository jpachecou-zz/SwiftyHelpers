//
//  UIKit+RegisterCells.swift
//  SwiftUtils
//
//  Created by Jonathan Pacheco on 1/19/16.
//  Copyright © 2016 Grability. All rights reserved.
//

import UIKit

public extension UITableViewCell {
    
    private static func registerCellInTableView(tableView: UITableView) {
        let nib = UINib(nibName: self.identifier, bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: self.identifier)
    }
}

public extension UICollectionViewCell {
    
    private static func registerCellInCollectionView(collectionView: UICollectionView) {
        let nib = UINib(nibName: self.identifier, bundle: nil)
        collectionView.registerNib(nib, forCellWithReuseIdentifier: self.identifier)
    }    
}


public extension UITableView {
    
    /**
     Obtains the cell registered in the tableView
     
     - parameter cellClass: Class to register in tableView ´TableViewCell.self´
     
     - returns: Registered cell
     */
    public func cellForClass(cellClass: AnyClass) -> UITableViewCell? {
        return self.dequeueReusableCellWithIdentifier(identifierFromClass(cellClass))
    }
    
}

public extension UICollectionView {
 
    /**
     Obtains the cell registered in the collectionView
     
     - parameter cellClass: Class to register in collectionView ´CollectionViewCell.self´
     - parameter indexPath: IndexPath of cell
     
     - returns: Registered cell
     */
    public func cellForClass(cellClass: AnyClass, indexPath: NSIndexPath) -> UICollectionViewCell? {
        return self.dequeueReusableCellWithReuseIdentifier(identifierFromClass(cellClass), forIndexPath: indexPath)
    }
    
}

/**
 Register cell in tableview, the identifier is same that the class name
 
 Register cell:
  - `self.tableView <= UITableViewCell.self`
 
 Obtain cell of tableView
  - `let cell = tableView.cellForClass(UITableViewCell.self)`
 
 - parameter tableView: Tableview to register
 - parameter anyClass:  Class of cell to register
 */
public func <=(tableView: UITableView, anyClass: AnyClass) {
    guard let cellClass = anyClass as? UITableViewCell.Type else { return }
    cellClass.registerCellInTableView(tableView)
}

/**
 Register cell in collectionView, the identifier is same that the class name
 
 Register cell:
 - `collectionView <= UICollectionViewCell.self`
 
 Obtain cell of collectionView
 - `let cell = collectionView.cellForClass(UICollectionViewCell.self, indexPath: indexPath)`
 
 - parameter collectionView: CollectionView to register
 - parameter anyClass:  Class of cell to register
 */
public func <=(collectionView: UICollectionView, anyClass: AnyClass) {
    guard let cellClass = anyClass as? UICollectionViewCell.Type else { return }
    cellClass.registerCellInCollectionView(collectionView)
}