//
//  UIKit+RegisterCells.swift
//  SwiftUtils
//
//  Created by Jonathan Pacheco on 1/19/16.
//  Copyright © 2016 Grability. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    private static func registerCellInTableView(tableView: UITableView) {
        let nib = UINib(nibName: self.identifier, bundle: NSBundle(forClass: self))
        tableView.registerNib(nib, forCellReuseIdentifier: self.identifier)
    }
}

extension UICollectionViewCell {
    
    private static func registerCellInCollectionView(collectionView: UICollectionView) {
        let nib = UINib(nibName: self.identifier, bundle: NSBundle(forClass: self))
        collectionView.registerNib(nib, forCellWithReuseIdentifier: self.identifier)
    }    
}


public extension UITableView {
    
    /**
     Obtains the cell registered in the tableView
     
     - parameter cellClass: Class to register in tableView ´TableViewCell.self´
     
     - returns: Registered cell
     */
    public func cellForClass<T: UITableViewCell>() -> T {
        return self.dequeueReusableCellWithIdentifier(identifierFromClass(T.self)) as! T
    }
    
}

public extension UICollectionView {
 
    /**
     Obtains the cell registered in the collectionView
     
     - parameter cellClass: Class to register in collectionView ´CollectionViewCell.self´
     - parameter indexPath: IndexPath of cell
     
     - returns: Registered cell
     */
    public func cellForClass<T: UICollectionViewCell>(indexPath: NSIndexPath) -> T {
        return self.dequeueReusableCellWithReuseIdentifier(identifierFromClass(T.self), forIndexPath: indexPath) as! T
    }
    
}

/**
 Register cell in tableview, the identifier is same that the class name
 
 Register cell:
  - `self.tableView <= CustomTableViewCell.self`
 
 Obtain cell of tableView
  - `let cell: CustomTableViewCell = tableView.cellForClass()`
 
 - parameter tableView: Tableview to register
 - parameter anyClass:  Class of cell to register
 */
public func <=<T: UITableViewCell>(tableView: UITableView, cellClass: T.Type) {
    cellClass.registerCellInTableView(tableView)
}

/**
 Register cell in collectionView, the identifier is same that the class name
 
 Register cell:
 - `collectionView <= CustomCollectionViewCell.self`
 
 Obtain cell of collectionView
 - `let cell: CustomCollectionViewCell = collectionView.cellForClass(indexPath: indexPath)`
 
 - parameter collectionView: CollectionView to register
 - parameter anyClass:  Class of cell to register
 */
public func <=<T: UICollectionViewCell>(collectionView: UICollectionView, cellClass: T.Type) {
    cellClass.registerCellInCollectionView(collectionView)
}