# SwiftUI MV Architecture

## Preview assets

The `PreviewAssets` target is intended to provide shared resources that are available for debug builds and previews but excluded in release builds. Ideally, this should be a proper feature of SwiftPM, but in its absence, this is achieved by manually copying folders.

As a safe default, resources in `_PreviewAssets.xcassets` (with an underscore) are excluded from builds. To include them, duplicate the whole folder to `PreviewAssets.xcassets` (without an underscore).
```sh
rm -rf Packages/Core/Sources/PreviewAssets/PreviewAssets.xcassets && cp -R Packages/Core/Sources/PreviewAssets/_PreviewAssets.xcassets Packages/Core/Sources/PreviewAssets/PreviewAssets.xcassets
```

`PreviewAssets.xcassets` (without an underscore) is not tracked by git, so any changes to it are local-only and temporary. To once again exclude development resources, delete this folder.
```sh
rm -rf Packages/Core/Sources/PreviewAssets/PreviewAssets.xcassets
```
