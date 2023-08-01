// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct CoordinatesInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    lat: Double,
    lon: Double
  ) {
    __data = InputDict([
      "lat": lat,
      "lon": lon
    ])
  }

  public var lat: Double {
    get { __data["lat"] }
    set { __data["lat"] = newValue }
  }

  public var lon: Double {
    get { __data["lon"] }
    set { __data["lon"] = newValue }
  }
}
