cask "hotkey-detective" do
  version "1.0.7"
  sha256 "56126b5b326be615749241301bc46509c0d67bbb6121e7e2cfa613e1f1fc2842"

  url "https://github.com/goodbug89/hotkey-detective/releases/download/v#{version}/HotkeyDetective-#{version}.dmg"
  name "HotkeyDetective"
  desc "Menu-bar tool that identifies which app owns a keyboard shortcut"
  homepage "https://github.com/goodbug89/hotkey-detective"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "HotkeyDetective.app"

  # 앱이 남기는 것은 인벤토리 창 위치뿐이다. 로그인 항목은 SMAppService로 등록되며
  # 앱을 지우면 macOS가 정리하므로 별도 해제 단계가 필요 없다.
  zap trash: [
    "~/Library/Preferences/dev.goodbug.HotkeyDetective.plist",
    "~/Library/Saved Application State/dev.goodbug.HotkeyDetective.savedState",
  ]
end
