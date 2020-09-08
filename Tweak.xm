@interface WKWebsiteDataStore
    + (id) safari_dataStoreWithConfiguration:(id)config;
    + (id) safari_nonPersistentDataStore;
    + (id) safari_defaultDataStoreDisallowingTLSFallback;
    + (id) safari_allDataTypes;
    + (id) safari_clearHSTSSuperCookies;

    + (id) nonPersistentDataStore;
    + (id) defaultDataStore;
    + (id) allWebsiteDataTypes;

    + (id) _allWebsiteDataTypesIncludingPrivate;

    - (BOOL) isPersistent;

    - (id) _initWithConfiguration:(id)config;

    - (NSString*) _sourceApplicationSecondaryIdentifier;
    - (NSString*) _sourceApplicationBundleIdentifier;
@end

@interface _WKWebsiteDataStoreConfiguration: NSObject
    - (instancetype) init;
@end

%hook WKWebViewConfiguration
    - (void) setWebsiteDataStore:(WKWebsiteDataStore *)store {
        _WKWebsiteDataStoreConfiguration *config = [[%c(_WKWebsiteDataStoreConfiguration) alloc] init];
        WKWebsiteDataStore *newStore = [%c(WKWebsiteDataStore) safari_dataStoreWithConfiguration: config];
        %orig(newStore);
    }
%end
