// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct CoordinatesFragment: SurfSpotManagerrzApi.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    "fragment CoordinatesFragment on Coordinates { __typename lat lon }"
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { SurfSpotManagerrzApi.Objects.Coordinates }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("lat", Double.self),
    .field("lon", Double.self),
  ] }

  public var lat: Double { __data["lat"] }
  public var lon: Double { __data["lon"] }
}
