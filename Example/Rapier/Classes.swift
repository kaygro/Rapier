//
//  Classes.swift
//  DependencyTest
//
//  Created by Kay Großblotekamp on 18.08.18.
//  Copyright © 2018 self. All rights reserved.
//

import Foundation
import UIKit



protocol CameraProtocol{
	func takePhoto() -> UIImage
}

//sourcery:dependencies
class Phone: CameraProtocol{
	func takePhoto() -> UIImage {
		print("Click: Phone")
		return UIImage()
	}


}


struct Event{}

protocol CarProtocol{}

//sourcery:dependencies
class Car: CarProtocol{

}

protocol PhotographerProtocol {
	func visit(Event: Event)
	func takePictures()->[UIImage]
}

//sourcery:dependencies = [CameraProtocol,CarProtocol]
class Photographer: PhotographerProtocol{
	func visit(Event: Event) {
		print("Going by \(car)")
	}
	
	func takePictures() -> [UIImage] {
		return [self.camera.takePhoto()]
	}

}
