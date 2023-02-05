# Typist.pk3

<a href="https://github.com/mmaulwurff/typist.pk3/releases" alt="Downloads">
  <img src="https://img.shields.io/github/downloads/mmaulwurff/typist.pk3/total" />
</a>
<a href="https://github.com/mmaulwurff/typist.pk3" alt="Stars">
  <img src="https://img.shields.io/github/stars/mmaulwurff/typist.pk3" />
</a>
<a href="https://travis-ci.com/mmaulwurff/typist.pk3" alt="Build status">
  <img src="https://img.shields.io/travis/com/mmaulwurff/typist.pk3" />
</a>
<a href="https://discord.gg/cFpdvWZ" alt="Discord">
  <img src="https://img.shields.io/discord/553717447077920800" />
</a>

[YouTube](https://www.youtube.com/playlist?list=PL13LmqbAWk2cE8d3vkG0zDuCiwSVlKtUZ)

Typist.pk3 is a mod for Doom engine games that turns them into typing exercises.

There are several lessons, including user-defined lessons.

## How To Play

Load it with [GZDoom](https://zdoom.org/index).

There are two game modes: Combat and Exploration. They are switched
automatically.

### Exploration Mode (blue)

Your familiar mode. You can walk, open doors, turn switches, etc.

### Combat Mode (red)

This mode is for fighting enemies. Instead of aiming and shooting, you type
answers for your targets. When the answer is ready, press Space or Enter, or
hold for continuous fire.

- press Ctrl+Backspace to erase the whole answer.
- press Escape to force Exploration mode. After this, you can return to
  automatic mode switching with Unlock Game Mode key assigned in Typist options.

Because you cannot move normally in Combat mode, the following commands are
available:

- `dl` - dash to the left,
- `dr` - dash to the right,
- `df` - dash forward,
- `db` - dash backward.
- `rl` - reload weapon (if it has reloading).

Commands are configurable.

## Key setup

The mod doesn't require any special key setup. However, for smoother experience,
it may be worth playing keyboard-only with the following assigned keys:

- E - move forward
- S - strafe left
- D - move backward
- F - strafe right
- I - center view
- J - turn left
- K - turn around
- L - turn right

This way, you'll waste no time switching from mouse to keyboard and back, and
your fingers are almost at the right typing position!

## How To Set Up Custom Text Lesson

1. Find any text or book in ASCII .txt file (UTF-8 may also work).
2. If a file is supposed to be in ASCII but actually is not, use `grep -P
"[^\x00-\x7F]" file.txt` to find non-ASCII characters.
3. Rename text file to `typist_custom_text.txt`.
4. Load `typist_custom_text.txt` with GZDoom alongside Typist.pk3.
5. Select Custom Text in Typist options menu.

## Incompatible Mods

- Guncaster. Reason: Guncaster reads player input directly from player, so
  weapon firing cannot be emulated like for other mods. Guncaster support cannot
  be added without modifications in Guncaster or GZDoom.
- Guncaster Vindicated. Reason: the same as Guncaster.

## Compilation

Actually, you don't need to compile this. The repository contains everything
that is needed to run this mod. But if you want to develop Typist.pk3 with
maximum comfort, set up the compilation.

### Linux

Required tools:
- Git
- Bash
- Python 3
- pylint3
- aspell with English (UK) dictionaries
- ShellCheck

```
./scripts/build.sh
```

To run tests:
```
./scripts/test.sh
```

(Test script also builds.)

### Windows

It may be possible to compile this on Windows. Install Msys or something. You're on your own :)

### macOS

In order to get Typist to compile on macOS, a few changes needed to be made
to the code.

#### Symbolic Links

The `3rdparty` directory has some symbolic links that point out to some other
GitHub repositories: [clematis](https://github.com/mmaulwurff/clematis) and
[lazy-points](https://github.com/mmaulwurff/lazy-points). macOS has a hard
time dealing with symbolic links, so it's going to be much easier to just
clone the repos directly into the `3rdparty` directory to enable them to be
referenced:

```sh
cd 3rdparty
git clone git@github.com:mmaulwurff/clematis.git
git clone git@github.com:mmaulwurff/lazy-points.git
cd ..
```

#### `git describe`

Since any fork you do won't have the tagged version, in the `scripts/build.sh`
and `scripts/make_title.sh` files, change the `version` variable to pass the
`--always` flag in the `git describe` command, otherwise compilation will fail:

```sh
version=$(git describe --abbrev --tags --always)
```

#### Install Dependencies

Since the `grep` and `sed` commands are used extensively in the build scripts,
and since those commands operate differently between Mac and Linux when using
certain flags, the easiest way to bridge the gap between them is to install GNU
versions of them. Do a search for `ggrep` and `gsed` to see where the GNU
versions needed to be used.

The `scripts/spelling_code.sh` script requires the `aspell` tool.

Multiple scripts require the `rename` command.

All these dependencies can be installed with Homebrew:

```sh
brew install grep gnu-sed aspell rename
```

`grep` and `gnu-sed` provide the `ggrep` and `gsed` commands.

#### `xargs` Arguments

In the `scripts/import_clematis.sh` file, there are instances of the command
`xargs --null`, which doesn't seem to work on macOS. Change lines which have
it to the following:

```sh
find . -name "*.zs"  -print0 | xargs -0 gsed -i 's/Clematis/tt_Clematis/g'
find . -name "*.zs"  -print0 | xargs -0 gsed -i 's/Cl_/tt_Cl_/g'
```

At this point, you should be able to successfully compile a pk3 file:

```sh
➜ [typist.pk3 (master) ✗]$ ./scripts/build.sh
typist-<git-hash>.pk3
```

Once that's done, try and load it with GZDoom and it should work. All those
changes have been done on the branch with this section of the Readme file.

## Software Used

- [Emacs](https://www.gnu.org/software/emacs/)
- [Slade](https://github.com/sirjuddington/SLADE)

## Acknowledgments

### Credits

- [libeye](https://forum.zdoom.org/viewtopic.php?f=105&t=64566#p1102157) (Level
  and screen projections): KeksDose
- [Clematis](https://github.com/ZippeyKeys12/clematis) (Basic ZScript unit test
  framework for GZDoom): ZippeyKeys12 (Zain Aamer). Clematis is under the [BSD 3-Clause
  License](https://github.com/ZippeyKeys12/clematis/blob/master/LICENSE).
- [miniwad.wad](https://github.com/fragglet/miniwad) (BSD license): fraggle
- [1000 basic English words](https://en.wiktionary.org/wiki/Appendix:1000_basic_English_words) (tt_1000.txt) (actually, 1008) CC BY-SA 3.0
- [Frequency dictionary of the modern Russian language](https://en.wiktionary.org/wiki/Appendix:Frequency_dictionary_of_the_modern_Russian_language_(the_Russian_National_Corpus)) (tt_1000_ru.txt) CC BY-SA 3.0
- Sound design: Captain J. See credits for each sound effect in credits-sounds.md

### Thanks

- LGR for [Sega's Typing of the Dead: A Zombie-Slaying Education](https://youtu.be/iamxvTe9Z5g) video
- Marrub for [ZScript documentation](https://github.com/marrub--/zscript-doc)
- Accensus for inviting into Discord server and for bug reports
- Accensus, Tapwave, and IKA for patience in testing and development of certain
  under-the-hood tech, which is also used in [War Trophies](https://forum.zdoom.org/viewtopic.php?f=43&t=67054#p1132997)
- kadu522 for support
- dard22 for bug reports
- Jarewill for bug reports
- SphericalCube for bug reports

