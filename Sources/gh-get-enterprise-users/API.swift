// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ListUsersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ListUsers($slug: String!, $cursor: String) {
      enterprise(slug: $slug) {
        __typename
        ownerInfo {
          __typename
          samlIdentityProvider {
            __typename
            externalIdentities(first: 100, after: $cursor) {
              __typename
              pageInfo {
                __typename
                endCursor
                hasNextPage
                hasPreviousPage
                startCursor
              }
              edges {
                __typename
                node {
                  __typename
                  samlIdentity {
                    __typename
                    nameId
                  }
                  user {
                    __typename
                    login
                  }
                }
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "ListUsers"

  public var slug: String
  public var cursor: String?

  public init(slug: String, cursor: String? = nil) {
    self.slug = slug
    self.cursor = cursor
  }

  public var variables: GraphQLMap? {
    return ["slug": slug, "cursor": cursor]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("enterprise", arguments: ["slug": GraphQLVariable("slug")], type: .object(Enterprise.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(enterprise: Enterprise? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "enterprise": enterprise.flatMap { (value: Enterprise) -> ResultMap in value.resultMap }])
    }

    /// Look up an enterprise by URL slug.
    public var enterprise: Enterprise? {
      get {
        return (resultMap["enterprise"] as? ResultMap).flatMap { Enterprise(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "enterprise")
      }
    }

    public struct Enterprise: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Enterprise"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ownerInfo", type: .object(OwnerInfo.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ownerInfo: OwnerInfo? = nil) {
        self.init(unsafeResultMap: ["__typename": "Enterprise", "ownerInfo": ownerInfo.flatMap { (value: OwnerInfo) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Enterprise information only visible to enterprise owners.
      public var ownerInfo: OwnerInfo? {
        get {
          return (resultMap["ownerInfo"] as? ResultMap).flatMap { OwnerInfo(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "ownerInfo")
        }
      }

      public struct OwnerInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["EnterpriseOwnerInfo"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("samlIdentityProvider", type: .object(SamlIdentityProvider.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(samlIdentityProvider: SamlIdentityProvider? = nil) {
          self.init(unsafeResultMap: ["__typename": "EnterpriseOwnerInfo", "samlIdentityProvider": samlIdentityProvider.flatMap { (value: SamlIdentityProvider) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The SAML Identity Provider for the enterprise. When used by a GitHub App,
        /// requires an installation token with read and write access to members.
        public var samlIdentityProvider: SamlIdentityProvider? {
          get {
            return (resultMap["samlIdentityProvider"] as? ResultMap).flatMap { SamlIdentityProvider(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "samlIdentityProvider")
          }
        }

        public struct SamlIdentityProvider: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["EnterpriseIdentityProvider"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("externalIdentities", arguments: ["first": 100, "after": GraphQLVariable("cursor")], type: .nonNull(.object(ExternalIdentity.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(externalIdentities: ExternalIdentity) {
            self.init(unsafeResultMap: ["__typename": "EnterpriseIdentityProvider", "externalIdentities": externalIdentities.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// ExternalIdentities provisioned by this identity provider.
          public var externalIdentities: ExternalIdentity {
            get {
              return ExternalIdentity(unsafeResultMap: resultMap["externalIdentities"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "externalIdentities")
            }
          }

          public struct ExternalIdentity: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["ExternalIdentityConnection"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
                GraphQLField("edges", type: .list(.object(Edge.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(pageInfo: PageInfo, edges: [Edge?]? = nil) {
              self.init(unsafeResultMap: ["__typename": "ExternalIdentityConnection", "pageInfo": pageInfo.resultMap, "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Information to aid in pagination.
            public var pageInfo: PageInfo {
              get {
                return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
              }
            }

            /// A list of edges.
            public var edges: [Edge?]? {
              get {
                return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
              }
              set {
                resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
              }
            }

            public struct PageInfo: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["PageInfo"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("endCursor", type: .scalar(String.self)),
                  GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
                  GraphQLField("hasPreviousPage", type: .nonNull(.scalar(Bool.self))),
                  GraphQLField("startCursor", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(endCursor: String? = nil, hasNextPage: Bool, hasPreviousPage: Bool, startCursor: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage, "hasPreviousPage": hasPreviousPage, "startCursor": startCursor])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// When paginating forwards, the cursor to continue.
              public var endCursor: String? {
                get {
                  return resultMap["endCursor"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "endCursor")
                }
              }

              /// When paginating forwards, are there more items?
              public var hasNextPage: Bool {
                get {
                  return resultMap["hasNextPage"]! as! Bool
                }
                set {
                  resultMap.updateValue(newValue, forKey: "hasNextPage")
                }
              }

              /// When paginating backwards, are there more items?
              public var hasPreviousPage: Bool {
                get {
                  return resultMap["hasPreviousPage"]! as! Bool
                }
                set {
                  resultMap.updateValue(newValue, forKey: "hasPreviousPage")
                }
              }

              /// When paginating backwards, the cursor to continue.
              public var startCursor: String? {
                get {
                  return resultMap["startCursor"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "startCursor")
                }
              }
            }

            public struct Edge: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ExternalIdentityEdge"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("node", type: .object(Node.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(node: Node? = nil) {
                self.init(unsafeResultMap: ["__typename": "ExternalIdentityEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The item at the end of the edge.
              public var node: Node? {
                get {
                  return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "node")
                }
              }

              public struct Node: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["ExternalIdentity"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("samlIdentity", type: .object(SamlIdentity.selections)),
                    GraphQLField("user", type: .object(User.selections)),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(samlIdentity: SamlIdentity? = nil, user: User? = nil) {
                  self.init(unsafeResultMap: ["__typename": "ExternalIdentity", "samlIdentity": samlIdentity.flatMap { (value: SamlIdentity) -> ResultMap in value.resultMap }, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// SAML Identity attributes
                public var samlIdentity: SamlIdentity? {
                  get {
                    return (resultMap["samlIdentity"] as? ResultMap).flatMap { SamlIdentity(unsafeResultMap: $0) }
                  }
                  set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "samlIdentity")
                  }
                }

                /// User linked to this external identity. Will be NULL if this identity has not been claimed by an organization member.
                public var user: User? {
                  get {
                    return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
                  }
                  set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "user")
                  }
                }

                public struct SamlIdentity: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["ExternalIdentitySamlAttributes"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("nameId", type: .scalar(String.self)),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(nameId: String? = nil) {
                    self.init(unsafeResultMap: ["__typename": "ExternalIdentitySamlAttributes", "nameId": nameId])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The NameID of the SAML identity
                  public var nameId: String? {
                    get {
                      return resultMap["nameId"] as? String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "nameId")
                    }
                  }
                }

                public struct User: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["User"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("login", type: .nonNull(.scalar(String.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(login: String) {
                    self.init(unsafeResultMap: ["__typename": "User", "login": login])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The username used to login.
                  public var login: String {
                    get {
                      return resultMap["login"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "login")
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
