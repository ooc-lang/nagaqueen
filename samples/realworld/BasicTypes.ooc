/*
isEmpty: func -> Bool { (this == null) || (this[0] == 0) }

startsWith: func(s: String) -> Bool {
    
    if(true) a = 3
        
    a = 2
    
    if(false) a = 2
    
    if (this length() < s length()) return false
    
    for (i: SizeT in 0..s length()) {
        if(this[i] != s[i]) return false
    }
    
    return true
}*/

/*
indexOf: func(c: Char) -> SizeT {
    
    length := length()
    for(i: SizeT in 0..length) {
        if(this[i] == c) {
            return i
        }
    }
    return -1
    
}

trim: func ~space -> This { return trim(' ') }
*/

substring: func ~tillEnd (start: SizeT) -> This {
    len = this length() : SizeT
    
    if(start > len) {
        printf("String.substring~tillEnd: out of bounds: length = %zd, start = %zd\n",
            len, start);
        return null
    }
    
    diff = (len - start) : SizeT
    sub := gc_malloc(diff + 1) as This	
    sub[diff] = '\0'
    memcpy(sub, this as Char* + start, diff)
    return sub
}





