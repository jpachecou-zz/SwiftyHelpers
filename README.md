# SwiftyHelpers

[![Build Status](https://travis-ci.org/jpachecou/SwiftyHelpers.svg?branch=master)](https://travis-ci.org/jpachecou/SwiftyHelpers)
[![](https://cocoapod-badges.herokuapp.com/v/SwiftyHelpers/badge.png)](https://cocoapods.org/pods/SwiftyHelpers)
![](https://cocoapod-badges.herokuapp.com/p/SwiftyHelpers/badge.png)
![](https://img.shields.io/badge/Swift-2.1-orange.svg)
[![](https://img.shields.io/cocoapods/metrics/doc-percent/SwiftyHelpers.svg)](http://cocoadocs.org/docsets/SwiftyHelpers/0.0.1/)
[![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/jpachecou/SwiftyHelpers/blob/master/LICENSE.md)

SwiftHelpers is focused on making simpler the most tedious and repeating tasks when it comes to developing in Swift

## Requirements

- iOS 8.0+
- XCode 7.2+

## Installation guide
> Dynamic libraries or those made with Swift, require iOS 8.0+

### CocoaPods
In order to install through [CocoaPods](http://cocoapods.org), just add this line in your podfile:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!
pod 'SwiftyHelpers', '~> 0.0.1'
```

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



### Date operators 

- Adding/substracting days to a `NSDate`

  	```swift
  	// Date: 1/1/2016 00:00:00
  	let testDate = NSDate(timeIntervalSince1970: 1451606400)
  	let addDate = testDate + 1
  	print("addDate = \(addDate)") // Prints: addDate = 2016-01-02 00:00:00 +0000
  	let subtractDate = testDate - 1
  	print("subtractDate = \(subtractDate)") // Prints: subtractDate = 2015-12-31 00:00:00 +0000
  	```
  	
- Checking dates `<`, `>`, `<=`, `>=`, `==`
  
  	```swift
  	// Date: 1/1/2016 00:00:00
 	let testDate = NSDate(timeIntervalSince1970: 1451606400)
  	if NSDate() > testDate {
  		// Checks if now is greater than that testDate
  	}
  	```
- Checking if a given date is between another two dates range `<=>`

  	```swift
  	if NSDate() <=> (lessThanDate, greaterThanDate) {
  		// Checks if a date is within a range of two dates
  	}
  	```
  
### Operators and UI functions

- **`UITableView` & `UICollectionView`**

	-In order to make this utility work, there has to be a cell inside of a `.xib`file with the same name of the class that the cell is subclassing. Given the case in a tableView:
	 
	
	```swift
	
	class FooTableViewCell: UITableViewCell {}
	class FooCollectionViewCell: UICollectionViewCell {}
	/*
		+-- FooTableViewCell.swift
		+-- FooTableViewCell.xib
		+-- FooCollectionViewCell.swift
		+-- FooCollectionViewCell.xib
	*/
	```
	
	As soon as class and `.xib` are ready, in order to register cells in a `UITableView` or `UICollectionView`, just invoke the `<=` operator among the tableView/collectionView and the cell.
	
	```swift
	self.tableView <= FooTableViewCell.self
	self.collectionView <= FooCollectionViewCell.self
	```
		
	In order to obtain registered cells, just declare an instance of it with its class:
	
	- tableView example:
	
		```swift
		func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
	   		let cell: FooTableViewCell = tableView.cellForClass()
	   		// configure cell
	   		return cell
	   }
		```
	- collectionView example:
	
		```swift
	    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
	        let cell: FooCollectionViewCell = collectionView.cellForClass(indexPath)
	        // Configure cell
	        return cell
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
		

	- Use `UIView` and `CGRect` extensions for the getter and setter of a frame attributes
	
		```swift
		let view = UIView()
		// Setters and getters
		view.frame.x = 12
		view.x = 12
		view.y = 34
		view.width = 120
		view.height = 87
		//Only get
		view.midY
		view.maxX
		```
	
	
## License

SwiftyHelpers is licensed under the MIT-License. See [LICENSE](https://github.com/jpachecou/SwiftyHelpers/blob/master/LICENSE.md) for more details.



