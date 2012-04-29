import OocListener

nq_parse: extern func (l: OocListener, path: CString) -> Int

nq_setTokenPositionPointer: unmangled func (l: OocListener, tokenPosPointer: Int*) {
    l tokenPos = tokenPosPointer
}

/* String utilities */

nq_StringClone:   unmangled func (string: CString) -> CString { string clone() }
nq_trailingQuest: unmangled func (string: CString) -> CString { (string toString() + "__quest") toCString() }
nq_trailingBang:  unmangled func (string: CString) -> CString { (string toString() + "__bang") toCString() }

/* Uses, imports, includes */

nq_onUse: unmangled func (l: OocListener, name: CString) { l onUse(name) }
nq_onInclude: unmangled func (l: OocListener, name: CString) { l onInclude(name) }
nq_onIncludeDefine: unmangled func (l: OocListener, name, value: CString) { l onIncludeDefine(name, value) }
nq_onImport: unmangled func (l: OocListener, path, name: CString) { l onImport(path, name) }
nq_onImportNamespace: unmangled func (l: OocListener, namespace: CString, quantity: Int) { l onImportNamespace(namespace, quantity) }

/* Versions */

nq_onVersionName:     unmangled func (l: OocListener, name: CString) -> Object { l onVersionName(name) }
nq_onVersionNegation: unmangled func (l: OocListener, spec: Object) -> Object { l onVersionNegation(spec) }
nq_onVersionAnd:      unmangled func (l: OocListener, specLeft, specRight: Object) -> Object { l onVersionAnd(specLeft, specRight) }
nq_onVersionOr:       unmangled func (l: OocListener, specLeft, specRight: Object) -> Object { l onVersionOr(specLeft, specRight) }

nq_onVersionStart:       unmangled func (l: OocListener, spec: Object) { l onVersionStart(spec) }
nq_onVersionElseIfStart: unmangled func (l: OocListener, notSpec, elseSpec: Object) -> Object { l onVersionElseIfStart(notSpec, elseSpec) }
nq_onVersionElseStart:   unmangled func (l: OocListener, notSpec, elseSpec: Object) -> Object { l onVersionElseStart(notSpec, elseSpec) }
nq_onVersionEnd:         unmangled func (l: OocListener) -> Object { l onVersionEnd() }

/* Extend keyword */

nq_onExtendStart: unmangled func (l: OocListener, type: Object, doc: CString) { l onExtendStart(type, doc) }
nq_onExtendEnd:   unmangled func (l: OocListener) { l onExtendEnd() }

/* Covers */

nq_onCoverStart:      unmangled func (l: OocListener, name, doc: CString) { l onCoverStart(name, doc) }
nq_onCoverExtern:     unmangled func (l: OocListener, externName: CString) { l onCoverExtern(externName) }
nq_onCoverFromType:   unmangled func (l: OocListener, type: Object) { l onCoverFromType(type) }
nq_onCoverExtends:    unmangled func (l: OocListener, type: Object) { l onCoverExtends(type) }
nq_onCoverImplements: unmangled func (l: OocListener, type: Object) { l onCoverImplements(type) }
nq_onCoverEnd:        unmangled func (l: OocListener) -> Object { l onCoverEnd() }

/* Enums */

nq_onEnumStart:         unmangled func (l: OocListener, name, doc: CString) { l onEnumStart(name, doc) }
nq_onEnumEnd:           unmangled func (l: OocListener) -> Object { l onEnumEnd() }

nq_onEnumFromType:      unmangled func (l: OocListener, fromType: Object) { l onEnumFromType(fromType) }

nq_onEnumExtern:        unmangled func (l: OocListener, externName: CString) { l onEnumExtern(externName) }
nq_onEnumIncrementExpr: unmangled func (l: OocListener, oper: Char, step: Object) { l onEnumIncrementExpr(oper, step) }

nq_onEnumElementStart:  unmangled func (l: OocListener, name, doc: CString) { l onEnumElementStart(name, doc) }
nq_onEnumElementValue:  unmangled func (l: OocListener, value: Object) { l onEnumElementValue(value) }
nq_onEnumElementExtern: unmangled func (l: OocListener, externName: CString) { l onEnumElementExtern(externName) }
nq_onEnumElementEnd:    unmangled func (l: OocListener) { l onEnumElementEnd() }

/* Classes */

