<img src="./docs/media/logo/rgbdiff.png" alt="ICON" width="128" style="vertical-align: center;">![Readme Card](https://github-readme-stats.vercel.app/api/pin/?username=Lateralus138&repo=rgbdiff&theme=radical)

---

***This project is***

![Under Construction](https://img.shields.io/static/v1?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAACmElEQVQokUWSa0iTcRTGn//26u4b6ZQ0U8lKMqykwPpgZVBEHyLp8jEoIZJADCQ0iCiStIwuZmHRioIuroQss2VkrkIrdeFckiZqdhctTXPOve8Tr7M6X8/zO+fwPEfIwy7IwQA0GgExGYQwyhCmMLRX1z2hJCJSN+xZgqAZnPgCaAUQ0EHICjSYLlKBCDdNQb7HLmeRoy3zQFnzYk/1WTckGUIXCVD+Kw+BpAxtuBXCpkN7bdXt/JL3W3J3xuHg3iTsL/NkNFWVPoWkQOj/wxooCrRhFgiTjI4n9ZVHHQObjxVEY8UGIi1zEhVFCahwdq5qvn+hHkKC0EcBigxwvAnkW3ge7L6TMi+VztOLOOKOY8ulKL68GM2emnjeLF3AZSlz2FCZ6yaHwLGv6pkv8MyxsUoHLcsLwBuHwE0rtdy2UuLWNTpmpkkszQEfnAPDAd47tbaB7NaJR+eXujfmtGTUXgFWp5uwPd8Oi1GBJEmwWYlP34L4PSFw7chPeD+MYnkWUVmy0CeNfe5N8ANIjNWpNmHzqklYrDIGRwRm2gXsM/xofRMOf1AgcbYOAfgxMvgxCmS9+dbh5A6VarxuIMdBDoJ0g+vSreytNpAEux7qqWrK82I+kC2xYOAzyFbz5QNJPrXhdRo4XK/n3WILkxPsbKqwsr8xBB3PjukhGyJJv+qqB+QvkN0mR2Fim5pU1hobzxTYOPbcyJoTNpoAlu6wdZKvIslR0O9VXe0Clc5p2Ge4WDh36ux3ThM/1RqnNhXvilU32cjvINtAf4cKdkzlSHpBTqgNY11JfLtFA+o14NU8Wx/piggNfg2yGVR8EF9/dP37PyCIoDQLs8z9hmv71nsC4wFz9klX2tD4/AEG+gBoQ7KghD8MZ2xdnt7s7wAAAABJRU5ErkJggg==&label=Under&message=Construction&style=for-the-badge&labelColor=1D1D1D&color=FE428E)

***but coming very soon.***

---

## About

All binary and/or installation files can be found at the [Releases](https://github.com/Lateralus138/rgbdiff/releases) page.

### Discription

This is a command line tool to find the distance between 2 colors in hexadecimal values using CIE1976.

### Motivation

I needed a more precise way to find the distance between two colors other than just plain Euclidean distance.

---

## Usage

### Environment

This is a command line tool for both *Windows* and *Linux*.

### How To Use

Both the *Windows* and *Linux* version's have portable executables, but the *Linux* version also provides and *Debian* (.deb) package for installation on *Debian* based *Linux* systems. I have no experience building packages for other types or *Linux* package managers, but if you would like to fork, create, build, and release this project yourself then, please (as per the license), be my guest.

#### Windows Use

##### Windows Portable

As with any portable program this can be placed anywhere you like on your machine, but more preferably in a directory that is in your `%PATH%` environment variable so you can run it without a full path (`rgbdiff` for example). I recommend using a dedicated *Bin* directory, but of course, it's your choice. If your path isn't already in your `%PATH%` environment then I suggest adding it<sup>[[1](#note-1)]</sup>, but if not then you have provide the full path (`C:\Path\To\rgbdiff.exe` for example) when executing the program.

##### Windows Installation

There's really no need for installation in *Windows* and it is more hassle than necessary to do so. Of course, it can be done with whatever installation software (MSI, Inno, or similar) and adding the programs path to `%PATH%`, but there's no point that can I can see. If enough people ask for it I may do so in the future.

#### Linux Use

##### Linux Portable

Nearly the same concept as with *Windows* (path is `$PATH`, of course) and you can use your own *bin* directory (*~/bin* for example), but there is usually a dedicated bin directory at `~/.local/bin` where I recommend placing the executable if you don't install it using the *Debian* package.

##### Debian Installation

The provided *.deb* (*Debian* package) installer provides a *man page* and a very basic *Bash Completion* file.

To install with the *.deb* package you can either use *dpkg* or *gdebi[-gtk]*:

With *dpkg*:

```Bash
 $ sudo dpkg -i /path/to/deb/installer/rgbdiff.deb
```

With *gdebi[-gtk]*:

```Bash
 $ sudo gdebi /path/to/deb/installer/rgbdiff.deb
 # or; don't use sudo with the GTK version
 $ gdebi-gtk /path/to/deb/installer/rgbdiff.deb
```

View *Man Page*:

```Bash
 $ man rgbdiff
```

### Examples

These examples are essentially the same in both *Windows* and *Linux* with the exception of the switch formats. *Windows* follows the *Windows* style (`/help` for example) and *Linux* follows the *Linux* style (`--help` for example). If the executable is not in the *Windows %PATH%* then you must provide the full path plus the .exe extension. If the executable is not in the *Linux $PATH* then you must provide the full path.

Help message (Windows):

```
PS> rgbdiff /?

  RGBDifference - Get the distance between two 24 bit colors using
  CIE1976.

  rgbdiff [SWITCHES] [PARAMETERS <VALUE>] <VALUES>

  @PARAMETERS
    /m, /minuend  Initial hexadecimal color value to test. Ensures
                  this value is used, otherwise the first value passed
                  to the program is used.

  @SWITCHES
    /?, /h, /help This help message.
    /v, /verbose  Detailed output.
    /n, /minimum  Return the minimum value only if multiple subtrahends
                  are passed.
    /x, /maximum  Return the maximum value only if multiple subtrahends
                  are passed.
                  If both of the minimum and maximum switches are passed
                  to the program then the minimum option is used.

  @VALUES
    Hexadecimal   Any number of 24 bit color values provided in
                  hexadecimal format.
```

Help message (Linux):

```
$ rgbdiff -h

  RGBDifference - Get the distance between two 24 bit colors using
  CIE1976.

  rgbdiff [SWITCHES] [PARAMETERS <VALUE>] <VALUES>

  @PARAMETERS
    -m, --minuend Initial hexadecimal color value to test. Ensures
                  this value is used, otherwise the first value passed
                  to the program is used.

  @SWITCHES
    -h, --help    This help message.
    -v, --verbose Detailed output.
    -n, --minimum Return the minimum value only if multiple subtrahends
                  are passed.
    -x, --maximum Return the maximum value only if multiple subtrahends
                  are passed.
                  If both of the minimum and maximum switches are passed
                  to the program then the minimum option is used.

  @VALUES
    Hexadecimal   Any number of 24 bit color values provided in
                  hexadecimal format.
```

```
PS> $colors = @{ 'red' = 0xff0000; 'green' = 0x00ff00; 'blue' = 0x0000ff;
> 'yellow' = 0xffff00; 'magenta' = 0xff00ff; 'cyan' = 0x00ffff
> }
PS> $randColor = Get-SecureRandom -Minimum 0x000000 -Maximum 0xffffff
PS> $randColorString = '0x{0:x6}' -f $randColor
PS> $colors.GetEnumerator() | ForEach-Object {
> $colorString = '0x{0:x6}' -f $_.Value;
> "Distance from [$randColorString] to [$colorString]: " + [String](rgbdiff $randColorString $colorString);
> }
Distance from [0x77b6e8] to [0xff00ff]: 109.696476931496377460462099407
Distance from [0x77b6e8] to [0x0000ff]: 121.70335104579690721493534511
Distance from [0x77b6e8] to [0xffff00]: 129.116530420477033658244181424
Distance from [0x77b6e8] to [0x00ff00]: 140.203520313324844437374849804
Distance from [0x77b6e8] to [0xff0000]: 132.588274691885033007565652952
Distance from [0x77b6e8] to [0x00ffff]: 48.755751534008147984877723502
PS> "Color cloest to $randColorString : " + ($colors.GetEnumerator() | Where-Object { $_.Value -eq 0x00ffff }).Name
Color cloest to 0x77b6e8 : cyan
```

---

## Project Information

This project is written in `C++`.

[![C++](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/Lateralus138/endpoints/refs/heads/master/docs/json/cpp.json&logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAABGdBTUEAALGPC%2FxhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAABcVBMVEUAAAAAgM0Af8wolNQAa7YAbbkAQIcAQIYAVJ0AgM0AgM0AgM0AgM0AgM0AgM0AgM0AgM0AgM0AgM0Af8wAfswAfswAf8wAgM0AgM0AgM0Af80AgM0AgM0AgM0AgM0Af8wAgM0Af80djtIIg84Af8wAfsxYrN4Fg84Gg85RqNwej9MLhM8LhM8AfcsAgM0Hg88AfsshkNNTqd1%2Fv%2BUXi9AHdsAAYKoAY64ih8kAf81YkcEFV54GV55Sj8EnlNULhc8AecYdebwKcrsAe8gAb7oAXacAXqgAcLwAImUAUpoAVJ0AUpwAUZoAIWMAVJ0AVJ0AUpwAUZwAVJ0AVJ0AVJ0AVJ0AgM0cjtJqteGczetqtOEAf807ndjL5fT9%2Fv7%2F%2F%2F%2FM5fQ9ntnu9vu12vCi0Oz%2F%2F%2F6Hw%2Bebzeufz%2Bx%2Bv%2BW12e%2Bgz%2BxqteLu9fmRx%2BjL3Ovu8%2Fi1zeKrzeUAUpw7e7M8fLQAU50cZ6hqm8WcvNgAVJ3xWY3ZAAAAVnRSTlMAAAAAAAAAAAAREApTvrxRCQQ9rfX0qwErleyUKjncOFv%2B%2Fv5b%2Ff7%2B%2Fv7%2B%2Fv1b%2Ff7%2B%2Fv7%2BW%2F7%2B%2Fv79%2Fv7%2B%2Fv7%2B%2Fv7%2B%2Fjfa2jcBKJHqKAEEO6r0CVC8EFaOox4AAAABYktHRF9z0VEtAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAB3RJTUUH5QYKDQws%2FBWF6QAAAONJREFUGNNjYAABRkZOLkZGBhhgZOTm4eXjF4AJMQoKCYuEhYmKCQmCRBjFJSSlwiMiI6PCpaRlxBkZGGXlomNi4%2BLj4xISo%2BXkgQIKikqx8UnJyUnxKcqKKiAB1ajUJDV1Dc00LW0dXSaggF56fLK%2BgYFhhlGmsQkzRCDL1MzcIhsmYJkTn2tlbWObZ2cP0sKk4OCYH19QWFgQX%2BTkrMLEwOLiWlySD7I2v7TMzZ2Vgc3D08u7vKKysqLc28vHlx3oVg4%2F%2F4DAqqrAAH8%2FDohnODiCgkNCgoM4OOD%2B5eAIDYVyAZ9mMF8DmkLwAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTA2LTEwVDE4OjEyOjQ0LTA1OjAwkjvGQgAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wNi0xMFQxODoxMjo0NC0wNTowMONmfv4AAAAASUVORK5CYII%3D&color=FE428E)](http://www.cplusplus.org/)

### Source File Quality

This is graded by CodeFactor and is subjective, but helps me to refactor my work.

|Name|Status|
|:---:|:---:|
|[codefactor.io](https://www.codefactor.io/repository/github/lateralus138/rgbdiff)|![](https://img.shields.io/codefactor/grade/github/Lateralus138/rgbdiff/master?style=for-the-badge&labelColor=1D1D1D&color=ffff99)|

### File MD5 Hashes

All hashes are retrieved at compile/build time.

### Current Windows X64 MD5

![WINDOWS X64 MD5](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/Lateralus138/rgbdiff/master/docs/json/rgbdiff_x64_md5.json)

### Current Linux MD5

![LINUX MD5](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/Lateralus138/rgbdiff/master/docs/json/rgbdiff_linux_md5.json)

### Current Debian Installer MD5

![DEBIAN MD5](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/Lateralus138/rgbdiff/master/docs/json/rgbdiff_debian_md5.json)