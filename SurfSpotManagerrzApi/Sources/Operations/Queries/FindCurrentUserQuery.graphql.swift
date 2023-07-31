// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class FindCurrentUserQuery: GraphQLQuery {
  public static let operationName: String = "FindCurrentUser"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query FindCurrentUser { findCurrentUser { __typename ...UserFragment } }"#,
      fragments: [UserFragment.self]
    ))

  public init() {}

  public struct Data: SurfSpotManagerrzApi.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SurfSpotManagerrzApi.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("findCurrentUser", FindCurrentUser?.self),
    ] }

    public var findCurrentUser: FindCurrentUser? { __data["findCurrentUser"] }

    /// FindCurrentUser
    ///
    /// Parent Type: `User`
    public struct FindCurrentUser: SurfSpotManagerrzApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { SurfSpotManagerrzApi.Objects.User }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(UserFragment.self),
      ] }

      public var _id: SurfSpotManagerrzApi.ObjectId { __data["_id"] }
      public var email: String { __data["email"] }
      public var username: String { __data["username"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var userFragment: UserFragment { _toFragment() }
      }
    }
  }
}
