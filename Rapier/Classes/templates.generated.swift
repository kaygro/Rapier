// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT




//We have["Camera", "Car", "Photographer"]
//annotated types:1
//Camera can inject into: []
import Swinject
open class AppFactory{
	let container: Container
	init(){
		self.container = Container()
        self.container.register(CameraProtocol.self) { r in Camera()}
        self.container.register(CarProtocol.self) { r in Car()}
        self.container.register(PhotographerProtocol.self) { r in Photographer(camera: r.resolve(CameraProtocol.self)!,vehicle: r.resolve(VehicleProtocol.self))}

	}
	
	func make<P>(_ imp: P.Type) -> P{
		return self.container.resolve(P.self)
	}
}