nq_onClassStart:      unmangled func (l: OocListener, name, doc: CString) { l onClassStart(name, doc) }
nq_onClassBody:       unmangled func (l: OocListener) { l onClassBody() }
nq_onClassEnd:        unmangled func (l: OocListener) -> Object { l onClassEnd() }

nq_onClassAbstract:   unmangled func (l: OocListener) { l onClassAttribute(TypeAttribute _abstract) }
nq_onClassFinal:      unmangled func (l: OocListener) { l onClassAttribute(TypeAttribute _final) }
nq_onClassExtends:    unmangled func (l: OocListener, type: Object) { l onClassAttribute(TypeAttribute _extends, type) }
nq_onClassImplements: unmangled func (l: OocListener, type: Object) { l onClassAttribute(TypeAttribute _implements, type) }

/* Interfaces */

nq_onInterfaceStart:   unmangled func (l: OocListener) { l onInterfaceStart() }
nq_onInterfaceEnd:     unmangled func (l: OocListener) -> Object { l onInterfaceEnd() }

nq_onInterfaceExtends: unmangled func (l: OocListener, type: Object) { l onInterfaceAttribute(TypeAttribute _extends, type) }

/* Properties */

nq_onPropertyDeclStart:   unmangled func (l: OocListener, name, doc: CString) { l onPropertyDeclStart(name, doc) }
nq_onPropertyDeclEnd:     unmangled func (l: OocListener) -> Object { l onPropertyDeclEnd() }
nq_onPropertyDeclType:    unmangled func (l: OocListener, type: Object) { l onPropertyDeclType(type) }

nq_onPropertyDeclStatic:    unmangled func (l: OocListener) { l onPropertyAttribute(FieldAttributes _static) }

nq_onPropertyDeclGetterStart:   unmangled func (l: OocListener, doc: CString) { l onPropertyDeclGetterStart(doc) }
nq_onPropertyDeclGetterEnd:     unmangled func (l: OocListener) -> Object { l onPropertyDeclGetterEnd() }

nq_onPropertyDeclSetterStart:    unmangled func (l: OocListener, doc: CString) { l onPropertyDeclSetterStart(doc) }
nq_onPropertyDeclSetterEnd:      unmangled func (l: OocListener) -> Object { l onPropertyDeclSetterEnd() }
nq_onPropertyDeclSetterArgument: unmangled func (l: OocListener, name: CString, conventional: Bool) { l onPropertyDeclSetterArgument(name, conventional) }

/* Variable declarations */

nq_onVarDeclStart:  unmangled func (l: OocListener) { l onVarDeclStart() }
nq_onVarDeclEnd:    unmangled func (l: OocListener) -> Object { l onVarDeclEnd() }

nq_onVarDeclName:   unmangled func (l: OocListener, name, doc: CString) { l onVarDeclName(name, doc) }
nq_onVarDeclTuple:  unmangled func (l: OocListener, tuple: Object) { l onVarDeclTuple(tuple) }
nq_onVarDeclExpr:   unmangled func (l: OocListener, expr: Object) { l onVarDeclExpr(expr) }
nq_onVarDeclType:   unmangled func (l: OocListener, type: Object) { l onVarDeclType(type) }

nq_onVarDeclStatic: unmangled func (l: OocListener) { l onVarAttribute(FieldAttributes _static) }
nq_onVarDeclConst:  unmangled func (l: OocListener) { l onVarAttribute(FieldAttributes _const) }
nq_onVarDeclProto:  unmangled func (l: OocListener) { l onVarAttribute(FieldAttributes _proto) }

nq_onVarDeclExtern:    unmangled func (l: OocListener, externName: CString)    { l onVarAttribute(FieldAttributes _extern, externName) }
nq_onVarDeclUnmangled: unmangled func (l: OocListener, unmangledName: CString) { l onVarAttribute(FieldAttributes _unmangled, unmangledName) }

/* Types */

nq_onTypeAccess: unmangled func (l: OocListener, type: Object) -> Object { l onTypeAccess(type) }

nq_onTypeNew: unmangled func (l: OocListener, name: CString) -> Object {  l onTypeNew(name) }

nq_onTypePointer:         unmangled func (l: OocListener, type: Object) -> Object {  l onTypePointer(type) }
nq_onTypeReference:       unmangled func (l: OocListener, type: Object) -> Object {  l onTypeReference(type) }
nq_onTypeBrackets:        unmangled func (l: OocListener, type, inner: Object) -> Object {  l onTypeBrackets(type, inner) }
nq_onTypeGenericArgument: unmangled func (l: OocListener, type: Object, genType: Object) { l onTypeGenericArgument(type, genType) }

