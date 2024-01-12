# PainKiller Advanced Cheats

## Description

“PainKiller Advanced Cheats” (shortly “PainCheats”, or “PKCheats”) is a cheat script for “PainKiller” video game series.

The latest version of “PainCheats” contains 138 console cheat commands for the single-player game mode (see the full list in the [`CheatList.txt`](CheatList.txt) file):

* all of the original cheats;
* cheats disabled in the retail version of the game;
* most of the cheats from “Powermad” cheat script, originally created by *Wayne Marsh a.k.a. fleabay* and later developed by *Peter Kuhn a.k.a. kalme*;
* cheats developed by fans and published on various “PainKiller” forums;
* and lots and lots of exclusive cheats.

Most of them have been modified and/or bug fixed.

“PainCheats” is compatible with all currently existing and possibly with future versions of the game.

“PainCheats” can be installed into any official and unofficial editions, demos, add-ons, mods and ports of “PainKiller” that use “PainEngine” video game engine (e.g., “PainKiller: Battle out of hell” by “People Can Fly”, “PainKiller: Overdose” by “Mindware”, etc.).

“PainCheats” can also be installed into “PainKiller: Hell wars” video game developed by “People Can Fly” for “Xbox Original” video game console that uses slightly modified version of “PainEngine”.

“PainCheats” can not be installed into “PainKiller: Hell & Damnation” by “The Farm 51” that uses “Unreal Engine 3” video game engine.

“PainCheats” is compatible with other cheat scripts (e.g., “Powermad”).

“PainCheats” can be ported to “NecroVisioN” video game by “The Farm 51” that uses “NecroEngine” video game engine, based on “PainEngine”. Feel free to fork this project to port it for “NecroVisioN”. The good project name might be “NecroVisioN Advanced Cheats” (shortly “NecroCheats”, or “NVNCheats”). ;)

## How to install

1. Go to the game folder. You'll see `Bin` and `Data` folders inside.

2. Go to the `Data` folder and create an empty `LScripts` folder inside.

:warning: Without this step the next step will not work.

3. Unpack `/Data/LScripts.pak` archive into the `/Data/LScripts` folder. To do this, go to the `Bin` folder and run the main executable file with the following parameters.

:warning: The name of the main executable file may be different (e.g. `Overdose.exe`).

```sh
PainKiller.exe -script FS.ExtractPack('../Data/LScripts.pak','../Data/LScripts')
```

4. Copy [`AdvancedCheats.lua`](AdvancedCheats.lua) file into the `/Data/LScripts` folder.

5. Open `/Data/LScripts/Loader.lua` file in text editor and add the following line to the end of file:

```lua
DoFile(path.."AdvancedCheats.lua")
```

6. Optionally, pack `/Data/LScripts` folder back to `/Data/LScripts.pak` archive:

```sh
PainKiller.exe -script FS.CreatePack('../Data/LScripts.pak','../Data/LScripts')
```

:warning: For “Xbox Original” video game console (“PainKiller: Hell wars” video game) you should disable file compression:

```sh
PainKiller.exe -script FS.CreatePack('../Data/LScripts.pak','../Data/LScripts',false)
```

## How to use

(To be described later.)
