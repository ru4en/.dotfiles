

# scripts/auto-logout-key
    Scripts and configuration files to automatically lock the screen when yubikey is removed.

### Usage
setup:
```bash
cd auto-logout-key
./setup.sh
```
uninstall:
```bash 
cd auto-logout-key
./clean.sh
```

### Diagnostic
To see the environment variables of the udev event, run the following command and remove the yubikey:
```bash
udevadm monitor --udev --environment
```
