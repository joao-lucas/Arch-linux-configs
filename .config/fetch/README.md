# fetch

This is the home of my fetch script! This script gathers info <br />
about your system and prints it to the terminal next to an image, <br \>
your distro's logo or any ascii art of your choice!

![1](http://i.imgur.com/t1V9crb.png)


<!-- Table of Contents {{{ -->


## Table of Contents

- [Screenshots](#screenshots)
- [Features](#features)
- [Dependencies](#dependencies)
- [Installation](#installation)
- [Post Install](#post-install)
- [Usage](#usage)
- [Frequently Asked Questions](#frequently-asked-questions)
- [Issues and Workarounds](#issues-and-workarounds)
- [Thanks](#thanks)


<!-- }}} -->


<!-- Screenshots {{{ -->


## Screenshots

![Windows](https://i.imgur.com/oVv5gHn.png)
![Mac OS X](http://i.imgur.com/KEi9EEi.png)
![Linux](https://i.imgur.com/IelXz1Z.png)
![Linux](https://i.imgur.com/6fgnvcq.png)


<!-- }}} -->


<!-- Features {{{ -->


## Features

- Supports **Linux**, **Mac OS X**, **BSD** and **Windows** (Cygwin)
- Display a **full color image**, a file containing **ascii art** or your **distro's logo** in ascii next to the info.
- The script is **fast**. We use bash builtins wherever possible and only spawn external processes when necessary.
- Take a screenshot of your desktop on script finish.
- Customize **which** info is displayed, **where** it's displayed and **when** it's displayed.
    - See this **[wiki page](https://github.com/dylanaraps/fetch/wiki/Customizing-Info)**


<!-- }}} -->


<!-- Dependences {{{ -->


## Dependencies

### Required dependencies:

**All OS:**

-  `Bash 4.0+`

**Linux / BSD / Windows:**

-  Uptime detection: `procps` or `procps-ng`


### Optional dependencies:

**NOTE:** If `w3m` or `Imagemagick` aren't found then image support will be disabled.

**All OS:**

-  Displaying Images: `w3m-img` or `iTerm2`
    - `w3m-img` is sometimes bundled together with `w3m`. (Arch)
    - **Note:** To enable iTerm2 mode, you need to change `$image_backend` to `iterm2`
    or use the launch flag `--image_backend iterm2`.
-  Image Cropping, Resizing etc: `ImageMagick`
-  More accurate window manager detection: `wmctrl`

**Linux / BSD:**

-  Display Wallpaper: `feh`, `nitrogen` or `gsettings`
-  Current Song: `mpc` or `cmus`
-  Resolution Detection: `xorg-xdpyinfo`
-  Take a screenshot on script finish: `scrot`
    - You can change this to another program with `--scrot_cmd` and `$scrot_cmd`.


<!-- }}} -->


<!-- Installation {{{ -->


## Installation


### Arch

1. Install **[fetch-git](https://aur.archlinux.org/packages/fetch-git/)** from the aur.


### Gentoo / Funtoo

1. Add the 3rd party repo
    - `layman -o https://gist.githubusercontent.com/z1lt0id/24d45b15800b98975260/raw/2fdf6645cdc3c1ca0b0af83a7bf8f86598e386ae/fs0ciety.xml -f -a fs0ciety`
2. Sync the repos
    - `layman -S`
3. To enable w3m and scrot support, enable the appropriate flags.
    - `echo "x11-apps/fetch" >> /etc/portage/package.use`
4. Install the package
    - `emerge -a x11-apps/fetch`


### Others

1. Download the latest source at https://github.com/dylanaraps/fetch
2. Run `make install` inside the script directory to install the script.

**NOTE:** Fetch can be uninstalled easily using `make uninstall`.

**NOTE:** Fetch can also be run from any directory like a normal script,<br \>
you'll just be missing the ascii distro logos and config file functionality.


<!-- }}} -->


<!-- Post Install {{{ -->


## Post Install

#### Using the config file

Fetch will by default create a config file at `$HOME/.config/fetch/config` and this file<br \>
contains all of the script's options/settings. The config file allows you to keep your<br \>
customizations between script versions and allows you to easily share your customizations<br \>
with other people.

You can launch the script without a config file by using the flag `--config none` and you can<br \>
specify a custom config location using `--config path/to/config`.


#### Sizing the image correctly

**NOTE:** For the images to be sized correctly you need to set the `$font_width` variable.<br \>
If you don't know your font width in pixels keep trying values until the image is sized correctly.

You can also use the launch flag `--font_width` to set it on the fly.


#### Customizing what info gets displayed

In the config file there's a function that allows you to customize all of the info that<br \>
gets displayed.

Here's what you can do:

- Add new info lines
- Change the ordering of the info
- Remove unwanted info lines
- Use bash syntax to control when info gets displayed

See this wiki page that goes more in-depth about it:

https://github.com/dylanaraps/fetch/wiki/Customizing-Info


#### Customizing the script using a custom alias

If you don't want to use the confog file you can customize almost everything using launch flags!

Here's what my fetch alias looks like:

```sh
alias fetch2="fetch \
--block_range 1 8 \
--line_wrap off \
--bold off \
--uptime_shorthand on \
--gtk_shorthand on \
--colors 4 1 8 8 8 7 \
"
```

<!-- }}} -->


<!-- Usage {{{ -->


## Usage


    usage: ${0##*/} --option "value"

    Info:
    --osx_buildversion     Hide/Show Mac OS X build version.
    --speed_type           Change the type of cpu speed to display.
                           Possible values: current, min, max, bios,
                           scaling_current, scaling_min, scaling_max
                           NOTE: This only support Linux with cpufreq.
    --kernel_shorthand     Shorten the output of kernel
    --uptime_shorthand     Shorten the output of uptime (tiny, on, off)
    --gpu_shorthand on/off Shorten the output of GPU
    --gtk_shorthand on/off Shorten output of gtk theme/icons
    --gtk2 on/off          Enable/Disable gtk2 theme/icons output
    --gtk3 on/off          Enable/Disable gtk3 theme/icons output
    --shell_path on/off    Enable/Disable showing \$SHELL path
    --shell_version on/off Enable/Disable showing \$SHELL version
    --birthday_shorthand   Shorten the output of birthday
    --birthday_time        Enable/Disable showing the time in birthday output

    Text Colors:
    --colors 1 2 3 4 5 6   Change the color of text
                           (title, @, subtitle, colon, underline, info)
    --title_color num      Change the color of the title
    --at_color num         Change the color of "@" in title
    --subtitle_color num   Change the color of the subtitle
    --colon_color num      Change the color of the colons
    --underline_color num  Change the color of the underlines
    --info_color num       Change the color of the info

    Text Formatting:
    --underline on/off     Enable/Disable title underline
    --underline_char char  Character to use when underlineing title
    --line_wrap on/off     Enable/Disable line wrapping
    --bold on/off          Enable/Disable bold text
    --prompt_height num    Set this to your prompt height to fix
                           issues with the text going off screen at the top

    Color Blocks:
    --color_blocks on/off  Enable/Disable the color blocks
    --block_width num      Width of color blocks
    --block_range start end --v
                           Range of colors to print as blocks

    Image:
    --image                Image source. Where and what image we display.
                           Possible values: wall, shuffle, ascii,
                           /path/to/img, off
    --image_backend        Which program to use to draw images.
    --shuffle_dir           Which directory to shuffle for an image.
    --font_width px        Used to automatically size the image
    --image_position       Where to display the image: (Left/Right)
    --split_size num       Width of img/text splits
                           A value of 2 makes each split half the terminal
                           width and etc
    --crop_mode            Which crop mode to use
                           Takes the values: normal, fit, fill
    --crop_offset value    Change the crop offset for normal mode.
                           Possible values: northwest, north, northeast,
                           west, center, east, southwest, south, southeast

    --xoffset px           How close the image will be
                           to the left edge of the window
                           NOTE: This only works with w3m
    --yoffset px           How close the image will be
                           to the top edge of the window
                           NOTE: This only works with w3m
    --gap num              Gap between image and text right side
                           to the top edge of the window
                           NOTE: --gap can take a negative value which will
                           move the text closer to the left side.
    --clean                Remove all cropped images


    Ascii:
    --ascii                Where to get the ascii from, Possible values:
                           distro, /path/to/ascii
    --ascii_color          Color to print the ascii art
    --ascii_distro distro  Which Distro\'s ascii art to print


    Screenshot:
    --scrot /path/to/img   Take a screenshot, if path is left empty
                           the screenshot function will use
                           \$scrot_dir and \$scrot_name.
    --scrot_cmd            Screenshot program to launch

    Other:
    --config               Specify a path to a custom config file
    --config none          Launch the script without a config file
    --help                 Print this text and exit


<!-- }}} -->


<!-- Frequently Asked Questions {{{ -->


## Frequently Asked Questions


#### How do I enable screenfetch mode?

Launching the script with `--ascii distro` or setting `ascii="distro"` and `image="ascii"` <br \>
inside the script will launch the script in "screenfetch mode". The script will display your<br \>
distro's ascii next to the info, exactly like screenfetch.

![arch](https://camo.githubusercontent.com/972490362219f4aa087a0a9491df24d506590542/687474703a2f2f692e696d6775722e636f6d2f746741504a76322e706e67)


#### Why doesn't fetch support my wallpaper setter?

It's hard to add support for other wallpaper setters as<br \>
they don't provide a way of getting the current wallpaper from the cli.

If your wallpaper setter **does** provide a way of getting the current wallpaper<br \>
or you know where it's stored then adding support won't be a problem!<br \>


<!-- }}} -->


<!-- Issues and Workarounds {{{ -->


## Issues and Workarounds


#### The text is too long for my terminal window and wraps to the next line causing the image to not render correctly.

There are a few ways to fix this.

* Disable line wrapping with `line_wrap=off` in the script or with the launch flag `--line_wrap off`

* The uptime and gtk info lines each have a shorthand option that makes their output smaller. You can <br \>
  enable them by changing these variables or using these flags.

```sh
# In script options
uptime_shorthand="on"
gtk_shorthand="on"
gpu_shorthand="on"
birthday_shorthand="on"

# Launch flags
--uptime_shorthand on
--gtk_shorthand on
--gpu_shorthand on
--birthday_shorthand on

```

* Edit the config to make the subtitles shorter

* Resizing the terminal so that the lines don't wrap.


#### The text is pushed over too far to the right

The easiest way to fix this is to change the value of `--gap` or `$gap`<br \>
to a negative value. For example `--gap -10` will move the text 10 spaces to the left.


#### getgpu doesn't show my exact video card name

If your `lspci | grep "VGA"` output looks like this:

```
01:00.0 VGA compatible controller: NVIDIA Corporation Device 1401 (rev a1)
```

Instead of this:

```
01:00.0 VGA compatible controller: NVIDIA Corporation GM206 [GeForce GTX 960] (rev a1)
```

Then you're affected by the issue.

This is caused by your `/usr/share/misc/pci.ids\*` files being outdated and you can fix it<br \>
by running this command as root.

```
sudo update-pciids
```

<!-- }}} -->


<!-- Thanks {{{ -->


## Thanks

Thanks to:

- metakirby5: Providing great feedback as well as ideas for the script.

- Screenfetch:
    - I've used some snippets as a base for a few functions in this script.
    - I've used the ascii art from here.

- @jrgz: Helping me test the Mac OS X version.

- @xDemonessx: Helping me test the Windows version.

- Everyone else who has helped test the script and given feedback.


<!-- }}} -->
