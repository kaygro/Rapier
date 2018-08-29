// Generated using Sourcery 0.14.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT





//protocol:CameraProtocol has imps:1
//protocol:CarProtocol has imps:1
//protocol:PhotographerProtocol has imps:1
//We can create["Car", "Phone", "Photographer"]
//We can resolve["CameraProtocol", "CarProtocol", "PhotographerProtocol"]
import Swinject
open class AppFactory{
	let container: Container
	init(){
		self.container = Container()
        self.container.register(CameraProtocol.self) { r in Phone()}
        self.container.register(CarProtocol.self) { r in Car()}
        self.container.register(PhotographerProtocol.self) { r in Photographer(camera: r.resolve(CameraProtocol.self)!,car: r.resolve(CarProtocol.self)!)}

	}
	
	func make<P>(_ imp: P.Type) -> P{
		return self.container.resolve(P.self)!
	}
}


