
Int: cover from int {
    
}

String: cover from char* {
    
    length: func -> Int {
        return strlen(this)
    }
    
    length2: extern(strlen) func -> Int
    
}
