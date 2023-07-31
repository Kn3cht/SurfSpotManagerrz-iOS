// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct CoordinatesInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    lat: GraphQLNullable<Double> = nil,
    lon: GraphQLNullable<Double> = nil
  ) {
    __data = InputDict([
      "lat": lat,
      "lon": lon
    ])
  }

  public var lat: GraphQLNullable<Double> {
    get { __data["lat"] }
    set { __data["lat"] = newValue }
  }

  public var lon: GraphQLNullable<Double> {
    get { __data["lon"] }
    set { __data["lon"] = newValue }
  }
}
