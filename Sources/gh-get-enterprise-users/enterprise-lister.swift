import Apollo
import ArgumentParser
import Foundation

@main
struct EnterpriseLister: ParsableCommand {
    
    @Option
    var enterpriseSlug: String
    
    @Option
    var authToken: String

    struct SamlMapping {
        var samlID: String
        var githubID: String
    }

    mutating func run() throws {
        var done = false
        let url = URL(string: "https://api.github.com/graphql")!
        
        let store = ApolloStore(cache: InMemoryNormalizedCache())
        let urlSessionClient = URLSessionClient(sessionConfiguration: URLSessionConfiguration.ephemeral, callbackQueue: .main)
        let provider = DefaultInterceptorProvider(client: urlSessionClient, store: store)
        let transport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                     endpointURL: url,
                                                     additionalHeaders: ["Authorization": "Bearer \(authToken)"],
                                                     useGETForQueries: false)
        
        let client = ApolloClient(networkTransport: transport, store: store)
        
        // we have to capture this in a `let` otherwise Swift complains the async function below mutates
        let slug = self.enterpriseSlug
        
        DispatchQueue(label: "work", attributes: .concurrent).async {
            var cursor: String? = nil
            
            let semaphor = DispatchSemaphore(value: 0)
            
            while true {
                let query = ListUsersQuery(slug: slug, cursor: cursor)
                
                client.fetch(query: query) { result in
                    // This is the outer Result, which has either a `GraphQLResult` or an `Error`
                    switch result {

                    case .failure(let error):
                        // If this happens, something's gone wrong at the network level before the GraphQL server could respond.
                        print("Network error: \(error)")
                        done = true

                    case .success(let graphQLResult):
                        if let errors = graphQLResult.errors {
                            // Errors here were returned by the GraphQL system.
                            print("GraphQL errors: \(errors)")
                            done = true
                        }
                        
                        if let data = graphQLResult.data {
                            let userList = data.enterprise?.ownerInfo?.samlIdentityProvider?.externalIdentities.edges
                            
                            userList?.forEach { userEntry in
                                let samlID = userEntry?.node?.samlIdentity?.nameId ?? "[unknown]"
                                let githubID = userEntry?.node?.user?.login ?? "[unknown]"
                                
                                print("\(samlID)\t\(githubID)")
                                
                                if data.enterprise?.ownerInfo?.samlIdentityProvider?.externalIdentities.pageInfo.hasNextPage != false {
                                    cursor = data.enterprise?.ownerInfo?.samlIdentityProvider?.externalIdentities.pageInfo.endCursor
                                } else {
                                    // stop
                                    done = true
                                }
                            }
                        }
                    }
                    
                    // signal the background queue to do another task
                    semaphor.signal()
                }
                
                // waits for the loop to signal
                semaphor.wait()
                
            }
        }
        
        autoreleasepool {
            print("SAML ID\tGitHub Account")
            let runLoop = RunLoop.current
            while (!done && (runLoop.run(mode: .default, before: .distantFuture))) {}
        }
    }
}
