import nagaqueen/OocListener

MyListener: class extends OocListener {

    parse: func (path: String) {
        try {
            super(path)
        } catch (e: Exception) {
            e print()
        }
    }

}


main: func (argc: Int, argv: CString*) {

    if(argc > 1) {
        "Parsing %s" printfln(argv[1])
        MyListener new() parse(argv[1] toString())
    }
    
}
