# Plan

betyr at notification_bloc er den med tilgang til stream av notifications som kommer fra API.
Får notification av notification_state. (state)

<!-- TODO -->

Lær streams, await slik at list blir laget eller hele tiden bruke stream?

Implementer StreamController med broadcastStream() som oppdatere lista og added nye liste til stream slik at alle
subscribers blir oppdatert. Observer pattern.

- Installer flutter lints package for code style.
- NotificationInFocus field på dashboard bloc. Trenger å kunne edit en notification. onPressed -> NotificationFocusedEvent etc.
- Builder pattern på state når copyWith kjøres
- Bruk emojis (Text scaling factor???)

<!-- ?New -->

### Tabs and windows

- **Change tab** ALT+LEFT/RIGHT (view open previous editor)
- **Move tab** CTRL+SHIFT+PAGE UP/DOWN
- **Close tab** CTRL+W
- **New window** CTRL+SHIFT+N
- **Close window** CTRL+SHIFT+W

### File and folders

- **Open file** CTRL+P
- **New file** CTRL+N

## Application

---

(In main file)

- **Run** CTRL+F5
- **Debug** F5
- **Hot restart** CTRL+SHIFT+F5
- **Hot reload** CTRL+S
- **Close** SHIFT+F5
