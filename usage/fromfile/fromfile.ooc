import structs/Array

nagaqueen_parse: extern proto func (String) -> Int

main: func (args: Array<String>) {

    fileName := "example.ooc"
    nagaqueen_parse(fileName)
    
}

nq_onInclude: func (name: String) {
    printf("Got include %s\n", name)
}
