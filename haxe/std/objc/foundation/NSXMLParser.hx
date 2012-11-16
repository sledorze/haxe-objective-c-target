package objc.foundation;


extern class NSXMLParser
{

	//Constants

	//Static Methods

	//Properties

	//Methods
	public  function setShouldResolveExternalEntities( shouldResolveExternalEntities:Bool):Void;
	public  function parse():Bool;
	public  function initWithStream( stream:NSInputStream):Dynamic;
	public  function shouldResolveExternalEntities():Bool;
	public  function setShouldReportNamespacePrefixes( shouldReportNamespacePrefixes:Bool):Void;
	public  function initWithContentsOfURL( url:NSURL):Dynamic;
	public  function columnNumber():Int;
	public  function initWithData( data:NSData):Dynamic;
	public  function setShouldProcessNamespaces( shouldProcessNamespaces:Bool):Void;
	public  function shouldReportNamespacePrefixes():Bool;
	public  function delegate():id<NSXMLParserDelegate>;
	public  function setDelegate( delegate:id<NSXMLParserDelegate>):Void;
	public  function parser( parser:NSXMLParser,  name:String,  publicID:String,  systemID:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function parser1( parser:NSXMLParser,  name:String,  publicID:String,  systemID:String,  notationName:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function parser2( parser:NSXMLParser,  attributeName:String,  elementName:String,  type:String,  defaultValue:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function parser3( parser:NSXMLParser,  elementName:String,  model:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function parser4( parser:NSXMLParser,  name:String,  value:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function parser5( parser:NSXMLParser,  name:String,  publicID:String,  systemID:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function parser6( parser:NSXMLParser,  elementName:String,  namespaceURI:String,  qName:String,  attributeDict:NSDictionary):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function parser7( parser:NSXMLParser,  elementName:String,  namespaceURI:String,  qName:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function parser8( parser:NSXMLParser,  prefix:String,  namespaceURI:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function parser9( parser:NSXMLParser,  prefix:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function parser10( parser:NSXMLParser,  string:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function parser11( parser:NSXMLParser,  whitespaceString:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function parser12( parser:NSXMLParser,  target:String,  data:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function parser13( parser:NSXMLParser,  comment:String):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function parser14( parser:NSXMLParser,  CDATABlock:NSData):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function parser15( parser:NSXMLParser,  name:String,  systemID:String):NSData;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function parser16( parser:NSXMLParser,  parseError:NSError):Void;
	//@:overload !!NEED CUSTOM META DATA !!
	public  function parser17( parser:NSXMLParser,  validationError:NSError):Void;
	public  function shouldProcessNamespaces():Bool;
	public  function abortParsing():Void;
	public  function parserDidEndDocument( parser:NSXMLParser):Void;
	public  function parserError():NSError;
	public  function lineNumber():Int;
	public  function parserDidStartDocument( parser:NSXMLParser):Void;
	public  function publicID():String;
	public  function systemID():String;
}

extern enum NSXMLParserError
{
	NSXMLParserInternalError;
	NSXMLParserOutOfMemoryError;
	NSXMLParserDocumentStartError;
	NSXMLParserEmptyDocumentError;
	NSXMLParserPrematureDocumentEndError;
	NSXMLParserInvalidHexCharacterRefError;
	NSXMLParserInvalidDecimalCharacterRefError;
	NSXMLParserInvalidCharacterRefError;
	NSXMLParserInvalidCharacterError;
	NSXMLParserCharacterRefAtEOFError;
	NSXMLParserCharacterRefInPrologError;
	NSXMLParserCharacterRefInEpilogError;
	NSXMLParserCharacterRefInDTDError;
	NSXMLParserEntityRefAtEOFError;
	NSXMLParserEntityRefInPrologError;
	NSXMLParserEntityRefInEpilogError;
	NSXMLParserEntityRefInDTDError;
	NSXMLParserParsedEntityRefAtEOFError;
	NSXMLParserParsedEntityRefInPrologError;
	NSXMLParserParsedEntityRefInEpilogError;
	NSXMLParserParsedEntityRefInInternalSubsetError;
	NSXMLParserEntityReferenceWithoutNameError;
	NSXMLParserEntityReferenceMissingSemiError;
	NSXMLParserParsedEntityRefNoNameError;
	NSXMLParserParsedEntityRefMissingSemiError;
	NSXMLParserUndeclaredEntityError;
	NSXMLParserUnparsedEntityError;
	NSXMLParserEntityIsExternalError;
	NSXMLParserEntityIsParameterError;
	NSXMLParserUnknownEncodingError;
	NSXMLParserEncodingNotSupportedError;
	NSXMLParserStringNotStartedError;
	NSXMLParserStringNotClosedError;
	NSXMLParserNamespaceDeclarationError;
	NSXMLParserEntityNotStartedError;
	NSXMLParserEntityNotFinishedError;
	NSXMLParserLessThanSymbolInAttributeError;
	NSXMLParserAttributeNotStartedError;
	NSXMLParserAttributeNotFinishedError;
	NSXMLParserAttributeHasNoValueError;
	NSXMLParserAttributeRedefinedError;
	NSXMLParserLiteralNotStartedError;
	NSXMLParserLiteralNotFinishedError;
	NSXMLParserCommentNotFinishedError;
	NSXMLParserProcessingInstructionNotStartedError;
	NSXMLParserProcessingInstructionNotFinishedError;
	NSXMLParserNotationNotStartedError;
	NSXMLParserNotationNotFinishedError;
	NSXMLParserAttributeListNotStartedError;
	NSXMLParserAttributeListNotFinishedError;
	NSXMLParserMixedContentDeclNotStartedError;
	NSXMLParserMixedContentDeclNotFinishedError;
	NSXMLParserElementContentDeclNotStartedError;
	NSXMLParserElementContentDeclNotFinishedError;
	NSXMLParserXMLDeclNotStartedError;
	NSXMLParserXMLDeclNotFinishedError;
	NSXMLParserConditionalSectionNotStartedError;
	NSXMLParserConditionalSectionNotFinishedError;
	NSXMLParserExternalSubsetNotFinishedError;
	NSXMLParserDOCTYPEDeclNotFinishedError;
	NSXMLParserMisplacedCDATAEndStringError;
	NSXMLParserCDATANotFinishedError;
	NSXMLParserMisplacedXMLDeclarationError;
	NSXMLParserSpaceRequiredError;
	NSXMLParserSeparatorRequiredError;
	NSXMLParserNMTOKENRequiredError;
	NSXMLParserNAMERequiredError;
	NSXMLParserPCDATARequiredError;
	NSXMLParserURIRequiredError;
	NSXMLParserPublicIdentifierRequiredError;
	NSXMLParserLTRequiredError;
	NSXMLParserGTRequiredError;
	NSXMLParserLTSlashRequiredError;
	NSXMLParserEqualExpectedError;
	NSXMLParserTagNameMismatchError;
	NSXMLParserUnfinishedTagError;
	NSXMLParserStandaloneValueError;
	NSXMLParserInvalidEncodingNameError;
	NSXMLParserCommentContainsDoubleHyphenError;
	NSXMLParserInvalidEncodingError;
	NSXMLParserExternalStandaloneEntityError;
	NSXMLParserInvalidConditionalSectionError;
	NSXMLParserEntityValueRequiredError;
	NSXMLParserNotWellBalancedError;
	NSXMLParserExtraContentError;
	NSXMLParserInvalidCharacterInEntityError;
	NSXMLParserParsedEntityRefInInternalError;
	NSXMLParserEntityRefLoopError;
	NSXMLParserEntityBoundaryError;
	NSXMLParserInvalidURIError;
	NSXMLParserURIFragmentError;
	NSXMLParserNoDTDError;
	NSXMLParserDelegateAbortedParseError;
}

