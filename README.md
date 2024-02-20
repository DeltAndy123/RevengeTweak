# RevengeTweak

A rootful/rootless tweak to inject Revenge into Discord.

## Installation

### Jailbroken (Rootful/Rootless)

1. Install Orion runtime via your preferred package manager, by adding `https://repo.chariz.com/` to your sources, then finding `Orion Runtime`.
2. Install Revenge by downloading the appropriate `.deb` file [here](https://github.com/DeltAndy123/RevengeTweak/releases/latest) (or by building your own, see [Building RevengeTweak locally](#building-revengetweak-locally)). Use the file ending in `arm.deb` for rootful jailbreaks, and the file ending in `arm64.deb` for rootless jailbreaks.

### Non-Jailbroken

Find instructions [here](https://github.com/DeltAndy123/revenge-ipa#how-to-install)

## Building RevengeTweak locally

> **Note**
> These steps assume you use MacOS.

1. Install Xcode from the App Store. If you've previously installed the `Command Line Utilities` package, you will need to run `sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer` to make sure you're using the Xcode tools instead.

> If you want to revert the `xcode-select` change, run `sudo xcode-select -switch /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk`

2. Install the required dependencies. You can do this by running `brew install make ldid` in your terminal. If you do not have brew installed, follow the instructions [here](https://brew.sh/).

3. Setup your path accordingly. We recommend you run the following before running the next commands, as well as any time you want to build RevengeTweak.

```bash
export PATH="$(brew --prefix make)/libexec/gnubin:$PATH"
# feel free to set whatever path you want, but it needs to be a direct path, without relative parts
export THEOS="/Users/revenge/IPA/theos"
```

4. Setup [theos](https://theos.dev/docs/installation-macos) by running the script provided by theos.

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/theos/theos/master/bin/install-theos)"
```

If you've already installed theos, you can run `$THEOS/bin/update-theos` to make sure it's up to date.

5. Clone this repository with `git clone https://github.com/DeltAndy123/RevengeTweak.git --recurse-submodules` and `cd` into it. Replace the URL with your fork if you've forked this repository.

6. To build RevengeTweak, you can run `rm -rf packages && make clean && make package FINALPACKAGE=1 && make package FINALPACKAGE=1 THEOS_PACKAGE_SCHEME=rootless`. The first command will remove any previous packages, the second will clean the project, the third will build the rootful package (which is denoted by the `arm.deb` ending), and the fourth will build the rootless package (which is denoted by the `arm64.deb` ending).

The first time you run this, it might take a bit longer, but subsequent builds should be much faster.

The resulting `.deb` files will be in the `packages` folder. As a reminder, `*arm.deb` is for rootful jailbreaks and sideloading, and `*arm64.deb` is for rootless jailbreaks.

## Contributing

If you want to contribute, you will basically need to follow the steps for [Building RevengeTweak locally](#building-revengetweak-locally), as well as run `make spm` for the Swift LSP to work.

<!-- @vladdy was here, battling all these steps so you don't have to. Have fun! :3 -->
