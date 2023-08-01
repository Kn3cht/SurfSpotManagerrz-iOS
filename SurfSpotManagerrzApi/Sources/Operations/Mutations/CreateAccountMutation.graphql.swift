// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateAccountMutation: GraphQLMutation {
  public static let operationName: String = "CreateAccount"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation CreateAccount($username: String!, $email: String!, $password: String!) { createAccount(username: $username, email: $email, password: $password) { __typename ...AuthorizationResponseFragment } }"#,
      fragments: [AuthorizationResponseFragment.self, UserFragment.self]
    ))

  public var username: String
  public var email: String
  public var password: String

  public init(
    username: String,
    email: String,
    password: String
  ) {
    self.username = username
    self.email = email
    self.password = password
  }

  public var __variables: Variables? { [
    "username": username,
    "email": email,
    "password": password
  ] }

  public struct Data: SurfSpotManagerrzApi.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SurfSpotManagerrzApi.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("createAccount", CreateAccount?.self, arguments: [
        "username": .variable("username"),
        "email": .variable("email"),
        "password": .variable("password")
      ]),
    ] }

    public var createAccount: CreateAccount? { __data["createAccount"] }

    /// CreateAccount
    ///
    /// Parent Type: `AuthorizationResponse`
    public struct CreateAccount: SurfSpotManagerrzApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { SurfSpotManagerrzApi.Objects.AuthorizationResponse }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(AuthorizationResponseFragment.self),
      ] }

      public var token: String? { __data["token"] }
      public var user: User? { __data["user"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var authorizationResponseFragment: AuthorizationResponseFragment { _toFragment() }
      }

      /// CreateAccount.User
      ///
      /// Parent Type: `User`
      public struct User: SurfSpotManagerrzApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { SurfSpotManagerrzApi.Objects.User }

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
}
