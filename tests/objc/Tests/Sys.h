

#import "Sys.h"
#import "Input.h"
#import "FileInput.h"
#import "Output.h"
#import "FileOutput.h"
#import "Array.h"
#import "Hash.h"

@interface Sys : NSObject

+ (void) print:(id)v;
+ (void) println:(id)v;
+ (Input*) stdin;
+ (Output*) stdout;
+ (Output*) stderr;
+ (int) getChar:(BOOL)echo;
+ (NSMutabeArray*) args;
+ (NSMutableString*) getEnv:(NSMutableString*)s;
+ (void) putEnv:(NSMutableString*)s v:(NSMutableString*)v;
+ (void) sleep:(float)seconds;
+ (BOOL) setTimeLocale:(NSMutableString*)loc;
+ (NSMutableString*) getCwd;
+ (void) setCwd:(NSMutableString*)s;
+ (NSMutableString*) systemName;
+ (NSMutableString*) escapeArgument:(NSMutableString*)arg;
+ (int) command:(NSMutableString*)cmd args:(NSMutabeArray*)args;
+ (void) exit:(int)code;
+ (float) time;
+ (float) cpuTime;
+ (NSMutableString*) executablePath;
+ (Hash*) environment;

@end
