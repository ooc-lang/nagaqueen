import structs/Array

nq_parse: extern proto func (String) -> Int

main: func (args: Array<String>) {

    fileName := "example.ooc"
    nq_parse(fileName)
    
}

nq_onInclude: func (name: String) {
    printf("Got include %s\n", name)
}
