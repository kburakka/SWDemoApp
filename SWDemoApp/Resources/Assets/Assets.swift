// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum Asset {
  public enum Colors {
    public static let appAlabaster = ColorAsset(name: "appAlabaster")
    public static let appAlto = ColorAsset(name: "appAlto")
    public static let appBlack = ColorAsset(name: "appBlack")
    public static let appConcrete = ColorAsset(name: "appConcrete")
    public static let appCyan = ColorAsset(name: "appCyan")
    public static let appFuchsia = ColorAsset(name: "appFuchsia")
    public static let appShaft = ColorAsset(name: "appShaft")
    public static let appWhite = ColorAsset(name: "appWhite")
  }
  public enum Images {
    public static let imgBedroom = ImageAsset(name: "imgBedroom")
    public static let imgClothes = ImageAsset(name: "imgClothes")
    public static let imgDevices = ImageAsset(name: "imgDevices")
    public static let imgElectrical = ImageAsset(name: "imgElectrical")
    public static let imgFirstaid = ImageAsset(name: "imgFirstaid")
    public static let imgGadget = ImageAsset(name: "imgGadget")
    public static let imgXmlid = ImageAsset(name: "imgXmlid")
    public static let imgBell = ImageAsset(name: "imgBell")
    public static let imgHamburger = ImageAsset(name: "imgHamburger")
    public static let imgSearch = ImageAsset(name: "imgSearch")
    public static let appIcon = ImageAsset(name: "appIcon")
    public static let appIconNav = ImageAsset(name: "appIconNav")
    public static let imgBuilding = ImageAsset(name: "imgBuilding")
    public static let imgClose = ImageAsset(name: "imgClose")
    public static let imgHidePassword = ImageAsset(name: "imgHidePassword")
    public static let imgPlay = ImageAsset(name: "imgPlay")
    public static let imgShowPassword = ImageAsset(name: "imgShowPassword")
    public static let imgUser = ImageAsset(name: "imgUser")
    public static let imgVideoImage = ImageAsset(name: "imgVideoImage")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class ColorAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

public struct ImageAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

public extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
