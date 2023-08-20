
- [Imlementasjoner](#imlementasjoner)
- [1.1. Logging](#11-logging)
  - [1.1.1. Trace](#111-trace)
  - [1.1.2. Debug](#112-debug)
  - [1.1.3. Info](#113-info)
- [1.2. Tabs and windows](#12-tabs-and-windows)
  - [1.2.1. File and folders](#121-file-and-folders)
- [1.3. Application](#13-application)

<!-- TODO -->

Endre slik at fields ikke er final, de skal kunne endres. Key derimot er noe som ikke skal redefinires.

!!! Exception handling for keys til notifications. RemoveItems baseres på at ingen 
notifications kan lages med null key.

Implementer logging
Implementer testing
Implementer exception handling.

* OnChange i textfield. eller onchange i focus? på komponenten med FocusChangedEvent 
* Sammenlign samme key med den i notifications og gjør endringa hvis gyldig.




Bruk f{(, {, character etc..} for navigasjon og %.
Bruk n{j} og n{k} for navigasjon opp og ned.

Expection handling i feature layer, notificaiton tiles komponenter.
## Imlementasjoner

* NotificationInFocus field på dashboard bloc. Trenger å kunne edit en notification. onPressed -> NotificationFocusedEvent etc.
* Builder pattern på state når copyWith kjøres, Med Function? som i todo eksempel.
* Bruk emojis (Text scaling factor???)

## 1.1. Logging

### 1.1.1. Trace

- User interactons
- View, buttons pressed etc..
- Text fields etc..

### 1.1.2. Debug

- Objects specific
  - Logicical signals
  - State

### 1.1.3. Info

- Big picture stuff
- Application started, data fetched successfully etc..
- Non-specific status of sections

## 1.2. Tabs and windows

- **Change tab** ALT+LEFT/RIGHT (view open previous editor)
- **Move tab** CTRL+SHIFT+PAGE UP/DOWN
- **Close tab** CTRL+W
- **New window** CTRL+SHIFT+N
- **Close window** CTRL+SHIFT+W

### 1.2.1. File and folders

- **Open file** CTRL+P
- **New file** CTRL+N

## 1.3. Application

---

(In main file)

- **Run** CTRL+F5
- **Debug** F5
- **Hot restart** CTRL+SHIFT+F5
- **Hot reload** CTRL+S
- **Close** SHIFT+F5
