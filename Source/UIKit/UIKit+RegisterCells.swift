//
//  UIKit+RegisterCells.swift
//  SwiftUtils
//
//  Created by Jonathan Pacheco on 1/19/16.
//  Copyright © 2016 Grability. All rights reserved.
//

import UIKit

internal extension UITableViewCell {
    
    static func registerCellInTableView(tableView: UITableView) {
        let nib = UINib(nibName: self.identifier, bundle: NSBundle(forClass: self))
        tableView.registerNib(nib, forCellReuseIdentifier: self.identifier)
    }
}

internal extension UICollectionViewCell {
    
    static func registerCellInCollectionView(collectionView: UICollectionView) {
        let nib = UINib(nibName: self.identifier, bundle: NSBundle(forClass: self))
        collectionView.registerNib(nib, forCellWithReuseIdentifier: self.identifier)
    }
}

internal extension UICollectionReusableView {
    
    static func registerReusableViewInCollectionView(collectionView: UICollectionView, kind: String) {
        let nib = UINib(nibName: self.identifier, bundle: NSBundle(forClass: self))
        collectionView.registerNib(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: self.identifier)
    }
}

public extension UITableView {
    
    /**
     Obtains the cell registered in the tableView
     
     - parameter cellClass: Class to register in tableView ´TableViewCell.self´
     
     - returns: Registered cell
     */
    public func cellForClass<T: UITableViewCell>() -> T {
        return self.dequeueReusableCellWithIdentifier(T.self.identifier) as! T
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
        return self.dequeueReusableCellWithReuseIdentifier(T.self.identifier, forIndexPath: indexPath) as! T
    }
    
    /**
     Obtains the cell registered in the collectionView
     
     - parameter indexPath: IndexPath of reusable view
     - parameter kind:      UICollectionElementKindSectionHeader - UICollectionElementKindSectionFooter
     
     - returns: Registered reusable view
     */
    public func supplementaryViewForClass<T: UICollectionReusableView>(indexPath: NSIndexPath, kind: String) -> T {
        return self.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: T.self.identifier, forIndexPath: indexPath) as! T
    }

    /**
     Obtains the header registered in the collectionView

     - parameter indexPath: IndexPath of reusable view

     - returns: Registered header reusable view
     */
    public func headerForClass<T: UICollectionReusableView>(indexPath: NSIndexPath) -> T {
        return self.supplementaryViewForClass(indexPath, kind: UICollectionElementKindSectionHeader)
    }

    /**
     Obtains the footer registered in the collectionView

     - parameter indexPath: IndexPath of reusable view

     - returns: Registered footer reusable view
     */
    public func footerForClass<T: UICollectionReusableView>(indexPath: NSIndexPath) -> T {
        return self.supplementaryViewForClass(indexPath, kind: UICollectionElementKindSectionFooter)
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
 - `self.collectionView <= CustomCollectionViewCell.self`
 
 Obtain cell of collectionView
 - `let cell: CustomCollectionViewCell = collectionView.cellForClass(indexPath: indexPath)`
 
 - parameter collectionView: CollectionView to register
 - parameter anyClass:  Class of cell to register
 */
public func <=<T: UICollectionViewCell>(collectionView: UICollectionView, cellClass: T.Type) {
    cellClass.registerCellInCollectionView(collectionView)
}


/**
 Register reusableview in collectionView, the identifier is same that the class name
 
 Register reusable view:
 - `self.collectionView <= (CustomCollectionReusableView.self, UICollectionElementKindSectionHeader)`
 
 Obtain cell of collectionView
 - `let view: CustomCollectionReusableView = collectionView.supplementaryViewForClass(indexPath: indexPath, kind: UICollectionElementKindSectionHeader)`
 
 - parameter collectionView: CollectionView to register
 - parameter cellClass: Class of cell to register and kind identifier
 */
public func <=<T: UICollectionReusableView>(collectionView: UICollectionView, cellClass: (T.Type, String)) {
    cellClass.0.registerReusableViewInCollectionView(collectionView, kind: cellClass.1)
}