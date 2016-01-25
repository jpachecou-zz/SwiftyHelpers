# SwiftyHelpers

[![Build Status](https://travis-ci.org/jpachecou/SwiftyHelpers.svg?branch=master)](https://travis-ci.org/jpachecou/SwiftyHelpers)
[![](https://cocoapod-badges.herokuapp.com/v/SwiftyHelpers/badge.png)](https://cocoapods.org/pods/SwiftyHelpers)
![](https://cocoapod-badges.herokuapp.com/p/SwiftyHelpers/badge.png)
![](https://img.shields.io/badge/Swift-2.1-orange.svg)
[![](https://img.shields.io/cocoapods/metrics/doc-percent/SwiftyHelpers.svg)](http://cocoadocs.org/docsets/SwiftyHelpers/0.0.1/)
[![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/jpachecou/SwiftyHelpers/blob/master/LICENSE.md)


SwiftHelpers está enfocado en hacer más sencillas, las tareas más repetitivas que se hacen cuando se programa con Swift.


## Requiere

- iOS 8.0+
- XCode 7.2+

## Instalación

> Las librerías dinamicas o hechas en swift requieren iOS 8.0+

### CocoaPods

Para instalar mediante [CocoaPods](http://cocoapods.org), agregue las siguiente línea a al archivo podfile de su proyecto:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'SwiftyHelpers', '~> 0.0.1'
```
Siguiente ejecute el siguiente comando en la terminal:

```bash
$ pod install
```

### Manual

Clone el proyecto en la ruta que usted prefiera ejecutando el siguiente comando en la terminal:

```bash
$ git clone https://github.com/jpachecou/SwiftyHelpers.git
```
Luego navegue hasta la carpeta Source y arrastrala hasta su proyecto.

## Como usarlo

Si usas SwiftyHelpers con CocoaPods necesitas importar el módulo `import SwiftyHelpers`

### Operadores para fechas

- Agregar o restar días a un `NSDate`

  	```
  	// Date: 1/1/2016 00:00:00
  	let testDate = NSDate(timeIntervalSince1970: 1451606400)
  	let addDate = testDate + 1
  	print("addDate = \(addDate)") // Prints: addDate = 2016-01-02 00:00:00 +0000
  	
  	let subtractDate = testDate - 1
  	print("subtractDate = \(subtractDate)") // Prints: subtractDate = 2015-12-31 00:00:00 +0000
  	```
- Comprobar fechas `<`, `>`, `<=`, `>=`, `==`
  
  	```
  	// Date: 1/1/2016 00:00:00
 	let testDate = NSDate(timeIntervalSince1970: 1451606400)
  	if NSDate() > testDate {
  		// Checks if now is greater than that testDate
  	}
  	```
- Comprobar si una fecha está dentro del rango de otras 2 fechas `<=>`

  	```
  	if NSDate() <=> (lessThanDate, greaterThanDate) {
  		// Checks if a date is within a range of two dates
  	}
  	```
  
### Operadores y funciones para la UI

- **`UITableView` y `UICollectionView`**

	- Para que esto funcione se necesita que haya una celda en un `.xib` con el mismo nombre de la clase que hereda de la celda, en el caso de la tabla por ejemplo:
	
	```
	class FooTableViewCell: UITableViewCell {}
	class FooCollectionViewCell: UICollectionViewCell {}
	/*
		+-- FooTableViewCell.swift
		+-- FooTableViewCell.xib
		+-- FooCollectionViewCell.swift
		+-- FooCollectionViewCell.xib
	*/
	```
	Cuando esté listo la clase y el `.xib`, para registrar celdas en un `UITableView` o en un `UICollectionView` se puede usar el operador `<=`, funciona entre la tabla o colleción y el tipo de celda:
	
	```
	self.tableView <= FooTableViewCell.self
	self.collectionView <= FooCollectionViewCell.self
	```
		
	Para obtener las celdas registradas solo hay que declarar una instancia indicando el tipo de dato.
	
	- Ejemplo de tabla:
	
		```
		func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
	   		let cell: FooTableViewCell = tableView.cellForClass()
	   		// configure cell
	   		return cell
	   }
		```
	- Ejemplo colección:
	
		```
	    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
	        let cell: FooCollectionViewCell = collectionView.cellForClass(indexPath)
	        // Configure cell
	        return cell
	    }
		```
- **`UIView`**

	- Para cargar cualquier nib, es necesario que se cumpla con la condición de que la clase que hereda de `UIView` tenga el mismo nombre que el `.xib` para instanciarlo.
	
		```
		class FooView: UIView {} 
		/*
			+-- FooView.swift
			+-- FooView.xib
		*/
		
		guard let fooView: FooView? = loadCustomView() else { return } 
		```
		
	- Para eliminar todas las subvistas de un `UIView` recurcivamente se puede usar el método `removeAllSubViews`
	
	-  El método público `getSubviewIntoView` se utiliza para buscar un subview de una clase especifica dentro de las subvistas recursivamente de un `UIView`
	
		```
		let fooSubview: FooView = getSubviewIntoView(self.view)
		```
		Esté código encontrará la primera subvista que sea del tipo FooView dentro todas las susvistas de `UIView`

	- Con las extenciones de `UIView` y `CGRect` podemos acceder y setear a los atributos del frame de una vista directamente
	
		```
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
	
	
## Licencia

SwiftyHelpers está publicado bajo la licencia MIT. ver LICENSE para más detalles.



