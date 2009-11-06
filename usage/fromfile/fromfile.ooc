nagaqueen_parse: extern proto func (String) -> Int

main: func {

    nagaqueen_parse("example.ooc")
    
}

nq_onInclude: func (name: String) {
    printf("Got include %s\n", name)
}
