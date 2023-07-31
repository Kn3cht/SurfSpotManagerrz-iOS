// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == SurfSpotManagerrzApi.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == SurfSpotManagerrzApi.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == SurfSpotManagerrzApi.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == SurfSpotManagerrzApi.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> Object? {
    switch typename {
    case "Query": return SurfSpotManagerrzApi.Objects.Query
    case "User": return SurfSpotManagerrzApi.Objects.User
    case "Mutation": return SurfSpotManagerrzApi.Objects.Mutation
    case "CreateAccountResponse": return SurfSpotManagerrzApi.Objects.CreateAccountResponse
    case "SurfSpot": return SurfSpotManagerrzApi.Objects.SurfSpot
    case "Coordinates": return SurfSpotManagerrzApi.Objects.Coordinates
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
