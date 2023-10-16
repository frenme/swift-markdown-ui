import Nuke
import SwiftUI

/// The default inline image provider, which loads images from the network.
public struct DefaultInlineImageProvider: InlineImageProvider {
    @MainActor public func image(with url: URL, label: String) async throws -> Image {
        guard let cgImage = try await ImagePipeline.shared.image(for: url).cgImage else { return .init(uiImage: .init()) }
        return Image(cgImage, scale: 1, label: Text(label))
    }
}

extension InlineImageProvider where Self == DefaultInlineImageProvider {
  /// The default inline image provider, which loads images from the network.
  ///
  /// Use the `markdownInlineImageProvider(_:)` modifier to configure
  /// this image provider for a view hierarchy.
  public static var `default`: Self {
    .init()
  }
}
