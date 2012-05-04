import callbacks

/**
 * Override and implement to be able to react to nagaqueen's parsing events.
 */
OocListener: abstract class {

    tokenPos: Int*

    init: func {}

    parse: func (path: String) {
        nq_parse(this, path)
    }

    /* Uses, imports, includes */

    onUse: func (name: CString) {
        UnsupportedAstElement new(class, "use") throw()
    }

    onInclude: func (name: CString) {
        UnsupportedAstElement new(class, "include") throw()
    }

    onIncludeDefine: func (name, value: CString) {
        UnsupportedAstElement new(class, "include-define") throw()
    }

    onImport: func (path, name: CString) {
        UnsupportedAstElement new(class, "import") throw()
    }

    onImportNamespace: func (namespace: CString, quantity: Int) {
        UnsupportedAstElement new(class, "import-namespace") throw()
    }

    
    /* Versions */

    onVersionName: func (name: CString) -> Object {
        UnsupportedAstElement new(class, "version-name") throw(); null
    }

    onVersionNegation: func (spec: Object) -> Object {
        UnsupportedAstElement new(class, "version-negation") throw(); null
    }

    onVersionAnd: func (specLeft, specRight: Object) -> Object {
        UnsupportedAstElement new(class, "version-and") throw(); null
    }

    onVersionOr: func (specLeft, specRight: Object) -> Object {
        UnsupportedAstElement new(class, "version-or") throw(); null
    }


    onVersionStart: func (spec: Object) {
        UnsupportedAstElement new(class, "version-start") throw()
    }

    onVersionElseIfStart: func (notSpec, elseSpec: Object) -> Object {
        UnsupportedAstElement new(class, "version-elseif") throw(); null
    }

    onVersionElseStart: func (notSpec, elseSpec: Object) -> Object {
        UnsupportedAstElement new(class, "version-else") throw(); null
    }

    onVersionEnd: func -> Object {
        UnsupportedAstElement new(class, "version-end") throw(); null
    }

    /* Extend keyword */

    onExtendStart: func (type: Object, doc: CString) {
         UnsupportedAstElement new(class, "extend-start") throw()
    }

    onExtendEnd: func {
         UnsupportedAstElement new(class, "extend-end") throw()
    }


    /* Covers */

    onCoverStart: func (name, doc: CString) {
         UnsupportedAstElement new(class, "cover-start") throw()
    }

    onCoverExtern: func (externName: CString) {
         UnsupportedAstElement new(class, "cover-extern") throw()
    }

    onCoverFromType: func (type: Object) {
         UnsupportedAstElement new(class, "cover-fromtype") throw()
    }

    onCoverExtends: func (type: Object) {
         UnsupportedAstElement new(class, "cover-extends") throw()
    }

    onCoverImplements: func (type: Object) {
         UnsupportedAstElement new(class, "cover-implements") throw()
    }

    onCoverEnd: func -> Object {
         UnsupportedAstElement new(class, "cover-end") throw()
    }


    /* Enums */

    onEnumStart: func (name, doc: CString) {
         UnsupportedAstElement new(class, "enum-start") throw()
    }

    onEnumEnd: func -> Object {
         UnsupportedAstElement new(class, "enum-end") throw()
    }

    onEnumFromType: func (fromType: Object) {
        UnsupportedAstElement new(class, "enum-fromtype") throw()
    }


    onEnumExtern: func (externName: CString) {
         UnsupportedAstElement new(class, "enum-extern") throw()
    }

    onEnumIncrementExpr: func (oper: Char, step: Object) {
         UnsupportedAstElement new(class, "enum-extern") throw()
    }


    onEnumElementStart: func (name, doc: CString) {
         UnsupportedAstElement new(class, "enum-element-start") throw()
    }

    onEnumElementValue: func (value: Object) {
         UnsupportedAstElement new(class, "enum-element-value") throw()
    }

    onEnumElementExtern: func (externName: CString) {
         UnsupportedAstElement new(class, "enum-element-extern") throw()
    }

    onEnumElementEnd: func {
         UnsupportedAstElement new(class, "enum-element-end") throw()
    }


    /* Classes */

    onClassStart: func (name, doc: CString) {
        UnsupportedAstElement new(class, "class-start") throw()
    }

    onClassBody: func {
        UnsupportedAstElement new(class, "class-body") throw()
    }

    onClassEnd: func -> Object {
        UnsupportedAstElement new(class, "class-end") throw()
    }

    onClassAttribute: func (attr: TypeAttribute, value: Object = null) {
        UnsupportedAstElement new(class, "class-attribute") throw()
    }

    /* Interfaces */

    onInterfaceStart: func {
        UnsupportedAstElement new(class, "interface-start") throw()
    }

    onInterfaceEnd: func -> Object {
        UnsupportedAstElement new(class, "interface-end") throw()
    }


    onInterfaceAttribute: func (attr: TypeAttribute, type: Object) {
        UnsupportedAstElement new(class, "interface-attribute") throw()
    }


    /* Properties */

    onPropertyDeclStart: func (name, doc: CString) {
        UnsupportedAstElement new(class, "property-decl-start") throw()
    }

    onPropertyDeclEnd: func -> Object {
        UnsupportedAstElement new(class, "property-decl-end") throw(); null
    }

    onPropertyDeclType: func (type: Object) {
        UnsupportedAstElement new(class, "property-decl-type") throw()
    }

    onPropertyAttribute: func (attr: FieldAttributes, value: CString = null) {
        UnsupportedAstElement new(class, "property-decl-attribute") throw()
    }


    onPropertyDeclGetterStart: func (doc: CString) {
        UnsupportedAstElement new(class, "property-decl-getter-start") throw()
    }

    onPropertyDeclGetterEnd: func -> Object {
        UnsupportedAstElement new(class, "property-decl-getter-end") throw(); null
    }


    onPropertyDeclSetterStart: func (doc: CString) {
        UnsupportedAstElement new(class, "property-decl-setter-start") throw()
    }

    onPropertyDeclSetterEnd: func -> Object {
        UnsupportedAstElement new(class, "property-decl-setter-end") throw(); null
    }

    onPropertyDeclSetterArgument: func (name: CString, conventional: Bool) {
        UnsupportedAstElement new(class, "property-decl-setter-argument") throw()
    }


    /* Variable declarations */

    onVarDeclStart: func {
        UnsupportedAstElement new(class, "variable-decl-start") throw()
    }

    onVarDeclEnd: func -> Object {
        UnsupportedAstElement new(class, "variable-decl-start") throw(); null
    }


    onVarDeclName: func (name, doc: CString) {
        UnsupportedAstElement new(class, "variable-decl-start") throw()
    }

    onVarDeclTuple: func (tuple: Object) {
        UnsupportedAstElement new(class, "variable-decl-start") throw()
    }

    onVarDeclExpr: func (expr: Object) {
        UnsupportedAstElement new(class, "variable-decl-start") throw()
    }

    onVarDeclType: func (type: Object) {
        UnsupportedAstElement new(class, "variable-decl-start") throw()
    }


    onVarAttribute: func (attr: FieldAttributes, value: CString = null) {
        UnsupportedAstElement new(class, "variable-decl-attribute") throw()
    }


    /* Types */

    onTypeAccess: func (type: Object) -> Object {
        UnsupportedAstElement new(class, "type-access") throw(); null
    }


    onTypeNew: func (name: CString) -> Object {
        UnsupportedAstElement new(class, "type") throw(); null
    }


    onTypePointer: func (type: Object) -> Object {
        UnsupportedAstElement new(class, "type-pointer") throw(); null
    }

    onTypeReference: func (type: Object) -> Object {
        UnsupportedAstElement new(class, "type-reference") throw(); null
    }

    onTypeBrackets: func (type, inner: Object) -> Object {
        UnsupportedAstElement new(class, "type-brackets") throw(); null
    }

    onTypeGenericArgument: func (type: Object, genType: Object) {
        UnsupportedAstElement new(class, "type-generic-argument") throw()
    }


    onTypeList: func -> Object {
        UnsupportedAstElement new(class, "type-list") throw(); null
    }

    onTypeListElement: func (list, elem: Object) -> Object {
        UnsupportedAstElement new(class, "type-list-element") throw(); null
    }


    // FuncType

    onFuncTypeNew: func -> Object {
        UnsupportedAstElement new(class, "func-type") throw(); null
    }

    onFuncTypeGenericArgument: func (type: Object, name: CString) {
         UnsupportedAstElement new(class, "func-type-generic-argument") throw()
    }

    onFuncTypeArgument: func (funcType, argType: Object) {
        UnsupportedAstElement new(class, "func-type-argument") throw()
    }

    onFuncTypeVarArg: func (funcType: Object) {
        UnsupportedAstElement new(class, "func-type-vararg") throw()
    }

    onFuncTypeReturnType: func (funcType, returnType: Object) {
        UnsupportedAstElement new(class, "func-type-return-type") throw()
    }

    /* Operators (minimal because function-related callbacks are re-used for operators) */

    onOperatorStart: func (symbol: CString) {
        UnsupportedAstElement new(class, "op-start") throw()
    }

    onOperatorEnd: func {
        UnsupportedAstElement new(class, "op-end") throw()
    }


    /* Functions */

    onFunctionStart: func (name, doc: CString) {
        UnsupportedAstElement new(class, "function") throw()
    }

    onFunctionEnd: func -> Object {
        UnsupportedAstElement new(class, "function") throw()
    }

    onFunctionBody: func {
        UnsupportedAstElement new(class, "function") throw()
    }


    onFunctionArgsStart: func {
        UnsupportedAstElement new(class, "function") throw()
    }

    onFunctionArgsEnd: func {
        UnsupportedAstElement new(class, "function") throw()
    }


    onTypeArg: func (type: Object) {
        UnsupportedAstElement new(class, "function") throw()
    }

    onArg: func (name: CString, type: FuncArgType) {
        UnsupportedAstElement new(class, "function") throw()
    }

    onFunctionReturnType: func (returnType: Object) {
        UnsupportedAstElement new(class, "function") throw()
    }

    onFunctionAttr: func (f: FuncAttributes, value: CString = null) {
        UnsupportedAstElement new(class, "function") throw()
    }


    /* Function calls */

    onFunctionCallStart: func (name: CString) {
        UnsupportedAstElement new(class, "function-call") throw()
    }

    onFunctionCallEnd: func -> Object {
        UnsupportedAstElement new(class, "function-call") throw()
    }


    onFunctionCallSuffix: func (suffix: CString) {
        UnsupportedAstElement new(class, "function-call") throw()
    }

    onFunctionCallArg: func (arg: Object) {
        UnsupportedAstElement new(class, "function-call") throw()
    }

    onFunctionCallExpr: func (call, expr: Object) {
        UnsupportedAstElement new(class, "function-call-expr") throw()
    }

    onFunctionCallChain: func (expr, call: Object) -> Object {
        UnsupportedAstElement new(class, "function-call") throw(); null
    }

    onFunctionCallCombo: func (call, expr: Object) {
        UnsupportedAstElement new(class, "function-call") throw()
    }


    /* Arrays */

    onArrayLiteralStart: func {
        UnsupportedAstElement new(class, "array-literal") throw()
    }

    onArrayLiteralEnd: func -> Object {
        UnsupportedAstElement new(class, "array-literal") throw(); null
    }


    /* Tuples */

    onTupleStart: func {
        UnsupportedAstElement new(class, "tuple") throw()
    }

    onTupleEnd: func -> Object {
        UnsupportedAstElement new(class, "tuple") throw(); null
    }


    /* Various expressions/statements */

    onRawStringLiteral: func (object: Object) {
        UnsupportedAstElement new(class, "raw string") throw(); null
    }

    onStringLiteral: func (text: CString) -> Object  {
        UnsupportedAstElement new(class, "string") throw(); null
    }

    onCharLiteral: func (value: CString) -> Object {
        UnsupportedAstElement new(class, "char") throw(); null
    }


    onReturn: func (expr: Object) -> Object {
        UnsupportedAstElement new(class, "return") throw(); null
    }

    onBreak: func -> Object {
        UnsupportedAstElement new(class, "break") throw(); null
    }

    onContinue: func -> Object {
        UnsupportedAstElement new(class, "continue") throw(); null
    }


    onVarAccess: func (expr: Object, name: CString) -> Object {
        UnsupportedAstElement new(class, "var-access") throw(); null
    }


    onArrayAccessStart: func (array: Object) {
        UnsupportedAstElement new(class, "array-access") throw()
    }

    onArrayAccessEnd: func -> Object {
        UnsupportedAstElement new(class, "array-access") throw(); null
    }


    onCast: func (expr, type: Object) -> Object {
        UnsupportedAstElement new(class, "cast") throw(); null
    }


    /* Blocks */

    onBlockStart: func {
        UnsupportedAstElement new(class, "block") throw()
    }

    onBlockEnd: func -> Object {
        UnsupportedAstElement new(class, "block") throw(); null
    }


    /* If-else, foreach, while */

    onIfStart: func (condition: Object) {
        UnsupportedAstElement new(class, "if") throw()
    }

    onIfEnd: func -> Object {
        UnsupportedAstElement new(class, "if") throw(); null
    }


    onElseStart: func {
        UnsupportedAstElement new(class, "else") throw()
    }

    onElseEnd: func {
        UnsupportedAstElement new(class, "else") throw()
    }


    onForeachStart: func (decl, collec: Object) {
        UnsupportedAstElement new(class, "foreach") throw()
    }

    onForeachEnd: func -> Object {
        UnsupportedAstElement new(class, "foreach") throw(); null
    }


    onWhileStart: func (condition: Object) {
        UnsupportedAstElement new(class, "while") throw()
    }

    onWhileEnd: func -> Object {
        UnsupportedAstElement new(class, "while") throw(); null
    }


    /* Match */

    onMatchStart: func {
        UnsupportedAstElement new(class, "match") throw()
    }

    onMatchExpr: func (value: Object) {
        UnsupportedAstElement new(class, "match") throw()
    }

    onMatchEnd: func -> Object {
        UnsupportedAstElement new(class, "match") throw(); null
    }


    onCaseStart: func {
        UnsupportedAstElement new(class, "case") throw()
    }

    onCaseExpr: func (value: Object) {
        UnsupportedAstElement new(class, "case") throw()
    }

    onCaseEnd: func {
        UnsupportedAstElement new(class, "case") throw()
    }


    /* Try-catch */

    onTryStart: func {
        UnsupportedAstElement new(class, "try") throw()
    }

    onTryEnd: func -> Object {
        UnsupportedAstElement new(class, "try") throw(); null
    }


    onCatchStart: func {
        UnsupportedAstElement new(class, "catch") throw()
    }

    onCatchExpr: func (value: Object) {
        UnsupportedAstElement new(class, "catch") throw()
    }

    onCatchEnd: func {
        UnsupportedAstElement new(class, "catch") throw()
    }

    onUnOp: func (type: UnOpType, operand: Object) -> Object {
        UnsupportedAstElement new(class, "unary-op") throw(); null
    }

    onBinOp: func (type: BinOpType, left, right: Object) -> Object {
        UnsupportedAstElement new(class, "binary-op") throw(); null
    }

    onTernary: func (condition, ifTrue, ifFalse: Object) -> Object {
        UnsupportedAstElement new(class, "ternary") throw(); null
    }


    onIntLiteral: func (format: IntFormat, value: CString) -> Object {
        UnsupportedAstElement new(class, "int-literal") throw(); null
    }


    onFloatLiteral: func (value: CString) -> Object {
        UnsupportedAstElement new(class, "float-literal") throw(); null
    }

    onBoolLiteral: func (value: Bool) -> Object {
        UnsupportedAstElement new(class, "bool-literal") throw(); null
    }

    onNull: func -> Object {
        UnsupportedAstElement new(class, "null-literal") throw(); null
    }


    onParenthesis: func (inner: Object) -> Object {
        UnsupportedAstElement new(class, "parenthesis") throw(); null
    }


    onGenericArgument: func (name: CString) {
        UnsupportedAstElement new(class, "generic-argument") throw()
    }


    onAddressOf: func (inner: Object) -> Object {
        UnsupportedAstElement new(class, "addressof") throw(); null
    }

    onDereference: func (inner: Object) -> Object {
        UnsupportedAstElement new(class, "dereference") throw(); null
    }


    onStatement: func (statement: Object) {
        UnsupportedAstElement new(class, "statement") throw()
    }

    onError: func (errorID: Int, defaultMessage: String, index: Int) {
        Exception new(class, "Nagaqueen Error #%d" format(errorID) + ", message = " + defaultMessage)
    }


}