nq_onTypeList:        unmangled func (l: OocListener) -> Object { l onTypeList() }
nq_onTypeListElement: unmangled func (l: OocListener, list, elem: Object) -> Object { l onTypeListElement(list, elem) }

// FuncType

nq_onFuncTypeNew:        unmangled func (l: OocListener) -> Object { l onFuncTypeNew() }
nq_onFuncTypeGenericArgument: unmangled func (l: OocListener, type: Object, name: CString) { l onFuncTypeGenericArgument(type, name) }
nq_onFuncTypeArgument:   unmangled func (l: OocListener, funcType, argType: Object) { l onFuncTypeArgument(funcType, argType) }
nq_onFuncTypeVarArg:     unmangled func (l: OocListener, funcType: Object) { l onFuncTypeVarArg(funcType) }
nq_onFuncTypeReturnType: unmangled func (l: OocListener, funcType, returnType: Object) { l onFuncTypeReturnType(funcType, returnType) }

/* Operators (minimal because function-related callbacks are re-used for operators) */

nq_onOperatorStart: unmangled func (l: OocListener, symbol: CString) { l onOperatorStart(symbol) }
nq_onOperatorEnd:   unmangled func (l: OocListener) { l onOperatorEnd() }

/* Functions */

nq_onFunctionStart: unmangled func (l: OocListener, name, doc: CString) { l onFunctionStart(name, doc) }
nq_onFunctionEnd:   unmangled func (l: OocListener) -> Object { l onFunctionEnd() }
nq_onFunctionBody:  unmangled func (l: OocListener) { l onFunctionBody() }

nq_onFunctionArgsStart: unmangled func (l: OocListener) { l onFunctionArgsStart() }
nq_onFunctionArgsEnd: unmangled func (l: OocListener) { l onFunctionArgsEnd() }

nq_onTypeArg: unmangled func (l: OocListener, type: Object) { l onTypeArg(type) }
nq_onVarArg: unmangled func (l: OocListener, name: CString) { l onArg(name, FuncArgType varArg) }
nq_onDotArg: unmangled func (l: OocListener, name: CString) { l onArg(name, FuncArgType dotArg) }
nq_onAssArg: unmangled func (l: OocListener, name: CString) { l onArg(name, FuncArgType assArg) }

nq_onFunctionReturnType: unmangled func (l: OocListener, returnType: Object)     { l onFunctionReturnType(returnType) }

nq_onFunctionExtern:     unmangled func (l: OocListener, externName: CString)    { l onFunctionAttr(FuncAttributes _extern, externName) }
nq_onFunctionUnmangled:  unmangled func (l: OocListener, unmangledName: CString) { l onFunctionAttr(FuncAttributes _unmangled, unmangledName) }
nq_onFunctionSuffix:     unmangled func (l: OocListener, suffix: CString)        { l onFunctionAttr(FuncAttributes _suffix, suffix) }
nq_onFunctionThisRef:    unmangled func (l: OocListener, externName: CString)    { l onFunctionAttr(FuncAttributes _thisRef) }

nq_onFunctionAbstract:  unmangled func (l: OocListener)    { l onFunctionAttr(FuncAttributes _abstract) }
nq_onFunctionConst:     unmangled func (l: OocListener)    { l onFunctionAttr(FuncAttributes _const) }
nq_onFunctionStatic:    unmangled func (l: OocListener)    { l onFunctionAttr(FuncAttributes _static) }
nq_onFunctionInline:    unmangled func (l: OocListener)    { l onFunctionAttr(FuncAttributes _inline) }
nq_onFunctionFinal:     unmangled func (l: OocListener)    { l onFunctionAttr(FuncAttributes _final) }
nq_onFunctionProto:     unmangled func (l: OocListener)    { l onFunctionAttr(FuncAttributes _proto) }
nq_onFunctionSuper:     unmangled func (l: OocListener)    { l onFunctionAttr(FuncAttributes _super) }

/* Function calls */

nq_onFunctionCallStart: unmangled func (l: OocListener, name: CString) {  l onFunctionCallStart(name) }
nq_onFunctionCallEnd:   unmangled func (l: OocListener) -> Object {  l onFunctionCallEnd() }

