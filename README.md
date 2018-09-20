# VLC Show Stream Title
VLC extension that shows the title of the currently playing video stream using the built-in OSD functionality of VLC. 

Possible use case: a computer-controlled TV that switches between live streaming web cameras. If installed in a public place, you may want the public to know what’s on the screen right now. The extension allows you to set custom titles even for those streams that you don’t own (e.g. from YouTube).

![Show Stream Title in VLC](https://raw.githubusercontent.com/EugeneDae/VLC-Show-Stream-Title/master/screenshot.jpg)

## Setup
### Windows
1. Copy show-stream-title.lua into `C:\Program Files\VideoLAN\VLC\lua\intf`.

2. Launch VLC from cmd.exe or Start > Run:
```
"C:\Program Files\VideoLAN\VLC\vlc.exe" --extraintf=luaintf --lua-intf=show-stream-title
```

**A note to advanced users:** if you want this extension to be enabled in VLC by default (so you could launch VLC in a standard way), you need to edit `C:\Users\<username>\AppData\Roaming\vlc\vlcrc`. Set `extraintf=luaintf` and `lua-intf=show-stream-title`. Due to a bug in the current Windows version of VLC (which is 3.0.4 as of writing), the `extraintf` setting will be reset to simply `lua` if you open the preferences window of VLC, and the extension will stop working. For this reason, it’s recommended to use the aforementioned command.

### macOS
1. Copy show-stream-title.lua into `/Applications/VLC.app/Contents/MacOS/share/lua/intf/`.
2. Go to VLC > Preferences. At the bottom of the window click “Show All”.
3. Choose Interface > Main interfaces. Set “Extra interface modules” to `luaintf`.
4. Choose Interface > Main interfaces > Lua. Set “Lua interface” to `show-stream-title`.

Optionally, if don’t want to change VLC preferences, simply run the following command in Terminal.app after step #1:
```
/Applications/VLC.app/Contents/MacOS/VLC --extraintf=luaintf --lua-intf=show-stream-title
```

### Note to all users
By default, VLC also tries to show a title of a video. You may want to disable this feature if you plan to use this extension. If you’re on Windows, go to Tools > Preferences > Subtitles/OSD > uncheck “Show media title on video start”. If you’re on macOS, go to VLC > Preferences, at the bottom of the window click “Show All”, choose Video, uncheck “Show media title on video”.

### How to set a custom title?
1. If you’re on Windows, go to Tools > Preferences, choose Interface tab, under “Playlist and Instances” check “Display playlist tree”. If you’re on Mac, go to VLC > Preferences > Show All > Playlist, check “Display playlist tree”.

2. See [sample.xspf](https://raw.githubusercontent.com/EugeneDae/VLC-Show-Stream-Title/master/sample.xspf).

## Other notes
Tested to work with VLC 3.

Written by **Eugene / Dae** (dae@dae.me). Feel free to use the code under the terms of the MIT License.

Special thanks to **[mederi](https://www.opendesktop.org/member/233525/)**, a contributor to the VLC community, whose code ([Time extension](https://addons.videolan.org/hive/show/content/149618)) helped me get started.