/**
 * Attributes of a type (class, cover, interface, enum)
 */
TypeAttribute: enum {
    _abstract, _final, _extends, _implements, _fromType
}

/**
 * Attributes of a field (variable declaration, property)
 */
FieldAttributes: enum {
    _abstract, _final, _const, _static, _unmangled,  _proto, _extern
}

/**
 * Attributes of a function
 */
FuncAttributes: enum {
    _extern, _unmangled, _suffix, _abstract, _thisRef, _const, _static, _inline, _final, _proto, _super
}

/**
 * Type of a function argument: variable argument (ie ...), dotArg (ie .blah), or assignArg (ie =blah)
 */
FuncArgType: enum {
    varArg, dotArg, assArg
}

/**
 * Unary operators
 */
UnOpType: enum {
    not, bNot, uMinus
}

/**
 * Binary operators
 */
BinOpType: enum {
    doubleArrow, equals, notEquals, lessThan, moreThan, cmp, lessThanOrEqual, moreThanOrEqual

    assAnd, assOr, assXor, assRShift, assLShift, assDiv, assMul, assExp, assSub, assAdd, ass

    and, or, bAnd, bOr, bXor, rshift, lshift, div, mul, exp, sub, add, range, mod
}

/**
 * Int literal formats
 */
IntFormat: enum {
    dec, bin, oct, hex
}

/**
 * Exception thrown when a node type
 */
UnsupportedAstElement: class extends Exception {

    init: func (origin: Class, elementName: String) {
        super(origin, "Unsupported ooc AST element '" + elementName + "' used in parsed source code with OocListener " + origin name)
    }

}
