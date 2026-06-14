cask "bingwallpaper" do
  version "0.5.4"
  sha256 "05f2f3ebf02ea916fdc6aa21cb8249a57121580c69f7764da190c937701b4cf6"

  url "https://github.com/vb3/BingWallpaper-for-Mac/releases/download/v#{version}/BingWallpaper_v#{version}.zip"
  name "BingWallpaper"
  desc "Menu-bar app that sets the daily Bing image as your wallpaper"
  homepage "https://github.com/vb3/BingWallpaper-for-Mac"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "BingWallpaper.app"

  postflight do
    # The build is ad-hoc signed (not notarized), so strip the quarantine
    # attribute Homebrew sets on download to avoid a Gatekeeper block on first launch.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/BingWallpaper.app"]
  end

  uninstall quit: "com.vb3.BingWallpaper"

  zap trash: [
    "~/Library/Containers/com.vb3.BingWallpaper",
    "~/Pictures/bing-wallpapers",
  ]

  caveats <<~EOS
    BingWallpaper is ad-hoc signed and not notarized by Apple. This cask clears the
    quarantine attribute on install so it opens normally. If macOS still warns that the
    developer cannot be verified, right-click the app and choose Open, or run:
      xattr -dr com.apple.quarantine "#{appdir}/BingWallpaper.app"
  EOS
end
