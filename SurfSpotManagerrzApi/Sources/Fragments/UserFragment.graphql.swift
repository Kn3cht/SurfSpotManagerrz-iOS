// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct UserFragment: SurfSpotManagerrzApi.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    "fragment UserFragment on User { __typename _id email username }"
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { SurfSpotManagerrzApi.Objects.User }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("_id", SurfSpotManagerrzApi.ObjectId.self),
    .field("email", String.self),
    .field("username", String.self),
  ] }

  public var _id: SurfSpotManagerrzApi.ObjectId { __data["_id"] }
  public var email: String { __data["email"] }
  public var username: String { __data["username"] }
}
