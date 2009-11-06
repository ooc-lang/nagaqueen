instanceof: final func (T: Class) -> Bool {
    return (super ? (super as This instanceof(T)) : false)
}