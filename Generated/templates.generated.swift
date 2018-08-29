// Generated using Sourcery 0.14.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT






//protocol:Assembly has imps:0
//protocol:AssemblyType has imps:0
//protocol:Behavior has imps:0
//protocol:DebugHelper has imps:1
//protocol:InstanceStorage has imps:5
//protocol:InstanceWrapper has imps:3
//protocol:ObjectScopeProtocol has imps:1
//protocol:Resolver has imps:2
//protocol:ResolverType has imps:0
//protocol:ServiceEntryProtocol has imps:1
//protocol:ServiceKeyOption has imps:0
//protocol:ServiceKeyOptionType has imps:0
//protocol:_Resolver has imps:2
//We can create[]
//We can resolve["DebugHelper", "ObjectScopeProtocol", "ServiceEntryProtocol"]
import Swinject
open class AppFactory{
	let container: Container
	init(){
		self.container = Container()
        self.container.register(DebugHelper.self) { r in LoggingDebugHelper()}
        self.container.register(ObjectScopeProtocol.self) { r in ObjectScope()}
        self.container.register(ServiceEntryProtocol.self) { r in ServiceEntry()}

	}
	
	func make<P>(_ imp: P.Type) -> P{
		return self.container.resolve(P.self)!
	}
}


