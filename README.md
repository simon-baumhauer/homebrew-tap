# Homebrew-Tap von Simon Baumhauer

Hier liegt der Cask für [NoteMac++](https://github.com/simon-baumhauer/notemac), einen Texteditor für
den Mac nach dem Vorbild von Notepad++. NoteMac++ ist ein unabhängiges Projekt und gehört nicht zu
Notepad++.

## Installieren

```bash
brew install --cask simon-baumhauer/tap/notemac
```

Das legt die App unter «Programme» an und dazu den Befehl `notemac` fürs Terminal. Homebrew vertraut
damit nur diesem einen Cask, nicht dem ganzen Tap.

Aktualisieren mit `brew upgrade --cask notemac`, entfernen mit `brew uninstall --cask notemac`. Mit
`--zap` gehen auch Einstellungen, Sitzung und benutzerdefinierte Sprachen.

Die neueste Fassung, 1.5.0, heisst noch Griffel; ab der nächsten heisst auch die App NoteMac++.

Wer den Cask `griffel` schon installiert hat: Homebrew überträgt das Vertrauen nicht auf den neuen
Namen. So zieht er um, und der letzte Schritt legt den Befehl als `notemac` an:

```bash
brew trust --cask simon-baumhauer/tap/notemac
brew migrate --cask griffel
brew reinstall --cask simon-baumhauer/tap/notemac
```

## Beglaubigung

Die Fassung 1.5.0 ist noch nicht von Apple beglaubigt. Damit macOS die App trotzdem ohne die Meldung
«Not Opened» öffnet, entfernt der Cask nach der Installation ihre Quarantäne-Markierung; Gatekeeper
prüft die App dann nicht. Mit der ersten beglaubigten Fassung fällt dieser Schritt weg.
