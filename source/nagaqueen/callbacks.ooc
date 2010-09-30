import OocListener

nq_setTokenPositionPointer: func (l: OocListener, int *tokenPosPointer) {
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
nq_onVersionNegation: unmangled func (l: OocListener, specLeft, specRight: Object) -> Object { l onVersionNegation(spec) }
nq_onVersionAnd:      unmangled func (l: OocListener, specLeft, specRight: Object) -> Object { l onVersionAnd(specLeft, specRight) }
nq_onVersionOr:       unmangled func (l: OocListener, specLeft, specRight: Object) -> Object { l onVersionOr(specLeft, specRight) }

nq_onVersionStart:       unmangled func (l: OocListener, spec: Object) { l onVersionStart(spec) }
nq_onVersionElseIfStart: unmangled func (l: OocListener, notSpec, elseSpec: Object) -> Object { l onVersionElseIfStart(spec) }
nq_onVersionElseStart:   unmangled func (l: OocListener, notSpec, elseSpec: Object) -> Object { l onVersionElseStart(spec) }
nq_onVersionEnd:         unmangled func (l: OocListener, spec: Object) -> Object { l onVersionEnd() }

/* Extend keyword */

nq_onExtendStart: unmangled func (l: OocListener, type: Object, doc: CString) { l onExtendStart(type, doc) }
nq_onExtendEnd:   unmangled func (l: OocListener) { l onExtendEnd() }

/* Covers */

nq_onCoverStart:      unmangled func (l: OocListener, name, doc: CString) { l onCoverStart(name, doc) }
nq_onCoverExtern:     unmangled func (l: OocListener, externName: CString) { l onCoverExtern(externName) }
nq_onCoverFromType:   unmangled func (l: OocListener, type: Object) { l onCoverFromType(externName) }
nq_onCoverExtends:    unmangled func (l: OocListener, type: Object) { l onCoverExtends(externName) }
nq_onCoverImplements: unmangled func (l: OocListener, type: Object) { l onCoverImplements(externName) }
nq_onCoverEnd:        unmangled func (l: OocListener) { l onCoverEnd() }

/* Enums */

nq_onEnumStart:         unmangled func (l: OocListener, name, doc: CString) { l onEnumStart(name, doc) }
nq_onEnumEnd:           unmangled func (l: OocListener) { l onEnumEnd() }

nq_onEnumExtern:        unmangled func (l: OocListener, externName: CString) { l onEnumStart(name, doc) }
nq_onEnumIncrementExpr: unmangled func (l: OocListener, oper: Char, step: Object) { l onEnumIncrementExpr(oper, step) }

nq_onEnumElementStart:  unmangled func (l: OocListener, name, doc: CString) { l onEnumElementStart(name, doc) }
nq_onEnumElementValue:  unmangled func (l: OocListener, value: Object) { l onEnumElementValue(value) }
nq_onEnumElementExtern: unmangled func (l: OocListener, externName: CString) { l onEnumStart(externName) }
nq_onEnumElementEnd:    unmangled func (l: OocListener) { l onEnumElementEnd() }

/* Classes */

TypeAttribute: enum {
    _abstract, _final, _extends, _implements, _fromType
}

FieldAttributes: enum {
    _abstract, _final, _const, _static, _unmangled,  _proto, _extern
}

nq_onClassStart:      unmangled func (l: OocListener, name, doc: CString) { l onClassStart(name, doc) }
nq_onClassBody:       unmangled func (l: OocListener) { l onClassBody() }
nq_onClassEnd:        unmangled func (l: OocListener) { l onClassEnd() }

nq_onClassAbstract:   unmangled func (l: OocListener) { l onClassAttribute(TypeAttribute _abstract) }
nq_onClassFinal:      unmangled func (l: OocListener) { l onClassAttribute(TypeAttribute _final) }
nq_onClassExtends:    unmangled func (l: OocListener) { l onClassAttribute(TypeAttribute _extends, type) }
nq_onClassImplements: unmangled func (l: OocListener) { l onClassAttribute(TypeAttribute _implements, type) }

/* Interfaces */

nq_onInterfaceStart:   unmangled func (l: OocListener) { l onInterfaceStart() }
nq_onInterfaceEnd:     unmangled func (l: OocListener) { l onInterfaceEnd() }

nq_onInterfaceExtends: unmangled func (l: OocListener, type: Type) { l onInterfaceAttribute(TypeAttribute _extends, type) }

/* Properties */

nq_onPropertyDeclStart:   unmangled func (l: OocListener, name, doc: CString) { l onPropertyDeclStart(name, doc) }
nq_onPropertyDeclEnd:     unmangled func (l: OocListener) -> Object { l onPropertyDeclEnd() }
nq_onPropertyDeclType:    unmangled func (l: OocListener, type: Type) { l onPropertyDeclType(type) }

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

void *nq_onTypeAccess(void *this, void *type);

void *nq_onTypeNew(void *this, char *name);     // $$=nq_onTypeNew(yytext)
void *nq_onTypePointer(void *this, void *type);   // $$=nq_onTypePointer($$)
void *nq_onTypeReference(void *this, void *type); // $$=nq_onTypeReference($$)
void *nq_onTypeBrackets(void *this, void *type, void *inner); // $$=nq_onTypeBrackets($$, inner)
void nq_onTypeGenericArgument(void *this, void *type, void *genType);
void nq_onFuncTypeGenericArgument(void *this, void *type, char *name);
void *nq_onTypeList(void *this);
void *nq_onTypeListElement(void *this, void *list, void *elem);

void *nq_onFuncTypeNew(void *this);
void nq_onFuncTypeArgument(void *this, void *funcType, void *argType);
void nq_onFuncTypeVarArg(void *this, void *funcType);
void nq_onFuncTypeReturnType(void *this, void *funcType, void *returnType);

/* Operators (minimal because function-related callbacks are re-used for operators) */

void nq_onOperatorStart(void *this, char *symbol);
void nq_onOperatorEnd(void *this);

void nq_onFunctionStart(void *this, char *name, char *doc);
void nq_onFunctionExtern(void *this, char *externName);
void nq_onFunctionUnmangled(void *this, char *unmangledName);
void nq_onFunctionAbstract(void *this);
void nq_onFunctionThisRef(void *this);
void nq_onFunctionArgsStart(void *this);
void nq_onFunctionArgsEnd(void *this);
void nq_onFunctionReturnType(void *this, void *type);
void nq_onFunctionConst(void *this);
void nq_onFunctionStatic(void *this);
void nq_onFunctionInline(void *this);
void nq_onFunctionFinal(void *this);
void nq_onFunctionProto(void *this);
void nq_onFunctionSuper(void *this);
void nq_onFunctionSuffix(void *this, char *name);
void nq_onFunctionBody(void *this);
void *nq_onFunctionEnd(void *this);

void nq_onTypeArg(void *this, void *type);
void nq_onVarArg(void *this, char *name);
void nq_onDotArg(void *this, char *name);
void nq_onAssArg(void *this, char *name);

void nq_onFunctionCallStart(void *this, char *yytext);
void nq_onFunctionCallSuffix(void *this, char *yytext);
void nq_onFunctionCallArg(void *this, void *expr);
void *nq_onFunctionCallEnd(void *this);
void nq_onFunctionCallExpr(void *this, void *call, void *expr);
void *nq_onFunctionCallChain(void *this, void *expr, void *call);
void nq_onFunctionCallCombo(void *this, void *call, void *expr);

void nq_onArrayLiteralStart(void *this);
void *nq_onArrayLiteralEnd(void *this);

void nq_onTupleStart(void *this);
void *nq_onTupleEnd(void *this);

void *nq_onStringLiteral(void *this, char *text);
void *nq_onCharLiteral(void *this, char *value);

void nq_onStatement(void *this, void *statement);
void *nq_onReturn(void *this, void *expr);

void *nq_onVarAccess(void *this, void *expr, char *name);
void nq_onArrayAccessStart(void *this, void *array);
void *nq_onArrayAccessEnd(void *this);
void *nq_onCast(void *this, void *expr, void *type);

void *nq_onBreak(void *this);
void *nq_onContinue(void *this);

void nq_onBlockStart(void *this);
void *nq_onBlockEnd(void *this);

void nq_onIfStart(void *this, void *condition);
void *nq_onIfEnd(void *this);
void nq_onElseStart(void *this);
void *nq_onElseEnd(void *this);

void nq_onForeachStart(void *this, void *decl, void *collec);
void *nq_onForeachEnd(void *this);

void nq_onWhileStart(void *this, void *condition);
void *nq_onWhileEnd(void *this);

void *nq_onEquals(void *this, void *left, void *right);
void *nq_onNotEquals(void *this, void *left, void *right);
void *nq_onLessThan(void *this, void *left, void *right);
void *nq_onMoreThan(void *this, void *left, void *right);
void *nq_onCmp(void *this, void *left, void *right);
void *nq_onLessThanOrEqual(void *this, void *left, void *right);
void *nq_onMoreThanOrEqual(void *this, void *left, void *right);

void *nq_onDecLiteral(void *this, char *value);
void *nq_onBinLiteral(void *this, char *value);
void *nq_onOctLiteral(void *this, char *value);
void *nq_onHexLiteral(void *this, char *value);
void *nq_onFloatLiteral(void *this, char *value);
void *nq_onBoolLiteral(void *this, bool value);
void *nq_onNull(void *this);

void *nq_onTernary(void *this, void *condition, void *ifTrue, void *ifFalse);
void *nq_onAssignAnd(void *this, void *left, void *right);
void *nq_onAssignOr(void *this, void *left, void *right);
void *nq_onAssignXor(void *this, void *left, void *right);
void *nq_onAssignRightShift(void *this, void *left, void *right);
void *nq_onAssignLeftShift(void *this, void *left, void *right);
void *nq_onAssignDiv(void *this, void *left, void *right);
void *nq_onAssignMul(void *this, void *left, void *right);
void *nq_onAssignSub(void *this, void *left, void *right);
void *nq_onAssignAdd(void *this, void *left, void *right);
void *nq_onAssign(void *this, void *left, void *right);

void *nq_onAdd(void *this, void *left, void *right);
void *nq_onSub(void *this, void *left, void *right);
void *nq_onMod(void *this, void *left, void *right);
void *nq_onMul(void *this, void *left, void *right);
void *nq_onDiv(void *this, void *left, void *right);
void *nq_onRangeLiteral(void *this, void *left, void *right);
void *nq_onBinaryLeftShift(void *this, void *left, void *right);
void *nq_onBinaryRightShift(void *this, void *left, void *right);
void *nq_onLogicalOr(void *this, void *left, void *right);
void *nq_onLogicalAnd(void *this, void *left, void *right);
void *nq_onBinaryOr(void *this, void *left, void *right);
void *nq_onBinaryXor(void *this, void *left, void *right);
void *nq_onBinaryAnd(void *this, void *left, void *right);

void *nq_onLogicalNot(void *this, void *inner);
void *nq_onBinaryNot(void *this, void *inner);
void *nq_onUnaryMinus(void *this, void *inner);

void *nq_onParenthesis(void *this, void *inner);

void nq_onGenericArgument(void *this, char *name);

void *nq_onAddressOf  (void *this, void *inner);
void *nq_onDereference(void *this, void *inner);

void nq_onMatchStart(void *this);
void nq_onMatchExpr(void *this, void *value);
void *nq_onMatchEnd(void *this);
void nq_onCaseStart(void *this);
void nq_onCaseExpr(void *this, void *value);
void nq_onCaseEnd(void *this);

void nq_onTryStart(void *this);
void *nq_onTryEnd(void *this);
void nq_onCatchStart(void *this);
void nq_onCatchExpr(void *this, void *value);
void nq_onCatchEnd(void *this);

void nq_error(void *this, int errorID, char *defaultMessage, int index);

