grammar Io;
protocol
    :
    headContent*
    entity*EOF
    ;
headContent:importIo|javaPackage|namespace;
entity:message|event|bean;
importIo:'import'importValue';';
importValue: filePath'.io';

javaPackage:'javaPackage'javaPackageValue';';
javaPackageValue
	:	Identifier
	|	javaPackageValue '.'Identifier
	|   javaPackageValue '.io'
	;
namespace:'namespace'namespaceValue ';';
namespaceValue:javaPackageValue;
fileName:Number* Identifier*;
filePath:fileName|filePath ('../'|'/'|'\\') fileName;

message
    : messageHead messageType messageName messageId '{'
     field*
    '}';
messageHead:'message';
messageType:'cs'|'CS'|'sc'|'SC';
messageName:Identifier;
messageId:Number;

event
    :eventHead  eventName eventId '{'
     field*
   '}'
   ;
 eventHead:'event';
 eventName:Identifier;
 eventId:Number;

bean
    :beanHead beanName'{'
     field*
    '}'
    ;
beanHead:'bean';
beanName:Identifier;
field
    :fieldType fieldName ';'fieldComment?
    ;
fieldType
    :'int'
    |'long'
    |'sint'
    |'slong'
    |'sfixed32'
    |'sfixed64'
    |'float'
    |'double'
    |'boolean'
    |'String'
    ;
fieldName:Identifier;
fieldComment:LINE_COMMENT;
//↓↓java keywords↓↓
ABSTRACT : 'abstract';
ASSERT : 'assert';
BOOLEAN : 'boolean';
BREAK : 'break';
BYTE : 'byte';
CASE : 'case';
CATCH : 'catch';
CHAR : 'char';
CLASS : 'class';
CONST : 'const';
CONTINUE : 'continue';
DEFAULT : 'default';
DO : 'do';
DOUBLE : 'double';
ELSE : 'else';
ENUM : 'enum';
EXTENDS : 'extends';
FINAL : 'final';
FINALLY : 'finally';
FLOAT : 'float';
FOR : 'for';
IF : 'if';
GOTO : 'goto';
IMPLEMENTS : 'implements';
IMPORT : 'import';
INSTANCEOF : 'instanceof';
INT : 'int';
INTERFACE : 'interface';
LONG : 'long';
NATIVE : 'native';
NEW : 'new';
PACKAGE : 'package';
PRIVATE : 'private';
PROTECTED : 'protected';
PUBLIC : 'public';
RETURN : 'return';
SHORT : 'short';
STATIC : 'static';
STRICTFP : 'strictfp';
SUPER : 'super';
SWITCH : 'switch';
SYNCHRONIZED : 'synchronized';
THIS : 'this';
THROW : 'throw';
THROWS : 'throws';
TRANSIENT : 'transient';
TRY : 'try';
VOID : 'void';
VOLATILE : 'volatile';
WHILE : 'while';
//↑↑java keywords↑↑

//↓↓lua keywords↓↓
SELF:'self';
//↑↑lua keywords↑↑

//↓↓protocol keywords↓↓
MESSAGEID:'messageId';
EVENTID:'eventId';
SERIALIZEDSIZE:'serializedSize';

//↑↑protocol keywords↑↑
Number:[0-9]+;
fragment Letter:	[a-zA-Z_] ;
fragment LetterOrDigit:	[a-zA-Z0-9_] ;
fragment DIGIT : [0-9];
Identifier:	Letter LetterOrDigit*  	;
//WS      :  [ \t\r\n\u000C]+ -> skip ;
WS      :  [ \t\r\n]+ -> skip ;
COMMENT :   '/*' .*? '*/';
LINE_COMMENT:   '//' ~[\r\n]*;
/*
LINE_COMMENT
    :'//' .*? '\r'? '\n'//匹配//于换行中间的所有字符
    ;
*/