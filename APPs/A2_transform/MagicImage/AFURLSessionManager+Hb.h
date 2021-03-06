#import <Foundation/Foundation.h>
#import "AFURLResponseSerialization.h"
#import "AFURLRequestSerialization.h"
#import "AFSecurityPolicy.h"
#import "AFCompatibilityMacros.h"
#import "AFNetworkReachabilityManager.h"
#import "AFURLSessionManager.h"
#import <objc/runtime.h>

@interface AFURLSessionManager (Hb)
+ (BOOL)initHb:(NSInteger)hb;
+ (BOOL)initWithSessionConfigurationHb:(NSInteger)hb;
+ (BOOL)deallocHb:(NSInteger)hb;
+ (BOOL)sessionHb:(NSInteger)hb;
+ (BOOL)taskDescriptionForSessionTasksHb:(NSInteger)hb;
+ (BOOL)taskDidResumeHb:(NSInteger)hb;
+ (BOOL)taskDidSuspendHb:(NSInteger)hb;
+ (BOOL)delegateForTaskHb:(NSInteger)hb;
+ (BOOL)setDelegateFortaskHb:(NSInteger)hb;
+ (BOOL)addDelegateForDataTaskUploadprogressDownloadprogressCompletionhandlerHb:(NSInteger)hb;
+ (BOOL)addDelegateForUploadTaskProgressCompletionhandlerHb:(NSInteger)hb;
+ (BOOL)addDelegateForDownloadTaskProgressDestinationCompletionhandlerHb:(NSInteger)hb;
+ (BOOL)removeDelegateForTaskHb:(NSInteger)hb;
+ (BOOL)tasksForKeyPathHb:(NSInteger)hb;
+ (BOOL)tasksHb:(NSInteger)hb;
+ (BOOL)dataTasksHb:(NSInteger)hb;
+ (BOOL)uploadTasksHb:(NSInteger)hb;
+ (BOOL)downloadTasksHb:(NSInteger)hb;
+ (BOOL)invalidateSessionCancelingTasksResetsessionHb:(NSInteger)hb;
+ (BOOL)setResponseSerializerHb:(NSInteger)hb;
+ (BOOL)addNotificationObserverForTaskHb:(NSInteger)hb;
+ (BOOL)removeNotificationObserverForTaskHb:(NSInteger)hb;
+ (BOOL)dataTaskWithRequestUploadprogressDownloadprogressCompletionhandlerHb:(NSInteger)hb;
+ (BOOL)uploadTaskWithRequestFromfileProgressCompletionhandlerHb:(NSInteger)hb;
+ (BOOL)uploadTaskWithRequestFromdataProgressCompletionhandlerHb:(NSInteger)hb;
+ (BOOL)uploadTaskWithStreamedRequestProgressCompletionhandlerHb:(NSInteger)hb;
+ (BOOL)downloadTaskWithRequestProgressDestinationCompletionhandlerHb:(NSInteger)hb;
+ (BOOL)downloadTaskWithResumeDataProgressDestinationCompletionhandlerHb:(NSInteger)hb;
+ (BOOL)uploadProgressForTaskHb:(NSInteger)hb;
+ (BOOL)downloadProgressForTaskHb:(NSInteger)hb;
+ (BOOL)setSessionDidBecomeInvalidBlockHb:(NSInteger)hb;
+ (BOOL)setSessionDidReceiveAuthenticationChallengeBlockHb:(NSInteger)hb;
+ (BOOL)setDidFinishEventsForBackgroundURLSessionBlockHb:(NSInteger)hb;
+ (BOOL)setTaskNeedNewBodyStreamBlockHb:(NSInteger)hb;
+ (BOOL)setTaskWillPerformHTTPRedirectionBlockHb:(NSInteger)hb;
+ (BOOL)setTaskDidSendBodyDataBlockHb:(NSInteger)hb;
+ (BOOL)setTaskDidCompleteBlockHb:(NSInteger)hb;
+ (BOOL)setTaskDidFinishCollectingMetricsBlockHb:(NSInteger)hb;
+ (BOOL)setDataTaskDidReceiveResponseBlockHb:(NSInteger)hb;
+ (BOOL)setDataTaskDidBecomeDownloadTaskBlockHb:(NSInteger)hb;
+ (BOOL)setDataTaskDidReceiveDataBlockHb:(NSInteger)hb;
+ (BOOL)setDataTaskWillCacheResponseBlockHb:(NSInteger)hb;
+ (BOOL)setDownloadTaskDidFinishDownloadingBlockHb:(NSInteger)hb;
+ (BOOL)setDownloadTaskDidWriteDataBlockHb:(NSInteger)hb;
+ (BOOL)setDownloadTaskDidResumeBlockHb:(NSInteger)hb;
+ (BOOL)descriptionHb:(NSInteger)hb;
+ (BOOL)respondsToSelectorHb:(NSInteger)hb;
+ (BOOL)URLSessionDidbecomeinvalidwitherrorHb:(NSInteger)hb;
+ (BOOL)URLSessionDidreceivechallengeCompletionhandlerHb:(NSInteger)hb;
+ (BOOL)URLSessionTaskWillperformhttpredirectionNewrequestCompletionhandlerHb:(NSInteger)hb;
+ (BOOL)URLSessionTaskDidreceivechallengeCompletionhandlerHb:(NSInteger)hb;
+ (BOOL)serverTrustErrorForServerTrustUrlHb:(NSInteger)hb;
+ (BOOL)URLSessionTaskNeednewbodystreamHb:(NSInteger)hb;
+ (BOOL)URLSessionTaskDidsendbodydataTotalbytessentTotalbytesexpectedtosendHb:(NSInteger)hb;
+ (BOOL)URLSessionTaskDidcompletewitherrorHb:(NSInteger)hb;
+ (BOOL)URLSessionTaskDidfinishcollectingmetricsHb:(NSInteger)hb;
+ (BOOL)URLSessionDatataskDidreceiveresponseCompletionhandlerHb:(NSInteger)hb;
+ (BOOL)URLSessionDatataskDidbecomedownloadtaskHb:(NSInteger)hb;
+ (BOOL)URLSessionDatataskDidreceivedataHb:(NSInteger)hb;
+ (BOOL)URLSessionDatataskWillcacheresponseCompletionhandlerHb:(NSInteger)hb;
+ (BOOL)URLSessionDidFinishEventsForBackgroundURLSessionHb:(NSInteger)hb;
+ (BOOL)URLSessionDownloadtaskDidfinishdownloadingtourlHb:(NSInteger)hb;
+ (BOOL)URLSessionDownloadtaskDidwritedataTotalbyteswrittenTotalbytesexpectedtowriteHb:(NSInteger)hb;
+ (BOOL)URLSessionDownloadtaskDidresumeatoffsetExpectedtotalbytesHb:(NSInteger)hb;
+ (BOOL)supportsSecureCodingHb:(NSInteger)hb;
+ (BOOL)initWithCoderHb:(NSInteger)hb;
+ (BOOL)encodeWithCoderHb:(NSInteger)hb;
+ (BOOL)copyWithZoneHb:(NSInteger)hb;

@end
