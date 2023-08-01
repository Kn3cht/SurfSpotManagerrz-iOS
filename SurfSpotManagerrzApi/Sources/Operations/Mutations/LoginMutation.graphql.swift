// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class LoginMutation: GraphQLMutation {
  public static let operationName: String = "Login"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation Login($email: String!, $password: String!) { login(email: $email, password: $password) { __typename ...AuthorizationResponseFragment } }"#,
      fragments: [AuthorizationResponseFragment.self, UserFragment.self]
    ))

  public var email: String
  public var password: String

  public init(
    email: String,
    password: String
  ) {
    self.email = email
    self.password = password
  }

  public var __variables: Variables? { [
    "email": email,
    "password": password
  ] }

  public struct Data: SurfSpotManagerrzApi.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SurfSpotManagerrzApi.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("login", Login?.self, arguments: [
        "email": .variable("email"),
        "password": .variable("password")
      ]),
    ] }

    public var login: Login? { __data["login"] }

    /// Login
    ///
    /// Parent Type: `AuthorizationResponse`
    public struct Login: SurfSpotManagerrzApi.SelectionSet {
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

      /// Login.User
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
