# Plan

betyr at notification_bloc er den med tilgang til stream av notifications som kommer fra API.
Får notification av notification_state. (state)

<!-- TODO -->

- Installer flutter lints package for code style.
- NotificationInFocus field på dashboard bloc. Trenger å kunne edit en notification. onPressed -> NotificationFocusedEvent etc.
- Oppdater removeNotifications. Må også fjerne samme notifications i allNotifications.
- Builder pattern på state når copyWith kjøres
- Bruk emojis (Text scaling factor???)

<!-- ?New -->

# Keybindings (Vscode)

## **Div**

---

- **Editor action** CTRL + .
- **Intellisense** CTRL + SPACE

## **Edit**

---

### Selection

- **Multi-cursor** CTRL+ALT+UP/DOWN (alt. ALT+MOUSECLICK)
- **Block selection** CTRL+D
- **Line selection** CTRL+L
- **End of line** CTRL+E
- **Move line** ALT+UP/DOWN

### Alter

- **Cut line** CTRL+X
- **Duplicate line (Selection)** CTRL+B

## **Navigation**

---

### Editor

- **Jump downwards** CTRL+DOWN
- **Jump upwards** CTRL+UP
- **Move camera downwards** CTRL+SHIFT+DOWN
- **Move camera upwards** CTRL+SHIFT+UP

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

<!-- !Old -->

<!-- # Husk code shortcuts

## Navigation

- ctrl arrows for move

## Tabs and windows

- alt (for bytte tab)
- ctrl + shift + q (Close tab)

- ctrl+shift+n (New window)
- ctrl+shift+w (Close window)

- ctrl+shift+e (file tree)
- ctrl+n (new file)

## Edit

- ctrl + alt + arrowkeys (Multi-cursor)
- ctrl + e (recents)
- ctrl + x (Remove line)
- ctrl + w (Mark a whole bracket) (Tap flere gang per line)

## Div

- ctrl + shift + v (Preview markdown) -->
