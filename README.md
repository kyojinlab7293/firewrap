# firewrap

**Modular Linux app sandboxing with tag-based privacy controls — The Nebula Project**

FireWrap is a user-friendly GUI tool that lets you sandbox any Linux app using [Firejail](https://firejail.wordpress.com/) and customizable *tags*. Tags are modular permission profiles that you can mix and match to control network, filesystem, camera, and more — without needing to write your own Firejail profiles.

---

## Features

- Tag-based sandboxing system (e.g. `no-network`, `no-camera`, `read-only-home`)
- GUI launcher to apply selected tags
- Reusable and composable sandbox profiles
- Built on Firejail (no need to switch to Flatpak)
- Designed for privacy, control, and minimal overhead

---

## How It Works

Each **tag** is a small `.tag` file containing a Firejail config snippet (e.g. `net none`, `read-only ${HOME}`). When you launch an app through FireWrap, selected tags are combined into a single temporary Firejail profile.

You control what permissions each app gets — visually and modularly.

---

## Example Tags

| Tag              | Description                         |
|------------------|-------------------------------------|
| `no-network`     | Blocks all network access           |
| `read-only-home` | Makes home directory read-only      |
| `no-camera`      | Blocks access to webcam devices     |
| `no-mic`         | Prevents microphone usage           |
| `private-home`   | Uses a private home folder          |

See the `tags/` folder for the full list.

---

## Installation

1. **Clone this repo:**
   ```bash
   git clone https://github.com/kyojinlab7293/firewrap.git
   cd firewrap
   ```

2. **Make the GUI launcher executable:**
   ```bash
   chmod +x sandbox-gui.sh
   ```

3. **(Optional)** Add it to your menu or launcher for convenience.

---

## Usage

Run the launcher:

```bash
./sandbox-gui.sh
```

You’ll be presented with a list of available tags. Select the ones you want, choose an app to launch, and FireWrap will run it with the selected sandbox settings using Firejail.

---

## Dependencies

- [Firejail](https://firejail.wordpress.com/)
- `zenity` (for the GUI — optional but recommended)

Install via your package manager:

```bash
sudo apt install firejail zenity
```

---

## Contributing

Tag suggestions, bug reports, and PRs are welcome!

---

## License

This project is licensed under the GNU General Public License v3.0. See the `LICENSE` file for details.