nq_onFunctionCallSuffix: unmangled func (l: OocListener, suffix: CString) {  l onFunctionCallSuffix(suffix) }
nq_onFunctionCallArg:    unmangled func (l: OocListener, arg: Object)     {  l onFunctionCallArg(arg) }
nq_onFunctionCallExpr:   unmangled func (l: OocListener, call: Object, expr: Object) { l onFunctionCallExpr(call, expr) }
nq_onFunctionCallChain:  unmangled func (l: OocListener, expr, call: Object) -> Object { l onFunctionCallChain(expr, call) }
nq_onFunctionCallCombo:  unmangled func (l: OocListener, call, expr: Object) { l onFunctionCallCombo(call, expr) }

/* Arrays */

nq_onArrayLiteralStart:   unmangled func (l: OocListener) { l onArrayLiteralStart() }
nq_onArrayLiteralEnd:     unmangled func (l: OocListener) -> Object { l onArrayLiteralEnd() }

/* Tuples */

nq_onTupleStart:   unmangled func (l: OocListener) { l onTupleStart() }
nq_onTupleEnd:     unmangled func (l: OocListener) -> Object { l onTupleEnd() }

/* Various expressions/statements */

nq_onStringLiteral: unmangled func (l: OocListener, text: CString) -> Object  { l onStringLiteral(text) }
nq_onCharLiteral:   unmangled func (l: OocListener, value: CString) -> Object { l onCharLiteral(value) }

nq_onReturn:    unmangled func (l: OocListener, expr: Object) -> Object { l onReturn(expr) }
nq_onBreak:     unmangled func (l: OocListener) -> Object { l onBreak() }
nq_onContinue:  unmangled func (l: OocListener) -> Object { l onContinue() }

nq_onVarAccess:   unmangled func (l: OocListener, expr: Object, name: CString) -> Object { l onVarAccess(expr, name) }

nq_onArrayAccessStart: unmangled func (l: OocListener, array: Object) { l onArrayAccessStart(array) }
nq_onArrayAccessEnd:   unmangled func (l: OocListener) -> Object { l onArrayAccessEnd() }

nq_onCast: unmangled func (l: OocListener, expr, type: Object) -> Object { l onCast(expr, type) }

/* Blocks */

nq_onBlockStart: unmangled func (l: OocListener) { l onBlockStart() }
nq_onBlockEnd:   unmangled func (l: OocListener) -> Object { l onBlockEnd() }

/* If-else, foreach, while */

nq_onIfStart:   unmangled func (l: OocListener, condition: Object) { l onIfStart(condition) }
nq_onIfEnd:     unmangled func (l: OocListener) -> Object { l onIfEnd() }

nq_onElseStart: unmangled func (l: OocListener) { l onElseStart() }
nq_onElseEnd:   unmangled func (l: OocListener) { l onElseEnd() }

nq_onForeachStart:   unmangled func (l: OocListener, decl, collec: Object) { l onForeachStart(decl, collec) }
nq_onForeachEnd:     unmangled func (l: OocListener) -> Object { l onForeachEnd() }

nq_onWhileStart:   unmangled func (l: OocListener, condition: Object) { l onWhileStart(condition) }
nq_onWhileEnd:     unmangled func (l: OocListener) -> Object { l onWhileEnd() }

/* Match */

nq_onMatchStart:   unmangled func (l: OocListener) { l onMatchStart() }
nq_onMatchExpr:    unmangled func (l: OocListener, value: Object) { l onMatchExpr(value) }
nq_onMatchEnd:     unmangled func (l: OocListener) -> Object { l onMatchEnd() }

nq_onCaseStart:   unmangled func (l: OocListener) { l onCaseStart() }
nq_onCaseExpr:    unmangled func (l: OocListener, value: Object) { l onCaseExpr(value) }
nq_onCaseEnd:     unmangled func (l: OocListener) { l onCaseEnd() }

/* Try-catch */

nq_onTryStart:   unmangled func (l: OocListener) { l onTryStart() }
nq_onTryEnd:     unmangled func (l: OocListener) -> Object { l onTryEnd() }

nq_onCatchStart:   unmangled func (l: OocListener) { l onCatchStart() }
nq_onCatchExpr:    unmangled func (l: OocListener, value: Object) { l onCatchExpr(value) }
nq_onCatchEnd:     unmangled func (l: OocListener) { l onCatchEnd() }

/* Various operators */

nq_onDoubleArrow: unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType doubleArrow, left, right) }

