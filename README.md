# SwiftUI-First Architecture Demo

This repository showcases the architecture I use to structure my apps. Check out the article for more detail:

- [SwiftUI-First Architecture](https://apurin.me/articles/swiftui-first/)

<p align=left><img width=256 src=./Assets/Screenshot.png></p>

The demo project uses [Dog API](https://dog.ceo/dog-api/) to fetch images of dogs.

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
