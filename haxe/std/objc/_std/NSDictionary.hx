
extern class NSDictionary extends NSObject {
	
	public function count () :Int;
	public function objectForKey (aKey:Dynamic) :Dynamic;
/*	public keyEnumerator () :NSEnumerator;*/
	
}
/*
@interface NSDictionary (NSExtendedDictionary)

- (NSArray *)allKeys;
- (NSArray *)allKeysForObject:(id)anObject;    
- (NSArray *)allValues;
- (NSString *)description;
- (NSString *)descriptionInStringsFileFormat;
- (NSString *)descriptionWithLocale:(id)locale;
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level;
- (BOOL)isEqualToDictionary:(NSDictionary *)otherDictionary;
- (NSEnumerator *)objectEnumerator;
- (NSArray *)objectsForKeys:(NSArray *)keys notFoundMarker:(id)marker;
- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile;
- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)atomically; // the atomically flag is ignored if url of a type that cannot be written atomically.

- (NSArray *)keysSortedByValueUsingSelector:(SEL)comparator;
- (void)getObjects:(id __unsafe_unretained [])objects andKeys:(id __unsafe_unretained [])keys;


	public static function dictionary () :Dynamic;
	public static function dictionaryWithObject (object:Dynamic, forKey:Dynamic) :Dynamic;

+ (id)dictionaryWithObjects:(const id [])objects forKeys:(const id [])keys count:(NSUInteger)cnt;
+ (id)dictionaryWithObjectsAndKeys:(id)firstObject, ... NS_REQUIRES_NIL_TERMINATION;
+ (id)dictionaryWithDictionary:(NSDictionary *)dict;
+ (id)dictionaryWithObjects:(NSArray *)objects forKeys:(NSArray *)keys;

- (id)initWithObjects:(const id [])objects forKeys:(const id [])keys count:(NSUInteger)cnt;
- (id)initWithObjectsAndKeys:(id)firstObject, ... NS_REQUIRES_NIL_TERMINATION;
- (id)initWithDictionary:(NSDictionary *)otherDictionary;
- (id)initWithDictionary:(NSDictionary *)otherDictionary copyItems:(BOOL)flag;
- (id)initWithObjects:(NSArray *)objects forKeys:(NSArray *)keys;

+ (id)dictionaryWithContentsOfFile:(NSString *)path;
+ (id)dictionaryWithContentsOfURL:(NSURL *)url;
- (id)initWithContentsOfFile:(NSString *)path;
- (id)initWithContentsOfURL:(NSURL *)url;

@end


@interface NSMutableDictionary : NSDictionary

- (void)removeObjectForKey:(id)aKey;
- (void)setObject:(id)anObject forKey:(id)aKey;

@end

@interface NSMutableDictionary (NSExtendedMutableDictionary)

- (void)addEntriesFromDictionary:(NSDictionary *)otherDictionary;
- (void)removeAllObjects;
- (void)removeObjectsForKeys:(NSArray *)keyArray;
- (void)setDictionary:(NSDictionary *)otherDictionary;

@end

@interface NSMutableDictionary (NSMutableDictionaryCreation)

+ (id)dictionaryWithCapacity:(NSUInteger)numItems;
- (id)initWithCapacity:(NSUInteger)numItems;

}
*/