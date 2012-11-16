package objc.foundation;


extern class NSCompoundPredicate extends NSPredicate
{

	//Constants

	//Static Methods
	public  function notPredicateWithSubpredicate( predicate:NSPredicate):NSPredicate;
	public  function andPredicateWithSubpredicates( subpredicates:NSArray):NSPredicate;
	public  function orPredicateWithSubpredicates( subpredicates:NSArray):NSPredicate;

	//Properties

	//Methods
	public  function subpredicates():NSArray;
	public  function compoundPredicateType():NSCompoundPredicateType;
	public  function initWithType( type:NSCompoundPredicateType,  subpredicates:NSArray):Dynamic;
}

extern enum NSCompoundPredicateType
{
	NSNotPredicateType;
	NSAndPredicateType;
	NSOrPredicateType;
}

