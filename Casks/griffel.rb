cask "griffel" do
  version "1.5.0"
  sha256 "3192a094d483cac17565464283817a26e036bc2631ba4298d5ddb72bc833ef45"

  url "https://github.com/simon-baumhauer/griffel/releases/download/v#{version}/Griffel-#{version}.dmg"
  name "Griffel"
  desc "Text editor modelled after Notepad++"
  homepage "https://github.com/simon-baumhauer/griffel"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Griffel.app"
  binary "#{appdir}/Griffel.app/Contents/Resources/griffel"

  # Griffel 1.5.0 ist noch nicht von Apple beglaubigt; macOS meldete beim ersten
  # Öffnen «“Griffel” Not Opened». Bis zur ersten beglaubigten Fassung entfernt der
  # Cask darum die Quarantäne-Markierung, wie es das README von Griffel für das DMG
  # beschreibt. Das geschieht vor dem Verschieben nach «Programme»; -s nimmt die
  # Markierung auch von den Verknüpfungen im Framework.
  preflight_steps do
    run "/usr/bin/xattr", args: ["-d", "-r", "-s", "com.apple.quarantine", "{{staged_path}}/Griffel.app"]
  end

  zap trash: [
    "~/Library/Application Support/Griffel",
    "~/Library/Preferences/io.github.simon-baumhauer.kladde.plist",
  ]
end
