cask "notemac" do
  version "1.5.0"
  sha256 "3192a094d483cac17565464283817a26e036bc2631ba4298d5ddb72bc833ef45"

  # Die Fassung 1.5.0 heisst noch Griffel (DMG, App und Befehl im Bündel); ab der
  # nächsten heisst sie NoteMac++. Der Befehl fürs Terminal heisst schon notemac.
  url "https://github.com/simon-baumhauer/notemac/releases/download/v#{version}/Griffel-#{version}.dmg"
  name "NoteMac++"
  name "Griffel"
  desc "Text editor modelled after Notepad++"
  homepage "https://github.com/simon-baumhauer/notemac"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Griffel.app"
  binary "#{appdir}/Griffel.app/Contents/Resources/griffel", target: "notemac"

  # Die Fassung 1.5.0 ist noch nicht von Apple beglaubigt; macOS meldete beim
  # ersten Öffnen «Not Opened». Bis zur ersten beglaubigten Fassung entfernt der
  # Cask darum die Quarantäne-Markierung, wie es das README für das DMG
  # beschreibt. Das geschieht vor dem Verschieben nach «Programme»; -s nimmt die
  # Markierung auch von den Verknüpfungen im Framework.
  preflight_steps do
    run "/usr/bin/xattr", args: ["-d", "-r", "-s", "com.apple.quarantine", "{{staged_path}}/Griffel.app"]
  end

  zap trash: [
    "~/Library/Application Support/Griffel",
    "~/Library/Application Support/NoteMac++",
    "~/Library/Preferences/io.github.simon-baumhauer.kladde.plist",
  ]
end
