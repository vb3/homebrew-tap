# vb3/homebrew-tap

A [Homebrew](https://brew.sh) tap for my macOS apps.

## BingWallpaper

A lightweight menu-bar app that sets the daily [Bing wallpaper](https://www.microsoft.com/bing/bing-wallpaper)
as your desktop picture across all displays. See
[vb3/BingWallpaper-for-Mac](https://github.com/vb3/BingWallpaper-for-Mac).

```sh
brew install --cask vb3/tap/bingwallpaper
```

To upgrade later:

```sh
brew update && brew upgrade --cask bingwallpaper
```

To remove it (add `--zap` to also delete its container and saved wallpapers):

```sh
brew uninstall --cask bingwallpaper
```

> **Note:** the app is ad-hoc signed and not notarized by Apple. The cask clears the
> download quarantine on install so it launches normally.
