/**
 * objects
 */
Class: abstract class {
		
	instanceof: final func (T: Class) -> Bool {
		if(this == T) return true
        return (super ? super as This instanceof(T) : false)
	}
	
	// workaround needed to avoid C circular dependency with _ObjectClass
	//__defaults__: static Func (Class)
	//__destroy__: static Func (Class)
	//__load__: static Func
	
}