//
//  UIKit+RegisterCells.swift
//  SwiftUtils
//
//  Created by Jonathan Pacheco on 1/19/16.
//  Copyright © 2016 Grability. All rights reserved.
//

import UIKit

public extension UITableView {

    internal func registerCellInTableView<T: UITableViewCell>(_ cellClass: T.Type) {
        let nib = UINib(nibName: _id(T.self), bundle: Bundle(for: T.self))
        self.register(nib, forCellReuseIdentifier: _id(T.self))
    }

    internal func registerHeaderFooterInTableView<T: UITableViewHeaderFooterView>(_ headerClass: T.Type) {
        let nib = UINib(nibName: _id(T.self), bundle: Bundle(for: T.self))
        self.register(nib, forHeaderFooterViewReuseIdentifier: _id(T.self))
    }

    /**
     Obtains the cell registered in the tableView
     
     - returns: Registered cell
     */
    public func cellForClass<T: UITableViewCell>() -> T {
        return self.dequeueReusableCell(withIdentifier: _id(T.self)) as! T
    }

    /**
     Obtains the header registered in the tableView

     - returns: Registered cell
     */
    public func headerFooterForClass<T: UITableViewHeaderFooterView>() -> T {
        return self.dequeueReusableHeaderFooterView(withIdentifier: _id(T.self)) as! T
    }
    
}

public extension UICollectionView {

    internal func registerCellInCollectionView<T: UICollectionViewCell>(_ cellClass: T.Type) {
        let nib = UINib(nibName: _id(T.self), bundle: Bundle(for: T.self))
        self.register(nib, forCellWithReuseIdentifier: _id(T.self))
    }

    internal func registerReusableViewInCollectionView<T: UICollectionReusableView>(_ headerClass: T.Type, kind: String) {
        let nib = UINib(nibName: _id(T.self), bundle: Bundle(for: T.self))
        self.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: _id(T.self))
    }
    /**
     Obtains the cell registered in the collectionView

     - parameter indexPath: IndexPath of cell
     
     - returns: Registered cell
     */
    public func cellForClass<T: UICollectionViewCell>(_ indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: _id(T.self), for: indexPath) as! T
    }
    
    /**
     Obtains the cell registered in the collectionView
     
     - parameter indexPath: IndexPath of reusable view
     - parameter kind:      UICollectionElementKindSectionHeader - UICollectionElementKindSectionFooter
     
     - returns: Registered reusable view
     */
    public func supplementaryViewForClass<T: UICollectionReusableView>(_ indexPath: IndexPath, kind: String) -> T {
        return self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: _id(T.self), for: indexPath) as! T
    }

    /**
     Obtains the header registered in the collectionView

     - parameter indexPath: IndexPath of reusable view

     - returns: Registered header reusable view
     */
    public func headerForClass<T: UICollectionReusableView>(_ indexPath: IndexPath) -> T {
        return self.supplementaryViewForClass(indexPath, kind: UICollectionElementKindSectionHeader)
    }

    /**
     Obtains the footer registered in the collectionView

     - parameter indexPath: IndexPath of reusable view

     - returns: Registered footer reusable view
     */
    public func footerForClass<T: UICollectionReusableView>(_ indexPath: IndexPath) -> T {
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
    tableView.registerCellInTableView(cellClass)
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
public func <=<T: UITableViewHeaderFooterView>(tableView: UITableView, cellClass: T.Type) {
    tableView.registerHeaderFooterInTableView(cellClass)
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
    collectionView.registerCellInCollectionView(cellClass)
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
    collectionView.registerReusableViewInCollectionView(cellClass.0, kind: cellClass.1)
}
