// Generated using Sourcery 0.13.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT






Car
Event
Phone
Photographer
protocol:Car has imps:0
protocol:Event has imps:0
protocol:Phone has imps:0
protocol:Photographer has imps:0
//We can create["Car", "Phone", "Photographer"]
//We can resolve[]
import Swinject
open class AppFactory{
	let container: Container
	init(){
		self.container = Container()

	}
	
	func make<P>(_ imp: P.Type) -> P{
		return self.container.resolve(P.self)
	}
}