nq_onLogicalNot:          unmangled func (l: OocListener, inner: Object) -> Object { l onUnOp(UnOpType not, inner) }
nq_onBinaryNot:           unmangled func (l: OocListener, inner: Object) -> Object { l onUnOp(UnOpType bNot, inner) }
nq_onUnaryMinus:          unmangled func (l: OocListener, inner: Object) -> Object { l onUnOp(UnOpType uMinus, inner) }

nq_onEquals:          unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType equals, left, right) }
nq_onNotEquals:       unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType notEquals, left, right) }
nq_onLessThan:        unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType lessThan, left, right) }
nq_onMoreThan:        unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType moreThan, left, right) }
nq_onCmp:             unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType cmp, left, right) }
nq_onLessThanOrEqual: unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType lessThanOrEqual, left, right) }
nq_onMoreThanOrEqual: unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType moreThanOrEqual, left, right) }

nq_onAssignAnd:       unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType assAnd, left, right) }
nq_onAssignOr:        unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType assOr, left, right) }
nq_onAssignXor:       unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType assXor, left, right) }
nq_onAssignRightShift:       unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType assRShift, left, right) }
nq_onAssignLeftShift:        unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType assLShift, left, right) }
nq_onAssignDiv:       unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType assDiv, left, right) }
nq_onAssignMul:       unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType assMul, left, right) }
nq_onAssignExp:       unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType assExp, left, right) }
nq_onAssignSub:       unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType assSub, left, right) }
nq_onAssignAdd:       unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType assAdd, left, right) }
nq_onAssign:          unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType ass, left, right) }

nq_onLogicalAnd:       unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType and, left, right) }
nq_onLogicalOr:        unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType or, left, right) }

nq_onBinaryAnd:       unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType bAnd, left, right) }
nq_onBinaryOr:        unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType bOr, left, right) }
nq_onBinaryXor:       unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType bXor, left, right) }

nq_onBinaryRightShift:       unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType rshift, left, right) }
nq_onBinaryLeftShift:        unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType lshift, left, right) }

nq_onDiv:       unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType div, left, right) }
nq_onMul:       unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType mul, left, right) }
nq_onExp:       unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType exp, left, right) }
nq_onSub:       unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType sub, left, right) }
nq_onAdd:       unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType add, left, right) }

nq_onMod:          unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType mod, left, right) }
nq_onRangeLiteral: unmangled func (l: OocListener, left, right: Object) -> Object { l onBinOp(BinOpType range, left, right) }

nq_onTernary: unmangled func (l: OocListener, condition, ifTrue, ifFalse: Object) -> Object { l onTernary(condition, ifTrue, ifFalse) }

nq_onDecLiteral:   unmangled func (l: OocListener, value: CString) -> Object { l onIntLiteral(IntFormat dec, value) }
nq_onBinLiteral:   unmangled func (l: OocListener, value: CString) -> Object { l onIntLiteral(IntFormat bin, value) }
nq_onOctLiteral:   unmangled func (l: OocListener, value: CString) -> Object { l onIntLiteral(IntFormat oct, value) }
nq_onHexLiteral:   unmangled func (l: OocListener, value: CString) -> Object { l onIntLiteral(IntFormat hex, value) }

nq_onFloatLiteral:  unmangled func (l: OocListener, value: CString) -> Object { l onFloatLiteral(value) }
nq_onBoolLiteral:   unmangled func (l: OocListener, value: Bool) -> Object { l onBoolLiteral(value) }
nq_onNull:   unmangled func (l: OocListener) -> Object { l onNull() }

nq_onParenthesis:   unmangled func (l: OocListener, inner: Object) -> Object { l onParenthesis(inner) }

nq_onGenericArgument: unmangled func (l: OocListener, name: CString) { l onGenericArgument(name) }

nq_onAddressOf:     unmangled func (l: OocListener, inner: Object) -> Object { l onAddressOf(inner) }
nq_onDereference:   unmangled func (l: OocListener, inner: Object) -> Object { l onDereference(inner) }

nq_onStatement:   unmangled func (l: OocListener, statement: Object) { l onStatement(statement) }

/* Error handling */

nq_error: unmangled func (l: OocListener, errorID: Int, defaultMessage: CString, index: Int) { l onError(errorID, defaultMessage toString(), index) }

