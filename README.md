# macos-gamemode-enabler

enables macOS Game Mode for any app that does not trigger it natively

## what it does

force macos game mode for any app. tricks the system by running a deprioritized native game in fullscreen to unlock lower bluetooth latency for wireless controllers and headphones with emulators, crossover, and more.

## requirements

- macOS Sonoma 14.0+ (Apple Silicon)
- Chess.app (ships with macOS)

## usage

```bash
chmod +x gamemode.sh
./gamemode.sh
```

keep Chess running in fullscreen in the background; closing it deactivates Game Mode.

## what Game Mode actually does

[Apple's documentation](https://support.apple.com/en-euro/105118)

## backstory

built this because I was running F1 23 on macOS via CrossOver 26 with an Xbox One controller over Bluetooth on macOS Tahoe. game worked fine but the Bluetooth input lag was noticeable for a racing sim. since CrossOver isn't recognized as a game by macOS, Game Mode never kicked in. the Chess trick forces it on, and the difference in controller responsiveness was noticeable.