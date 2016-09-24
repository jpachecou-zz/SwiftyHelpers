# SwiftyHelpers

[![Build Status](https://travis-ci.org/jpachecou/SwiftyHelpers.svg?branch=master)](https://travis-ci.org/jpachecou/SwiftyHelpers)
[![](https://cocoapod-badges.herokuapp.com/v/SwiftyHelpers/badge.png)](https://cocoapods.org/pods/SwiftyHelpers)
![](https://cocoapod-badges.herokuapp.com/p/SwiftyHelpers/badge.png)
![](https://img.shields.io/badge/Swift-3.0-orange.svg)
[![](https://img.shields.io/cocoapods/metrics/doc-percent/SwiftyHelpers.svg)](http://cocoadocs.org/docsets/SwiftyHelpers/0.1.2/)
[![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/jpachecou/SwiftyHelpers/blob/master/LICENSE.md)

SwiftHelpers is focused on making simpler the most tedious and repeating tasks when it comes to developing in Swift

## Requirements

- iOS 8.0+
- XCode 8+

## Installation guide
> Dynamic libraries or those made with Swift, require iOS 8.0+

### CocoaPods
In order to install through [CocoaPods](http://cocoapods.org), just add this line in your podfile:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!
pod 'SwiftyHelpers', '~> 1.0.0'
```
> For swift 2 version, put `pod 'SwiftyHelpers', '~> 0.1.5'`

Next, excute in terminal 


```bash
$ pod install
```

### Manual installation
Just clone the project using this command in terminal:

```bash
$ git clone https://github.com/jpachecou/SwiftyHelpers.git
```

Find a folder named Source and drag onto your project


## How to use SwiftyHelpers
First of all: if you are using CocoaPods, you just need to import `import SwiftyHelpers` module.



  
### Operators and UI functions

- **`UITableView` & `UICollectionView`**

	-In order to make this utility work, there has to be a cell inside of a `.xib`file with the same name of the class that the cell is subclassing. Given the case in a tableView:
	 
	
	```swift
	
	class FooTableViewCell: UITableViewCell {}
	class FooCollectionViewCell: UICollectionViewCell {}
	class FooTableHeaderView: UITableViewHeaderFooterView {}
	class FooCollectionHeaderView: UICollectionReusableView {}
	/*
		+-- FooTableViewCell.swift
		+-- FooTableViewCell.xib
		+-- FooCollectionViewCell.swift
		+-- FooCollectionViewCell.xib
		+-- FooTableHeaderView.swift
		+-- FooTableHeaderView.xib
		+-- FooCollectionHeaderView.swift
		+-- FooCollectionHeaderView.xib
	*/
	```
	
	As soon as class and `.xib` are ready, in order to register cells in a `UITableView` or `UICollectionView`, just invoke the `<=` operator among the tableView/collectionView and the cell.
	
	```swift
	// Register cell in a table view
	self.tableView <= FooTableViewCell.self
	// Register header or footer in a table view
	self.tableView <= FooTableHeaderView.self
	
	// Register cell in collection view
	self.collectionView <= FooCollectionViewCell.self
	// Register header or footer in collection view
	collectionView <= (HeaderCollectionReusableView.self, UICollectionElementKindSectionHeader)
   collectionView <= (FooterCollectionReusableView.self, UICollectionElementKindSectionFooter)
	```
		
	In order to obtain registered cells, just declare an instance of it with its class:
	
	- Get cell of a tableView, example:
	
		```swift
		func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
	   		let cell: FooTableViewCell = tableView.cellForClass()
	   		// configure cell
	   		return cell
	   }
		```
	- Get header or footer of a tableView, example:
	
		```swift
		func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
	   		let cell: FooTableHeaderView = tableView.headerFooterForClass()
	   		// configure cell
	   		return cell
	   }
		```
	- Get cell of a collectionView, example:
	
		```swift
	    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
	        let cell: FooCollectionViewCell = collectionView.cellForClass(indexPath)
	        // Configure cell
	        return cell
	    }
		```
	- Get header or footer of a collection view, example:
		
		```swift
        func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        	if kind == UICollectionElementKindSectionHeader {
            	let header: HeaderCollectionReusableView = collectionView.supplementaryViewForClass(indexPath, kind: kind)
            	// or
            	let header: HeaderCollectionReusableView = headerForClass(indexPath)
            	// Configure hedaer
            	return header
        	}
        	let footer: FooterCollectionReusableView = footerForClass(indexPath)
        	// Configure footer
        	return footer
    	 }
		```
- **`UIView`**

	- Previously to load a nib file, the `UIView` subclass and `.xib` should have equal name in order to instantiate it.
	
		```swift
		class FooView: UIView {} 
		/*
			+-- FooView.swift
			+-- FooView.xib
		*/
		
		guard let fooView: FooView? = loadCustomView() else { return } 
		```
		
	- Removing recursively subViews from `UIView`, simply using the `removeAllSubViews`

	- Public method `getSubviewIntoView` is used recursively in order to get a specific subView, with a concrete class, inside of the `UIView` subviews.
	
		```swift
		let fooSubview: FooView = getSubviewIntoView(self.view)
		```
		This line will locate the first FooView subview inside of all `UIView` array of subviews
		

	
	## License

	SwiftyHelpers is licensed under the MIT-License. See [LICENSE](https://github.com/jpachecou/SwiftyHelpers/blob/master/LICENSE.md) for more details.



