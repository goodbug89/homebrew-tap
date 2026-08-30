cask "hotkey-detective" do
  version "1.0.4"
  sha256 "3888c5c25354869fa83f23063565e0725baf8ce65a6d06812bd83f77ca1fbb80"

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
