# Homebrew-Tap von Simon Baumhauer

Hier liegt der Cask für [Griffel](https://github.com/simon-baumhauer/griffel), einen Texteditor für den
Mac nach dem Vorbild von Notepad++.

## Installieren

```bash
brew install --cask simon-baumhauer/tap/griffel
```

Das legt Griffel unter «Programme» an und dazu den Befehl `griffel` fürs Terminal. Homebrew vertraut
damit nur diesem einen Cask, nicht dem ganzen Tap.

Aktualisieren mit `brew upgrade --cask griffel`, entfernen mit `brew uninstall --cask griffel`. Mit
`--zap` gehen auch Einstellungen, Sitzung und benutzerdefinierte Sprachen.

## Beglaubigung

Griffel 1.5.0 ist noch nicht von Apple beglaubigt. Damit macOS die App trotzdem ohne die Meldung
«“Griffel” Not Opened» öffnet, entfernt der Cask nach der Installation die Quarantäne-Markierung von
Griffel.app; Gatekeeper prüft die App dann nicht. Mit der ersten beglaubigten Fassung fällt dieser
Schritt weg.
