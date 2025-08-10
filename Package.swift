// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "Tun2SocksKit",
  products: [
    .library(
        name: "Tun2SocksKit",
        targets: ["Tun2SocksKit"]
    ),
    .library(
        name: "Tun2SocksKitC",
        targets: ["Tun2SocksKitC"]
    )
  ],
  targets: [
      .binaryTarget(
          name: "HevSocks5Tunnel",
          path: "Vendor/HevSocks5Tunnel.xcframework"
      ),
      .target(
          name: "Tun2SocksKitC",
          path: "Sources/Tun2SocksKitC",
          publicHeadersPath: ".",
          cSettings: [.headerSearchPath(".")]
      ),
      .target(
          name: "Tun2SocksKit",
          dependencies: ["HevSocks5Tunnel", "Tun2SocksKitC"],
          path: "Sources/Tun2SocksKit"
      )
  ]
)
