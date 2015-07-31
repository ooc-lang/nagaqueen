import callbacks

/**
 * Override and implement to be able to react to nagaqueen's parsing events.
 */
OocListener: abstract class {

    tokenPosPointer: Int*
    lineNoPointer: Int*

    init: func {}

    parse: func (path: String) {
        nq_parse(this, path)
    }

    /**
     * Override & return false to ignore unhandled AST elements
     */
    strict?: func -> Bool {
        true
    }

    /* Uses, imports, includes */

    onUse: func (name: CString) {
        UnsupportedAstElement new(this, "use") enact()
    }

    onInclude: func (name: CString) {
        UnsupportedAstElement new(this, "include") enact()
    }

    onIncludeDefine: func (name, value: CString) {
        UnsupportedAstElement new(this, "include-define") enact()
    }

    onImport: func (path, name: CString) {
        UnsupportedAstElement new(this, "import") enact()
    }

    onImportNamespace: func (namespace: CString, quantity: Int) {
        UnsupportedAstElement new(this, "import-namespace") enact()
    }

    
    /* Versions */

    onVersionName: func (name: CString) -> Object {
        UnsupportedAstElement new(this, "version-name") enact(); null
    }

    onVersionNegation: func (spec: Object) -> Object {
        UnsupportedAstElement new(this, "version-negation") enact(); null
    }

    onVersionAnd: func (specLeft, specRight: Object) -> Object {
        UnsupportedAstElement new(this, "version-and") enact(); null
    }

    onVersionOr: func (specLeft, specRight: Object) -> Object {
        UnsupportedAstElement new(this, "version-or") enact(); null
    }


    onVersionStart: func (spec: Object) {
        UnsupportedAstElement new(this, "version-start") enact()
    }

    onVersionElseIfStart: func (notSpec, elseSpec: Object) -> Object {
        UnsupportedAstElement new(this, "version-elseif") enact(); null
    }

    onVersionElseStart: func (notSpec, elseSpec: Object) -> Object {
        UnsupportedAstElement new(this, "version-else") enact(); null
    }

    onVersionEnd: func -> Object {
        UnsupportedAstElement new(this, "version-end") enact(); null
    }

    /* Extend keyword */

    onExtendStart: func (type: Object, doc: CString) {
         UnsupportedAstElement new(this, "extend-start") enact()
    }

    onExtendEnd: func {
         UnsupportedAstElement new(this, "extend-end") enact()
    }

    /* Templates */

    onTemplateStart: func {
         UnsupportedAstElement new(this, "template-start") enact()
    }

    onTemplateEnd: func {
         UnsupportedAstElement new(this, "template-end") enact()
    }

    /* Covers */

    onCoverStart: func (name, doc: CString) {
         UnsupportedAstElement new(this, "cover-start") enact()
    }

    onCoverExtern: func (externName: CString) {
         UnsupportedAstElement new(this, "cover-extern") enact()
    }

    onCoverProto: func {
         UnsupportedAstElement new(this, "cover-proto") enact()
    }

    onCoverFromType: func (type: Object) {
         UnsupportedAstElement new(this, "cover-fromtype") enact()
    }

    onCoverExtends: func (type: Object) {
         UnsupportedAstElement new(this, "cover-extends") enact()
    }

    onCoverImplements: func (type: Object) {
         UnsupportedAstElement new(this, "cover-implements") enact()
    }

    onCoverEnd: func -> Object {
         UnsupportedAstElement new(this, "cover-end") enact()
    }


    /* Enums */

    onEnumStart: func (name, doc: CString) {
         UnsupportedAstElement new(this, "enum-start") enact()
    }

    onEnumEnd: func -> Object {
         UnsupportedAstElement new(this, "enum-end") enact()
    }

    onEnumFromType: func (fromType: Object) {
        UnsupportedAstElement new(this, "enum-fromtype") enact()
    }

    onEnumIncrementExpr: func (oper: Char, step: Object) {
         UnsupportedAstElement new(this, "enum-extern") enact()
    }


    onEnumElementStart: func (name, doc: CString) {
         UnsupportedAstElement new(this, "enum-element-start") enact()
    }

    onEnumElementValue: func (value: Object) {
         UnsupportedAstElement new(this, "enum-element-value") enact()
    }

    onEnumElementExtern: func (externName: CString) {
         UnsupportedAstElement new(this, "enum-element-extern") enact()
    }

    onEnumElementEnd: func {
         UnsupportedAstElement new(this, "enum-element-end") enact()
    }


    /* Classes */

    onClassStart: func (name, doc: CString) {
        UnsupportedAstElement new(this, "class-start") enact()
    }

    onClassBody: func {
        UnsupportedAstElement new(this, "class-body") enact()
    }

    onClassEnd: func -> Object {
        UnsupportedAstElement new(this, "class-end") enact()
    }

    onClassAttribute: func (attr: TypeAttribute, value: Object = null) {
        UnsupportedAstElement new(this, "class-attribute") enact()
    }

    /* Interfaces */

    onInterfaceStart: func {
        UnsupportedAstElement new(this, "interface-start") enact()
    }

    onInterfaceEnd: func -> Object {
        UnsupportedAstElement new(this, "interface-end") enact()
    }


    onInterfaceAttribute: func (attr: TypeAttribute, type: Object) {
        UnsupportedAstElement new(this, "interface-attribute") enact()
    }


    /* Properties */

    onPropertyDeclStart: func (name, doc: CString) {
        UnsupportedAstElement new(this, "property-decl-start") enact()
    }

    onPropertyDeclEnd: func -> Object {
        UnsupportedAstElement new(this, "property-decl-end") enact(); null
    }

    onPropertyDeclType: func (type: Object) {
        UnsupportedAstElement new(this, "property-decl-type") enact()
    }

    onPropertyAttribute: func (attr: FieldAttributes, value: CString = null) {
        UnsupportedAstElement new(this, "property-decl-attribute") enact()
    }


    onPropertyDeclGetterStart: func (doc: CString) {
        UnsupportedAstElement new(this, "property-decl-getter-start") enact()
    }

    onPropertyDeclGetterEnd: func -> Object {
        UnsupportedAstElement new(this, "property-decl-getter-end") enact(); null
    }


    onPropertyDeclSetterStart: func (doc: CString) {
        UnsupportedAstElement new(this, "property-decl-setter-start") enact()
    }

    onPropertyDeclSetterEnd: func -> Object {
        UnsupportedAstElement new(this, "property-decl-setter-end") enact(); null
    }

    onPropertyDeclSetterArgument: func (name: CString, conventional: Bool) {
        UnsupportedAstElement new(this, "property-decl-setter-argument") enact()
    }


    /* Variable declarations */

    onVarDeclStart: func {
        UnsupportedAstElement new(this, "variable-decl-start") enact()
    }

    onVarDeclEnd: func -> Object {
        UnsupportedAstElement new(this, "variable-decl-start") enact(); null
    }


    onVarDeclName: func (name, doc: CString) {
        UnsupportedAstElement new(this, "variable-decl-start") enact()
    }

    onVarDeclTuple: func (tuple: Object) {
        UnsupportedAstElement new(this, "variable-decl-start") enact()
    }

    onVarDeclExpr: func (expr: Object) {
        UnsupportedAstElement new(this, "variable-decl-start") enact()
    }

    onVarDeclType: func (type: Object) {
        UnsupportedAstElement new(this, "variable-decl-start") enact()
    }


    onVarAttribute: func (attr: FieldAttributes, value: CString = null) {
        UnsupportedAstElement new(this, "variable-decl-attribute") enact()
    }


    /* Types */

    onTypeAccess: func (type: Object) -> Object {
        UnsupportedAstElement new(this, "type-access") enact(); null
    }


    onTypeNew: func (name: CString) -> Object {
        UnsupportedAstElement new(this, "type") enact(); null
    }


    onTypePointer: func (type: Object) -> Object {
        UnsupportedAstElement new(this, "type-pointer") enact(); null
    }

    onTypeReference: func (type: Object) -> Object {
        UnsupportedAstElement new(this, "type-reference") enact(); null
    }

    onTypeBrackets: func (type, inner: Object) -> Object {
        UnsupportedAstElement new(this, "type-brackets") enact(); null
    }

    onTypeGenericArgument: func (type: Object, genType: Object) {
        UnsupportedAstElement new(this, "type-generic-argument") enact()
    }


    onTypeList: func -> Object {
        UnsupportedAstElement new(this, "type-list") enact(); null
    }

    onTypeListElement: func (list, elem: Object) -> Object {
        UnsupportedAstElement new(this, "type-list-element") enact(); null
    }

    onTypeNamespace: func (type, ident: Object) {
        UnsupportedAstElement new(this, "type-namespace") enact(); null
    }


    // FuncType

    onFuncTypeNew: func -> Object {
        UnsupportedAstElement new(this, "func-type") enact(); null
    }

    onFuncTypeGenericArgument: func (type: Object, name: CString) {
         UnsupportedAstElement new(this, "func-type-generic-argument") enact()
    }

    onFuncTypeArgument: func (funcType, argType: Object) {
        UnsupportedAstElement new(this, "func-type-argument") enact()
    }

    onFuncTypeVarArg: func (funcType: Object) {
        UnsupportedAstElement new(this, "func-type-vararg") enact()
    }

    onFuncTypeReturnType: func (funcType, returnType: Object) {
        UnsupportedAstElement new(this, "func-type-return-type") enact()
    }

    /* Operators (minimal because function-related callbacks are re-used for operators) */

    onOperatorStart: func {
        UnsupportedAstElement new(this, "op-start") enact()
    }

    onOperatorBodyStart: func {
        UnsupportedAstElement new(this, "op-body-start") enact()
    }

    onOperatorAbstract: func {
        UnsupportedAstElement new(this, "op-body-abstract") enact()
    }

    onOperatorByref: func {
        UnsupportedAstElement new(this, "op-body-byref") enact()
    }

    onOperatorSymbol: func (symbol: CString) {
        UnsupportedAstElement new(this, "op-body-symbol") enact()
    }

    onOperatorEnd: func {
        UnsupportedAstElement new(this, "op-end") enact()
    }


    /* Functions */

    onFunctionStart: func (name, doc: CString) {
        UnsupportedAstElement new(this, "function") enact()
    }

    onFunctionACS: func {
        UnsupportedAstElement new(this, "function acs") enact()
    }

    onFunctionEnd: func -> Object {
        UnsupportedAstElement new(this, "function") enact()
    }

    onFunctionBody: func {
        UnsupportedAstElement new(this, "function") enact()
    }


    onFunctionArgsStart: func {
        UnsupportedAstElement new(this, "function") enact()
    }

    onFunctionArgsEnd: func {
        UnsupportedAstElement new(this, "function") enact()
    }


    onTypeArg: func (type: Object) {
        UnsupportedAstElement new(this, "function") enact()
    }

    onArg: func (name: CString, type: FuncArgType) {
        UnsupportedAstElement new(this, "function") enact()
    }

    onFunctionReturnType: func (returnType: Object) {
        UnsupportedAstElement new(this, "function") enact()
    }

    onFunctionAttr: func (f: FuncAttributes, value: CString = null) {
        UnsupportedAstElement new(this, "function") enact()
    }


    /* Function calls */

    onFunctionCallStart: func (name: CString) {
        UnsupportedAstElement new(this, "function-call") enact()
    }

    onFunctionCallEnd: func -> Object {
        UnsupportedAstElement new(this, "function-call") enact()
    }


    onFunctionCallSuffix: func (suffix: CString) {
        UnsupportedAstElement new(this, "function-call-suffix") enact()
    }

    onFunctionCallArg: func (arg: Object) {
        UnsupportedAstElement new(this, "function-call-arg") enact()
    }

    onFunctionCallExpr: func (call, expr: Object) {
        UnsupportedAstElement new(this, "function-call-expr") enact()
    }

    onFunctionCallChain: func (expr, call: Object) -> Object {
        UnsupportedAstElement new(this, "function-call-chain") enact(); null
    }

    onFunctionCallCombo: func (call, expr: Object) -> Object {
        UnsupportedAstElement new(this, "function-call-combo") enact()
    }


    /* Arrays */

    onArrayLiteralStart: func {
        UnsupportedAstElement new(this, "array-literal") enact()
    }

    onArrayLiteralEnd: func -> Object {
        UnsupportedAstElement new(this, "array-literal") enact(); null
    }


    /* Tuples */

    onTupleStart: func {
        UnsupportedAstElement new(this, "tuple") enact()
    }

    onTupleEnd: func -> Object {
        UnsupportedAstElement new(this, "tuple") enact(); null
    }


    /* Various expressions/statements */

    onRawStringLiteral: func(object: Object) {
        UnsupportedAstElement new(this, "raw string") enact()
    }

    onStringLiteralStart: func {
        UnsupportedAstElement new(this, "string-start") enact()
    }

    onStringInterpolation: func(object: Object) {
        UnsupportedAstElement new(this, "string-interpolation") enact()
    }

    onStringTextChunk: func(text: CString) {
        UnsupportedAstElement new(this, "string-chunk") enact()
    }

    onStringLiteralEnd: func -> Object {
        UnsupportedAstElement new(this, "string-end") enact(); null
    }

    onCharLiteral: func (value: CString) -> Object {
        UnsupportedAstElement new(this, "char") enact(); null
    }


    onReturn: func (expr: Object) -> Object {
        UnsupportedAstElement new(this, "return") enact(); null
    }

    onBreak: func -> Object {
        UnsupportedAstElement new(this, "break") enact(); null
    }

    onContinue: func -> Object {
        UnsupportedAstElement new(this, "continue") enact(); null
    }


    onVarAccess: func (expr: Object, name: CString) -> Object {
        UnsupportedAstElement new(this, "var-access") enact(); null
    }

    onArrayAccessStart: func (array: Object) {
        UnsupportedAstElement new(this, "array-access") enact()
    }

    onArrayAccessEnd: func -> Object {
        UnsupportedAstElement new(this, "array-access") enact(); null
    }


    onCast: func (expr, type: Object) -> Object {
        UnsupportedAstElement new(this, "cast") enact(); null
    }


    /* Blocks */

    onBlockStart: func {
        UnsupportedAstElement new(this, "block") enact()
    }

    onBlockEnd: func -> Object {
        UnsupportedAstElement new(this, "block") enact(); null
    }


    /* If-else, foreach, while */

    onIfStart: func (condition: Object) {
        UnsupportedAstElement new(this, "if") enact()
    }

    onIfEnd: func -> Object {
        UnsupportedAstElement new(this, "if") enact(); null
    }

    onElseMatched: func (_if, _else: Object) {
        UnsupportedAstElement new(this, "else-matched") enact()
    }
 
    onElseStart: func {
        UnsupportedAstElement new(this, "else") enact()
    }

    onElseEnd: func {
        UnsupportedAstElement new(this, "else") enact()
    }


    onForeachStart: func (decl, collec: Object) {
        UnsupportedAstElement new(this, "foreach") enact()
    }

    onForeachEnd: func -> Object {
        UnsupportedAstElement new(this, "foreach") enact(); null
    }


    onWhileStart: func (condition: Object) {
        UnsupportedAstElement new(this, "while") enact()
    }

    onWhileEnd: func -> Object {
        UnsupportedAstElement new(this, "while") enact(); null
    }


    /* Match */

    onMatchStart: func {
        UnsupportedAstElement new(this, "match") enact()
    }

    onMatchExpr: func (value: Object) {
        UnsupportedAstElement new(this, "match") enact()
    }

    onMatchEnd: func -> Object {
        UnsupportedAstElement new(this, "match") enact(); null
    }


    onCaseStart: func {
        UnsupportedAstElement new(this, "case") enact()
    }

    onCaseExpr: func (value: Object) {
        UnsupportedAstElement new(this, "case") enact()
    }

    onCaseEnd: func {
        UnsupportedAstElement new(this, "case") enact()
    }


    /* Try-catch */

    onTryStart: func {
        UnsupportedAstElement new(this, "try") enact()
    }

    onTryEnd: func -> Object {
        UnsupportedAstElement new(this, "try") enact(); null
    }


    onCatchStart: func {
        UnsupportedAstElement new(this, "catch") enact()
    }

    onCatchExpr: func (value: Object) {
        UnsupportedAstElement new(this, "catch") enact()
    }

    onCatchEnd: func {
        UnsupportedAstElement new(this, "catch") enact()
    }

    onUnOp: func (type: UnOpType, operand: Object) -> Object {
        UnsupportedAstElement new(this, "unary-op") enact(); null
    }

    onBinOp: func (type: BinOpType, left, right: Object) -> Object {
        UnsupportedAstElement new(this, "binary-op") enact(); null
    }

    onTernary: func (condition, ifTrue, ifFalse: Object) -> Object {
        UnsupportedAstElement new(this, "ternary") enact(); null
    }


    onIntLiteral: func (format: IntFormat, value: CString) -> Object {
        UnsupportedAstElement new(this, "int-literal") enact(); null
    }


    onFloatLiteral: func (value: CString) -> Object {
        UnsupportedAstElement new(this, "float-literal") enact(); null
    }

    onBoolLiteral: func (value: Bool) -> Object {
        UnsupportedAstElement new(this, "bool-literal") enact(); null
    }

    onNull: func -> Object {
        UnsupportedAstElement new(this, "null-literal") enact(); null
    }


    onParenthesis: func (inner: Object) -> Object {
        UnsupportedAstElement new(this, "parenthesis") enact(); null
    }


    onGenericArgument: func (name: CString) {
        UnsupportedAstElement new(this, "generic-argument") enact()
    }


    onAddressOf: func (inner: Object) -> Object {
        UnsupportedAstElement new(this, "addressof") enact(); null
    }

    onDereference: func (inner: Object) -> Object {
        UnsupportedAstElement new(this, "dereference") enact(); null
    }


    onStatement: func (statement: Object) {
        UnsupportedAstElement new(this, "statement") enact()
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
    not, bNot, uMinus, uPlus
}

/**
 * Binary operators
 */
BinOpType: enum {
    doubleArrow, equals, notEquals, lessThan, moreThan, cmp, lessThanOrEqual, moreThanOrEqual

    assAnd, assOr, assXor, assRShift, assLShift, assDiv, assMul, assExp, assSub, assAdd, assMod, ass

    and, or, bAnd, bOr, bXor, rshift, lshift, div, mul, exp, sub, add, range, mod

    nullCoal
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

    listener: OocListener

    init: func (=listener, elementName: String) {
        super(listener class, "Unsupported ooc AST element '" + elementName + "' used in parsed source code with OocListener " + listener class name)
    }

    enact: func {
        if (listener strict?()) {
            throw()
        } else {
            // soft behavior: don't throw, just ignore
        }
    }

}
