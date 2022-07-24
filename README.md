# AussieForks Modpack

## Introduction

This is a modpack for [minetest game](https://github.com/minetest/minetest_game). It was directly based on the [mods](https://wiki.linux-forks.de/mediawiki/index.php/Blocks_and_Mods) used on the [LinuxForks minetest server](https://wiki.linux-forks.de/mediawiki/index.php/Main_Page), but this version contains some extra mods that Blockhead wanted for his own use and some updates to mods that LinuxForks has not updated themselves.

This modpack is largely the same as its LinuxForks origin and is likely to remain that way. As a long-time player of LinuxForks I mostly agree with their philosophies on things. I don't plan on adding basic\_materials, or moving away from technic. However, I do intend to maintain an Australian theme on top of the tech/realism basis.

Any reference to 'Forks modpack' below can be taken as a shorthand for 'AussieForks' modpack. 

## Installation
The modpack is only supported for minetest version 5.5.1; I don't test it on earlier versions. The modpack was originally started in 5.3.0 though, so it might work for that version. No guarantees and no support though.

In the spirit of LinuxForks, you will have to be somewhat technical to install this modpack in that *you will have to have git installed*. Theoretically I could create an archive file of the whole modpack without any git information but I haven't yet. Thankfully, using git will also mean that updating the modpack won't require you to download huge amounts of what is mostly the same data each time you update. Furthermore, you may want to play around with the source code of some of these mods and contribute back upstream, and then you would have to have git anyway :). git is your friend, trust me.

This modpack uses *git submodules* to fetch data from a large number of other repositories. It can take some time to download all of the git history. For this reason, **it is highly recommended to perform a shallow clone rather than a full clone of most of the submodules**, saving a lot of data transfers, especially for those mods with a lot of binary files like textures where git tracks the complete file for each version of the binary files. The biggest file saving here is that advtrains contains about 100MB of junk in the assets folder that most players won't want to touch. There is one caveat, some of the mods are hosted on gpcf's sites which use cgit and cgit currently does not support shallow cloning.

Since this modpack is basically all-encompassing, **if you have any other mods then I recommend keeping a separate minetest directory for the modpack** because it is quite likely at least one of the mods here will conflict with upstream versions you might have. 

For this reason, I have included two shell scripts that will install the mods in the pack after you check out the forks-modpack repository. To start the install, do the following either in a terminal on Linux/OS X or [git bash](https://gitforwindows.org/) on windows:

```
 $ cd /path/to/minetest/
 #Save your other mods away to a different directory. You can bring them back after you install the modpack.
 $ mv mods other_mods 
 $ git clone https://github.com/Montandalar/forks-modpack/ mods
 $ cd mods
```

If at this stage you want to use Blockhead's forks, you can checkout that branch:

`git checkout aussieforks`

There are two shell scripts in your new mods directory. One will perform a full clone of all the mods that will take quite some time. To install this way do the following:

`$ ./fullclone.sh`

The other script will shallow clone all of the mods that can be shallow cloned and clone the ones hosted on cgit:

`$ ./shallowclone.sh`

Later, updating to the latest version is easy to do with:

`$ ./update.sh`

After you create your world at the main menu in minetest, you shouldn't just enable all of the mods. Instead, you should merge the contents of the provided template file `world.mt` into your new world's `world.mt`.

Finally there is at least one configuration change to add to minetest: The default items! To have all new players be given the same initial items as on LinuxForks server, you need to enable the setting `give_initial_stuff` and set the minetest setting `initial_stuff` to have the right value. Add the following lines to your `minetest.conf`:

```
initial_stuff = default:torch 99,farming:hoe_steel,farming:rhubarb 2,farming:potato 2,farming:blueberries,default:pick_wood,default:stick,currency:minegeld_5 5
give_initial_stuff = true
```

## Licences
Some of the mods in this modpack are licensed under permissive licences like WTFPL and the MIT license. Others use copyleft licences like the GNU General Public License. More importantly, some of them are licensed under the GNU Affero General Public License (AGPL). This means that **if you modify any of those AGPL-licensed mods and use them on your minetest server, you must make the source code of your changed version available somewhere**.

Please see the readme or licence files for each mod to read their individual licenses.

### Licence for scripts
The scripts for installing this modpack I consider too trivial to copyright. Consider them public domain.

### Licence for this README
Copyright (C) 2020-2022 Blockhead. <br/>
Permission is granted to copy, distribute and/or modify this document
under the terms of the GNU Free Documentation License, Version 1.3
or any later version published by the Free Software Foundation;
with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
A copy of the license is included in the section entitled "GNU
Free Documentation License".

## Q&A
Q: Why are some of these mods using such old versions?

A: The mods are used on a popular public server, so any newer versions have to be tested before they are added, to make sure they don't break anything. Not testing has had serious consequences like the Great train service breakdowns, wherein all advtrains were lost. Sometimes the reason is that the mod author has broken something, so if the mod is going to be updated it has to be done as a fork and cherry-picking patches from upstream. Sometimes the philosophy of newer versions just doesn't agree; this is the reason `basic_materials` is avoided in this modpack.

There are some other questions and answers for specific mods below.

Q: You say some of these mods are not enabled in the below mod list and in the installation instructions. Why are some included then? Which mods do I enable?

A: Some of the mods are part of modpacks but not all of  the mods contained therein are used. For example, `mobs_croc` from `mobs_water` is not enabled because this modpack has no hostile mobs. A template `world.mt` file will be included in this modpack that has the default mod config. Some mods, like advprofiler, should only be enabled if you are testing. Still others like `builtin_item` I thought would be good to include in this modpack because they are included in the official mod archives of LinuxForks but not enabled on the server, and I think they are nice mods.

Q: Why does it take so long to launch a world in this modpack?

A: There are a lot of mods. This is not a lightweight modpack.

Q: Why is this README so long?

A: Mostly because of the descriptions of each mod included. The rationale for this is: Firstly that I have tried to give a nice overview of all the mods so you can understand what each one does. Secondly, some of the mods included don't have READMEs and really needed a bit of an explanation.

## Mods and modpacks included

### advboats
A mod that adds 'advanced boats'. The boats can be piloted like ordinary boats but their route can be recorded. After it is recorded, it will continuously play back. It was more of an early experiment by gpcf and is now superseded by the ferries from linetrack.

* Mod author: gpcf

### advprofiler (optional)
An 'advanced profiler' tool. This is mainly used to measure performance and identify lag sources on the LinuxForks server. You can use it to profile different functions by calling its API. It can make reports on how each of them performed into a TSV file.

* Mod author: orwell96

### advtrains
A modpack that adds realistic trains to minetest. See advtrains/readme.txt and other readmes included in each mod of the pack.

* [Forum topic](https://forum.minetest.net/viewtopic.php?f=11&t=14726)
* [Upstream git repository](https://git.bananach.space/advtrains.git/)
* [Bug tracker](https://bugs.linux-forks.de/advtrains/)
* [Wiki](https://advtrains.de/wiki/)
* See advtrains
* Authored by orwell96 with contributions by others, see

### advtrains\_freight\_train
A set of rollingstock for advtrains. Adds a reclaimable blue diesel engine with a top speed of 32 km/h, and freight wagons with models for gravel (ballast) wagons, lava wagons, train tracks and a wagon with a big log. 

* Mod author: mbb
* LinuxForks maintainer: Smacker

### advtrains\_platform
Adds a lot more options for materials to make platforms for the advtrains mod on top of the default sandstone and stone brick. Also adds 'level crossing' nodes (available in a few materilas) which are long flat nodes that cover tracks to give the look that the tracks are embedded in a road surface.

* Mod author: Och_Nö
* 45 degree platforms designed by Och_Nö and model made by Blockhead.

### animalworld
Chopped up Fork of Wilhelmine's Animal World mod that adds just a kangaroo. The mod also includes a crocodile but I am using the one from mobs\_animal by Tenplus1 for that.

INVESTIGATE: crocodile?

* Mod author: Wilhelmine/Skandarella
* [Forum thread](https://forum.minetest.net/viewtopic.php?t=26194&p=389980)
* AussieForks maintainer: Blockhead

### apartment
Allows users to rent a small area. The tenant is given access to place blocks in that area and over other protections like locked chests and doors.

Apartments have a category. Users can teleport to each of their apartment types with `/aphome <type> `. Players with the `apartment_unrent` privilege can forcibly remove players from their apartments.

* Original mod author: Sokomine
* LinuxForks maintainer: gpcf

### areas
Allows users to protect areas from node destruction. The protection is rectangular-prism shaped. TODO: use Blockhead's own version with some command improvements.

There are two levels of user: regular users and those with the `areas` privilege, called area admins. Depending on the settings, regular users may be able to protect their own areas. Area admins can protect areas of any size, ignore all protection and move or remove all areas.

* See areas/README.md for more information.
* Mod author: ShadowNinja
* With contributions by many others (see git logs)

### atm
A mod that allows players to keep an electronic bank balance. Players can deposit or withdraw from ATMs and send money to others with wire transfer terminals.

TODO: There is a known issue where putting certain characters into a wire transfer message can result in failing to draw the interface for the transaction history if you are the sender or recipient of such a message. This is probably fixable with minetest.formspec_escape().  

See atm/README.md for more information.

* Mod author: gpcf
* Additions by: Smacker

### australia
Replaces the biomes with a variety Australian ones with Australian grasses, trees and modified ore deposits.

Fork from Josselin2/axcore that updates it for Minetest 5.5.1 (previously was targeted at 0.4.x).

TODO: Montandalar/Blockhead fork that adds european crops to ships and dungeons when farming redo is present.
TODO: Colour grade bluestone
TODO: try the outback minerals
FIXME: that block of wood on top of trees

* Mod author: vlapsley/demonboy
* Fixes by: Josselin2/axcore
* [Forum thread](https://forum.minetest.net/viewtopic.php?f=9&t=14412) 

### auth_export
A component in two parts: A CGI script and a minetest mod. Together they facilitate authenticating minetest users externally to other programs. This is used to authenticate mediawiki users on the [LinuxForks Wiki](https://li-fo.de/wiki).

* See auth_export/README.md for more information.
* Author: gpcf, with reference to Thomas Rudin's minetest webmail mod (see authexport/README.md for authorship).

### bakedclay
A rudimentary mod that allows player to bake clay into hardened blocks and stain those blocks with dyes. All of the baked clay blocks can be made into stairs and slabs as well. 

* See bakedclay/README.md for more information

* Mod author: TenPlus1

### banish
A mod for server admins/moderators to banish misbehaving players to a specific area of the game. Banished players are not allowed to teleport away, and they should be kept in an area that is physically inescapable and protected with the areas mod. A server will typically have a jail/prison for this purpose.

Currently, some configuration will have to be done inside the lua source files to set the jail position. This mod also integrates with xban2 (also included in this modpack) to record when users are banished.

* Mod author: gpcf

### basic_trains
A collection of the oldest trains for advtrains. These trains used to be included with advtrains but have since been split out.

Mods inside are:
* advtrains\_train\_industrial: Two red industrial locomotives, a tank wagon and a wood stake wagon.
* advtrains\_train\_japan: A multiple-unit train with middle and end cars.
* advtrains\_train\_steam: Two steam locomotives, a steam-era passenger wagon and a box wagon.
* advtrains\_train\_subway: A subway wagon similar to a European subway/metro wagon from a system like Berlin U-Bahn.

This version includes Blockhead's better liveries for the subway wagons, which will make it into the mainline one day.

* Contributors: MBB, orwell96, Nathan Salapat, Krokoschlange, Blockhead - more detailed info available on the advtrains wiki
* [Advtrains Wiki - Catalogue](https://advtrains.de/wiki/doku.php?id=usage:trains:basic_trains)

### beerchat
A mod that adds chat channels. Users can create the channels with a password and set a colour for them. Includes logging capability.

* See beerchat/README.md for more information.
* Original mod author: evrooije
* Additions by many authors (see git log)
* Chat logging by gpcf

### bike
Adds a craftable, rideable, paintable bicycle. The bicycle painter is also used to colour the JRE-E231 train (also included in this modpack).

* Original mod author: Hume2

### billboard
Adds various nodes which are just a flat plane with a texture on them. These are mostly used for in-game transit maps. The set of maps from LinuxForks server is included in this modpack.

Warning: Putting billboards inside item frames is known to cause very bad lag spikes. Putting the billboard items in your hand can have similar, but not quite as bad, effects. This is because the billboards do not register a separate inventory thumbnail image but resample the full image down. A future version might allow registering separate inventory images and remove the issue.

* See billboard/README.md for more information.
* Original mod author: CrazyGInger72
* Additions by: acmgit
* LinuxForks maintainer: gpcf

### bonemeal
Adds bones to be found in dirt, bonemeal ground from bones, mulch made from tree trunks and leaves, and fertilizer from combining mulch and bonemeal. These fertilizers can be used to speed the growth of most plants from the farming mod.

* See bonemeal/README.md for more information.
* [Forum thread](https://forum.minetest.net/viewtopic.php?f=9&t=16446)
* Mod author: TenPlus1
* LinuxForks maintainer: Felfat

### bridger
Adds various wood and steel parts for constructing bridges (or other shapes out of steel), plus concrete foundations.

* Mod author: v-rob
* Contributions by: jat15, OgelGames
* [Forum thread](https://forum.minetest.net/viewtopic.php?t=18243)
* [ContentDB](https://forum.minetest.net/viewtopic.php?f=9&t=14412)

### c\_doors
'Centred doors'. Adds a set of doors which are centred in their block (unlike the default doors which are on one edge). It also adds some openable window-like doors. The doors and windows are available in steel, obsidian glass, glass and wood.

* Original mod author: TumeniNodes
* LinuxForks maintainer: Smacker

### canned_food
Allows you to preserve food in glass vessels. Some of the foods require sugar to be preserved. Some foods also age when stored in the dark and give even more nutritional value. You can tell the aged foods are ready when the lid changes to a checkerboard pattern.

* Mod author: Smacker
* See canned_food/README.md for more information

### config
'Configuration panel'. A configuration file in-game editor and code library by SorceryKid. Required for the debugging console mod.

* Mod author: sorcerykid
* [Forum thread](https://forum.minetest.net/viewtopic.php?f=9&t=24282)
* [ContentDB](https://content.minetest.net/packages/sorcerykid/config/)
* See config/README.txt for more information

### console
Debugging console mod by sorcerykid. Apart from viewing the debug log inside a formspec, it also allows all calls to a function to be intercepted and printed to do the debug log, known as 'piping'.

* Mod author: sorcerykid
* [Forum thread](https://forum.minetest.net/viewtopic.php?t=25433)
* [ContentDB](https://content.minetest.net/packages/sorcerykid/console/)
* See console/README.txt for more information

### cottages
A set of nodes for building medieval-era kind of houses, inside and out.

* See cottages/README.md for more information.
* Original mod author: Sokomine
* LinuxForks maintainer and author of many additions: Smacker

### craftguide
Adds a crafting guide sign and crafting guide book to the game. Interacting with either will open a crafting guide interface. Mostly redundant with Unified Inventory (included in this modpack) but it has been kept on the LinuxForks server so it available in this modpack.

* Mod author: Jean-Patrick Guerrero

### currency
Adds currency in the form of banknotes and some means to keep your items safe and safely trade.

The banknotes are of the fictional currency 'MineGeld' (MG). They come in 1 MG, 5 MG and 10 MG varieties. The banknotes can be exchanged for equivalent value by crafting; for example 5 1MG notes can make a 5MG note and a 10 MG note can be broken into 2 5MG notes. This modpack is also supposed to include the '1000 MG' commemorative banknotes (TODO, but the repository may not be up to date yet). These are used on the LinuxForks server as a limited-supply item released roughly each month.

Players are given currency as universal basic income every day (720 seconds) they place or break a node.

Also includes the safe, which is like a lower-capacity locked chest, but which has no skeleton key support. The skeleton keys you give someone for access to an ordinary chest may be distributed to others without your knowledge, but nobody can access your safe, except admins with the `protection_bypass` privilege.

Includes the barter table, a safe way to trade items instead of dropping them on the ground. Two players can put up to 12 items on their respective sides of the table. Minegeld notes might be some of the items used. To complete a transaction, both players must press confirm not once but twice. The items on offer cannot be switched after pressing confirm the first time, so you can be sure your trading partner will not switch their offer before you accept it. Transactions can also be cancelled. Unfortuntaly, barter tables are sometimes left partway through a transaction making them not useable to other parties and there is no easy fix to this yet.

Another way to trade is to use an exchange shop. The exchange shop allows you to offer stock at a set price and receive the payment of items securely into your shop to pick up later. The exchange shop is similar to the smartshop (also included in this modpack) except it looks like a chest, and does not/has never effect the item metadata (this was, at least historically, the main reason smartshops were avoided for sales of items like books and digtron crates). You may prefer to use `smartshops` since they support pipeworks.

* Original Mod author: Dan Duncombe
* Upstream maintained by: VanessaE
* Contributions by many others
* LinuxForks Maintainer: gpcf
* Commemorative note artwork by various contributors, see [this wiki page](https://wiki.linux-forks.de/mediawiki/index.php/Forks:Commemorative_Currency).

### digilines
Adds digital data transfer wires. They are used to send and receive data on channels. Many of the machines in technic support sending and receiving messages for control and data purposes; unfortunately mostly this is not well-documented and you will have to read the source or ask for help.

The luacontroller in mesecons can send data on them with `digiline_send(<channel>, <message>)` and run when it receives a digiline message.

This mod includes the digiline LCD which displays all messages it receives on a digiline input.

* See digilines/README.md for more information.
* Mod Author: Jeija
* [Forum Topic](https://forum.minetest.net/viewtopic.php?t=5263)

### digtron
Self-described as the "Modular Tunnel Boring Machine", and it also does much more. Very useful modular machines for digging and building, often at the same time.

This modpack includes the LinuxForks version of digtron which includes some bugfixes compared to FaceDeer's version. It also includes the master builder module, which can be used to set all of the builder modules on the digtron at once. You need `technic` enabled (included in this modpack) for the master builder since it requires a Control Logic Unit to craft.

* See digtron/README.md for more information.
* Original mod author: FaceDeer
* LinuxForks Maintainer: Smacker
* [Forum Thread](https://forum.minetest.net/viewtopic.php?t=16295)

### display_modpack
A modpack for displaying entities attached to nodes, usually such as text on signs. Includes a set of signs, steles (like gravestones) and some clocks (digital and analogue).

Submodules::

* display_lib
* font_lib
* ontime_clocks
* signs
* signs_road
* steles

The signs in minetest game without this mod are quite basic! They can only be read/written by right-clicking them.

TODO / known bug: The signs in signs_road are known to not recover after a `/clearobjects` event. 

* See display_modpack/README.md and the readme on each mod in the modpack for more information.
* Mod author: Pyrollo
* [Forum thread](https://forum.minetest.net/viewtopic.php?t=17134)

### dlxtrains_modpack
The *DlxTrains* modpack Marnack adds a variety of American and European rolling stock as AdvTrains wagons, and also a diesel locomotive. The wagons have livery and aging/weathering features.

* Mod author: Marnack
* [ContentDB](https://content.minetest.net/packages/Marnack/dlxtrains/)

### drawers
Adds high-capacity containers that hold only 1, 2 or 4 kinds of item. They can be inserted into with the pneumatic tubes from `pipeworks` (included in this modpack) or with the drawer controller. The drawer controller can be quite slow. When you put something into the controller, it will look for an attached drawer in a network and place the item into the appropriate drawer. There is no automatic way to with-drawer (pun intended) from the drawers.

The drawers can be upgraded with upgrades items made of various materials. Each drawer has 5 upgrade slots. TODO: this version is out of date, the LinuxForks server has mithril drawer upgrades now. These mithril drawer upgrades depend on `moreores`.

* See drawers/README.md for more information
* [Forum Topic](https://forum.minetest.net/viewtopic.php?t=17134)
* Mod author: LNJ

### dumpnodes
Dumps all of the node definitions to one file, nodes.txt in the world directory. Useful for making colours files for mt-mapper. Do not enable by default, has no privilege requirement!

### easteregg
Adds a set of painted chicken eggs in the tradition of painted easter eggs. They are available in the 14 dye colours. The yellouw [sic] egg is an easter egg that LinuxForks regulars will understand.

TODO: has an undeclared dependency on mobs_animal for the eggs. `dye` is included inside minetest_game now.

* Mod author: Hume2

### ehlphabet
The LinuxForks fork of ehlphabet, itself a fork of the original abjphabet mod.

Adds white blocks with black lettering on them. The letter machine can turn paper into either blocks or thin stickers. Currently supported scripts are:

* Latin alphabet
* German umlauts and eszett
* Russian alphabet
* Greek alphabet
* Some chinese characters like the cardinal directions and the symbols for cat and station (as in railway station). These chinese characters are crafted out of latin letters by spelling the English word from top-left to bottom right. e.g. NOR-TH for the symbol for north. Sorry these aren't currently in the crafting guide, you will have to read the source.

### elevator
The LinuxForks fork of 'Realtime elevators for minetest'. Elevators that will actually take time to move you up and down. This fork includes some mitigations against being thrown up into space or deep into the earth in case of lag; the elevator will slow down towards either end and try hard not to overshoot.

* Original author: Beha (shacknetisp)
* LinuxForks Maintainers: gpcf and Och_Nö
* [Forum thread](https://forum.minetest.net/viewtopic.php?t=17079)
* See elevator/README.md for more information.

### engrave
Adds an engraving table that allows you to rename items. Has potential to do bad stuff with items that have complex metadata - do not use to rename digtron crates, use the digtron crate interface for that.

* Mod author: orwell96
* [Forum thread](https://forum.minetest.net/viewtopic.php?f=11&t=17482)

### ethereal
Specifically ethereal_undo, the LinuxForks version. An extensive worldgen mod that some interesting biomes with new kinds of grass and trees, including the rare crystal and fiery biomes where the materials for crystal tools can be found.

* TODO: Work out how to disable most biomes

* See ethereal/README.md and the crafting guide for more information.
* Mod author: TenPlus1
* [Forum thread](https://forum.minetest.net/viewtopic.php?f=11&t=14638)
* LinuxForks maintainer: Felfa

### factory_bridges
Adds a set of walkways with bannisters, ladders and stairs made out of steel for use in industrial settings.

* Original mod author: narrnika
* Maintainers: Pandorabox (BuckarooBanzai, naturefreshmilk and others)

### farebox
Adds the farebox and faregate items.

The farebox sends a mesecon signal downwards when payment is received (however it is clunky to get working).

The faregate acts as a door that opens when payment is received and can also be opened with a mesecons signal 

* Mod author: gpcf
* Contributions from Krock (SmallJoker)
* [Forum thread](https://forum.minetest.net/viewtopic.php?t=18338)
* See farebox/README for more information.

### farming
Specifically, farming_undo, the LinuxForks fork of farming_redo by TenPlus1. Adds a variety of crops to the game. The crops can all have their growth sped up by the fertilizers from `bonemeal` (also included in this modpack); however there is a known bug that the cottonseed oil from technic does not work on crops (TODO). You can find the crops scattered throughout the world. Some of them may depend on the `ethereal` worldgen biomes.

* [Forum Thread](https://forum.minetest.net/viewtopic.php?id=9019)
* Original mod author: TenPlus1
* LinuxForks Maintainer: Felfa

### feedlot
An item that will automatically feed nearby animals if it contains food. Food can be piped in with the pneumatic tubes from `pipeworks` (included in this modpack). Animals will still need to be fed appropriate food to put them in the mood for breeding. The animals are added by the `mobs_animal` mod included in this modpack. The feedlot is a very important tool in automated farming.

The feedlot mod also includes the milker, which can accept a bucket and hold up to eight buckets of milk. It will passively milk cows that are nearby. You can remove the milk with a filter-injector.

* Mod author: gpcf
* [Forum thread](https://forum.minetest.net/viewtopic.php?t=18811)

### formspecs
ActiveFormspecs, a library for safe & secure formspec handling. So far only used by `console`.

* Mod author: sorcerykid
* [Forum thread](https://forum.minetest.net/viewtopic.php?f=9&t=19303)
* [ContentDB](https://content.minetest.net/packages/sorcerykid/formspecs/)
* See formspecs/README.txt for more information.

### freezer
Adds a freezer that runs on perpetual motion. It can be used to create a variety of frozen items like ice from water, and foods like popsicles and pelmeni. It supports pipeworks for input and output.

* Mod author: gpcf
* [Forum thread](https://forum.minetest.net/viewtopic.php?t=14925)

### gates
Adds a gate controller which can be used to set up a 'gate' as an area which can swap between two sets of nodes at-will, for example to make a drawbridge you can create one open version with the drawbridge down and a closed one with the drawbridge up. The gates have a limit of 32 in distance and volume of 6000 which you can configure in the source code.

* Mod author: Addi/adrido of king arthur's team, [king-arthur.eu]().
* [Forum thread](https://forum.minetest.net/viewtopic.php?t=9897)

### glass_stained
Adds a set of 12 stained glass varieties including nodes of glass that span multiple nodes in size to fill windows that have pkarcs and other shapes in them, as well as fancy spiked-top steel bars.

* Mod author: gpcf
* LinuxForks Maintainer: Smacker
* See glass_stained/README.md for more information.

### hangglider
Adds hang gliders which can be crafted out of wool. They can be deployed to slow your fall. 

* [Forum thread](https://forum.minetest.net/viewtopic.php?t=21425)
* Mod author: Piezo_
* LinuxForks maintainer: gpcf

### hiking
Hume2's `hiking_redo`. Adds a set of hiking signs for guiding people through trails. To prevent griefing, only those with the `hiking` privilege can place and remove the signs.

* [Forum thread](https://forum.minetest.net/viewtopic.php?t=12633)
* hiking_redo author: Hume2
* Original mod author: martian

### TODO Missing: Itemframes

### intllib
Internationali[sz]ation library for minetest. Deprecated under minetest 5.x and usually included within mods rather than on its own. Still, it is provided because it is loaded on LinuxForks and I am unsure whether anything depends on that.

* Mod author: kaeza

### jre_e231
LinuxForks branch of JRE E231 modpack. Adds a East Japan Railway Company E231 and E230 set of carriages.

* KuHa E231: Control car
* MoHa E230: Motor car
* MoHa E231: Motor car with pantograph
* SaHa E231: Trailer car

The train needs at least a KuHa E231 at both ends for proper operation and for realism you should have at least one MoHa E231 with a pantograph, even though the train runs on perpetual motion. 

These carriages can be painted with the bike painter from the included `bike` mod. This is called applying a *livery* and its API is experimental and unstable.

* Original mod author, model, motor sounds: Mainote
* LinuxForks maintainer, horn sound: Smacker.
* Livery feature: gpcf
* As it has not been written down and I have not asked them, I have no way of knowing if Smacker or Mainote copywronged these sounds. Sorry :(

### kebab
Döner kebab mod. Adds a kebab rotisserie which can be shaved with a sword. The shaved kebab meat can then be combined with meat to make a kebab.

* Mod author: gpcf

### lag\_warning
Warns of lag events: currently just when when mapblocks are being generated.

* Mod author: naturefreshmilk 

### ldm32
*Laser distance meter 32*. It measures the distance from itself to the next non-air block, within a range limit which is probably the active mapblock range.

* Mod author: laza83
* See ldm32/README.md for more information
* [Forum thread](https://forum.minetest.net/viewtopic.php?t=21653)

### linetrack
*Means of transport tracking lines*. A set of tracks and objects depending on `advtrains`. Currently it allows watertracks to be placed on water and provides ferries to travel on them. It also provides the normal ATC, LuaATC and Station/stop tracks like `advtrains` as well as buoy-like objects for TCBs and signals.

* Mod author: Hume2
* LinuxForks maintainer: gpcf
* See linetrack/readme for more information.

### lrfurn
*Living room furniture*. A set of seats in three sizes: armchair, sofa long sofa, plus coffee and end tables. These seats are the only items you can actually sit on in the forks modpack.

* Mod author: thefamilygrog66
* [Forum thread](https://forum.minetest.net/viewtopic.php?id=5407)
* See lrfurn.md for more information

### mail
*In-game email*. Allows users to send messages to each others' inboxes so they can be read at any time even if the user is offline. TODO: Currently no support for an outbox, however the adaption to the `laptop` mod has this functionality so it may end up being backported. 

* Mod author: cheapie
* [Forum thread](https://forum.minetest.net/viewtopic.php?t=14464)
* See mail/README.md for more information

### mailbox
Adds mailbox nodes that can other players can put stuff into but only the owner can retrieve from. This can be used e.g. for a post office or a mailbox in front of your house. Each mailbox can also be configured as just a letterbox, accepting only written books.

This LinuxForks version includes the mailbox for rent, which can also be unrented with the `mailbox:unrenter` tool. A post office would have a large number of mailboxes for rent.

* Mod author: everamzah with code from kilbith's x-decor mod
* LinuxForks maintainer: gpcf
* As far as I can tell, this mailbox is unrelated to the mailbox mod by Aqua.

### markers
Adds two kinds of markers for dealing with the `areas` mod. One is a striped red and white pole which is meant to be used in a set of up to four at a time, and allows you to view the area and volume inside the boundaries as well as pay money to protect the land - however you cannot bypass the usual area limit sizes and protection is free, so don't pay!. The other is a stone boundary marker which can aid you as a GUI to the `areas` mod by giving you area information about the local areas and your own area claims.

* Mod author: Sokomine
* LinuxForks maintainer: gpcf
* See markers/README.md for more information

### mapfix
Adds simple command `/mapfix [size]` that anyone can run. It will fix lighting and liquid flow inside its radius, up to a configured limit and with a default size. This has also been very helpful when the world database is slow to load mapblocks as it forces them to load.

* Mod author: Gael de Sailly
* [Forum thread](https://forum.minetest.net/viewtopic.php?t=10662)
* See mapfix/README.md for more information,
 
### maple
Adds a maple tree that can spawn in deciduous forest biomes during mapgen. It is a taller than the default apple tree, has a distinctive wood colour and is a bit more spherical in the shape of its foliage. The wood can be used in a variety of products in this modpack like `si_frames`, `drawers` and `pkarcs` and preserve it nice texture and colouration. 

* Mod author: ExeterDad
* LinuxForks maintainer: Smacker
* [Forum thread](https://forum.minetest.net/viewtopic.php?t=20449)
* See maple/README.md for more information.

### mesecons & mesecons_ratelimiter
Mesecons! They're yellow, they're conductive and they'll add a whole new dimension to Minetest's gameplay. A whole bunch of digital circuitry stuff.

All mods in the ordinary mesecons modpack are included as well as `mesecons_ratelimiter` which limits the frequency that mesecons devices can operate at.

* Mod author: Jeija and other contributors.
* `mesecons_ratelimiter` by NatureFreshMilk

### minetest_errata
A mod to fix small errors and omissions of other mods. Adds a variety of doors, glass panes, mossy blocks, cobblestones of sandstone and more.

FIXME: doesn't find default_key.png when buildng protectd door textures.

* Mod author: Smacker
* See minetest_errata/README.md for more information.

### minetest_hbhunger
*Hunger mod with HUD bar*. Introduces the satiation stat, where you have to eat to keep your satiation up, and regeneration or starvation can happen if your satiation is too low or high respectively.

TODO rename minetest_hbhunger -> hbhunger

* Original Mod author: BlockMen
* Maintainer: Wuzzy, with contributions by others
* LinuxForks Maintainer: 
* See minetest_hbhunger/README.md for more information.
* [Forum thread](https://forum.minetest.net/viewtopic.php?t=11336)

### minetest_hudbars
A library that adds HUD bars to the UI. In this modpack, it is used for the health and satiation bars.

TODO rename minetest_hudbars -> hudbars

* Original mod author: BlockMen
* Maintainer: Wuzzy
* See minetest_hudbars/README.md for more information.

### minetest_itemframes
Adds item frames and pedestals which can hold nodes and items. Only the owner of the item frame or pedestal can modify what's inside. Warning: do not put billboards inside the item frame! Doing so will cause a massive lag spike when the entity loads as the texture is resampled on the fly!

TODO rename minetest_itemframes -> itemframes

* Mod author: Zeg9, with contributions from VanessaE

### minetest_worldedit
Commands for doing edits to the game world. Unfortunately can often leave behind lighting errors. `mapfix` (included in this modpack) should help with the lighting errors.

* Mod author: Uberi, with contributions from many others.
* See minetest_worldedit/README.md for more information.

### mob_horse
Adds a tameable and rideable horse to the game based on the `mobs_redo` API.

* Mod author: Tenplus1
* See mob_horse/readme.md for more information.

### mobs_animal
Adds a variety of animal mobs to the game, some of which are domesticated and others that are wild. All hail the mighty penguin! Uses the `mobs_redo` API.

* Mod author: Tenplus1
* See mobs_animal/readme.md for more information.

### mobs_redo
A mob API library and set of basic mob-related items, including the handy mob fence which cannot be jumped over.

* Mod author: tenplus1
* See mobs_redo/readme.MD for more information.

### mobs_water
A set of water-related mobs for the `mobs_redo` API.

* The `mobs_crocs` mod is not enabled on LinuxForks as there are no hostile mobs there.
* Original mod author: blert2112
* Maintainer: R-one
* See mobs_water/README.md for more information 

### moreblocks
A set of many extra blocks including kinds of all-faces tree trunks, bricks, tiles, crafted stones, compressed and condensed cobblestone & dirt, empty bookshelves, glow glass varieties, 1:2 and 1:3 gravel slopes, stained glass in all the dye colours, various wooden tile shapes and 'trap' blocks that have no collision enabled.

Adds the circular saw, a tool for cutting many kinds of materials into a variety of shapes including slope, panel, edge, corner, stair, slope, and diagonal slope inner/outer varieties. Other shapes are available in this modpack with `mymillwork` and `technic`'s CNC machine.

* Original mod author: Calinou
* Contributions from Jat15, Xanthin, kilbith, Marcin, jp, pyrollo, sofar, Emon, Luka Vandervelden, Thomas-S, Richard Qian, VanessaE, Hugo Locurcio, Fixer, lemon-melon, AntumDeluge
* LinuxForks contributions by gpcf
* LinuxForks Maintainer: Och_Nö

### morelights
A large set of craftable lights, most of which are made with lightbulbs and bits of brass, metal, dyes etc. They come in a few varieties including modern, vintage, posts and blocks of grass, sandstone etc. with lights embeded.

This linuxforks edition prefers using the brass ingots from `technic` rather than `basic_materials` or the builtin `morelights_vintage:brass_ingot`, and adds the lights embedded in blocks of grass, stone and so on.

* Original mod author: random-geek
* LinuxForks maintainer: Smacker
* [Forum thread](https://forum.minetest.net/viewtopic.php?t=21464)
* See morelights/README.md for more information.

### moreores
Adds two new metals to the game: mithril and silver. Previously it added even more ores but most of those have been added to minetest_game over time.

Mithril is the strongest metal and the tools made from it are more durable than even mese tools. They are probably equivalent in durability to the crystal tools. Mithril is only found from y = 512 and below. It is also used in technic for the energy crystals, the sonic screwdriver (rechargeable screwdriver), drawer upgrades, the mithril chest (not useful in any way). Finally, it has used for an additional tool, the mithril scythe, which harvests and replants at the same time, increasing yields.

Silver is important in several `technic` applications due to its electrical conductivity.

* Original mod author: Calinou
* Contributions by Novatux, VanessaE, HybridDog, Richard Qian, Hugo Lucurcio, Thomas-S, AntumDeluge.
* Translations by pagliaccio (it), Xanthin (de), oscar (nl) and the UFRGS (pt_br).
* See moreores/README.md for more information.
* [Forum thread](https://forum.minetest.net/viewtopic.php?t=549)

### moretrains
A modpack that adds a variety of new rollingstock and motive power for advtrains, all of which have crafting recipes. Currently only the `moretrains_basic` set with the German-style locomotive and passenger carriage are used on LinuxForks, but there are other nice sets in the pack if you want to play with those.

This LinuxForks version has a texture size optimisation by  gpcf.

TODO: select appropriate mods, update fork version(?), disable carts

* Mod author: Rubberduck
* [Forum thread](https://forum.minetest.net/viewtopic.php?f=9&t=24112)

### my_arcade
Adds the pacmine minigame used on LinuxForks at the arcade in Origin and the myhighscore mod used to show highscores. The mario minigame is not used on LinuxForks.

* Mod authors: DonBatman and Ferk.
* See my_arcade/README.md for more information.

### mymillwork
Adds a millwork machine that can make nice shapes out of various materials. Shapes include crown moulds, columns, ceilings, beams and baseboards.

* Mod author: Donbatman
* Contributions by: sofar, pithydon, Jat15
* LinuxForks maintainer: laza83
* [Forum thread](https://forum.minetest.net/viewtopic.php?t=10425)

### pathv7
Adds jungle wood paths that wander throughout the world; they are supported with darker acacia 'bridge wood'. LinuxForks terminology is to calls these paths *highways*. Adds a set of stairs and corner stairs calls North/South/Southwest etc. which have different UV-maps so that the whole path is texture-aligned. 

The `technic` mod in this modpack adds the ability to put jungle wood into the compressor to produce mod jungle wood, and compress acacia wood into bridge wood, however there is currently no way to craft more of the various stair types.

* Mod author: paramat
* See pathv7/README.txt 

### pipeworks
Adds a set of pneumatic tubes, water pipes, and a few nodes that interact with them. This modpack includes the LinuxForks fork which does not depend on `basic_materials`.

The tubes have a few varieties, from the basic types to one-way, straight-only, through to sorting and lua sorting (programmed like the mesecons luacontroller). At a junction, items will always travel out the direction of a priority tube. There are also teleport tubes and accelerator tubes and tubes that conduct mesecons or digilines signals, and tubes that detect item flow and send a mesecons or digiline signal.

Inserting into the tubes is done with the filter-injectors. Itemwise filter-injectors take one item out at a time, while stackwise filter-injectors.

The modpack adds pipes that can be used for water transport. You can put water into them with the pump, control flow with the valves (controllable by mesecons) and dump water out with the spigot and fountainhead. You might want to use it for a shower or fountain! Unfortunately, the water tank cannot actually hold any water :(.

This mod also adds the node breaker, deployer, and dispenser. They are all activated with mesecons signals.

The node breaker simulates punching the node in front of it with the item in its inventory. This is very useful with the crystal shovel from `ethereal` and the node detector from `mesecons` to automatically harvest grass varieties, and with fishing rods (also from `ethereal`) for automatic fishing. When it breaks the node/applies some other action, the output is send through a pneumatic tube connection on the back.

The node deployer simulates right-clicking the item in front of it with items from its inventory. It has a 9 item inventory size and can accept input from pneumatic tubes. Not only can it be used to place nodes, it can also be used to deploy advtrains wagons and do other nifty stuff!

The dispenser drops one of the stacks out of its 9 item inventory when activated. It accepts pneumatic tube input from the back.

Finally the mod adds the autocrafter, which can be controlled by `digilines` to set its recipe, and the trash can which accepts input from pneumatic tubes, keeps one stack only and deletes any items in excess of that.

* [Wiki](https://gitlab.com/VanessaE/pipeworks/-/wikis/home)
* [Forum thread](forum.minetest.net/viewtopic.php?id=2155)
* Mod author: VanessaE
* Contributions by many others!

### pkarcs
Adds arc blocks: ordinary arcs as well as inner and outer corners. They are available in many materials including ones from many of the other mods in this modpack like etheral, bakedclay and moreblocks.

Q: How do I put glass panes in my windows if they have pkarcs?

A: Use the double, triple, quadruple and noncuple glass shapes available in `glass_stained`.

* [Forum thread](https://forum.minetest.net/viewtopic.php?t=14541)
* Mod author: PEAK
* This repository was initialized by gpcf, however he is not the original author.
* LinuxForks contributions by Smacker

### places
A homebrew mod of LinuxForks which holds the teleport commands for various locations such as Spawn, Origin, South Forest, Personhood and Trisiston. However, it has a straightforward API for registering commands for teleporting to specific coordinates, so you might consider using it on your own server. 

This mod also integrates with the justice systems on LinuxForks in the mods `banish` and `xban2`. Players cannot use these commands if they are jailed by `banish`; instead they are teleport to the `execution_pos` defined in the code.

* Mod author: gpcf

### pvp_areas (optional)
Allows admins with `pvp_areas_admin` privilege to mark areas as Player vs Player areas (PVP areas) or non-PVP areas, depending on the configuration. Was previously used to allow PvP just for the PvP arena at Origin on the LinuxForks server. It has now been retired.

* Mod author: Everamzah
* Additions by taikedz and AntumDelgue
* See pvp_areas/README.md for more information

### railroad_paraphernalia
A collection of railway-related equipment include point levers, the track blocker (like a derail), shunting signal and shunt limit post.

TODO: The shunting signal is newer than the `advtrains` TSS update, so it is currently not useful for actual shunting moves with that system. 

* Mod author: Smacker
* See railroad_paraphernalia/README.md for more information.

### realestate
Allows players to offer their protecteed `areas` for sale to other players with a For Sale sign. The sign asks for an area number - which must be one the sign owner owns, and a price, which is in MineGeld, the currency from the `currency` mod. Once that is configured, any player can walk up to the for sale sign and use it to buy that area. When they complete the purchase, it will automatically send the purchase price to the seller by wire transfer, and the sale sign will be deleted.

* Mod author: gpcf

### si_frames
*Superimposed frames*. A set of wooden window frames in a variety of materials. They are superimposed on your windows as another node. They are available in four shapes: quartered,  diagonal quartered, rhombus (centred diamond) and simple square. To place them, simply place them on the inside or outside of your windows. They occupy the node in front/behind the glass.

* Mod author: Smacker
* See si_frames/README.md for more information.

### signs_lib
Adds signs that have text displayed on them as an entity. It also provides a locked sign that only the owner can edit and remove. This particular version is quite a bit older than VanessaE's current version (this version is dated from January 2018) and does not depend on `basic_materials`; it also uses another font.

Apart from adding the text, it also allows you to colour the text with CGA colour codes - don't worry, no need to memorise them as they are displayed while you edit the signs. You can also manage sign macros with `/signs_macro list | set <macro> <string> | clear <macro>`. Warning/TODO: this command has no privilege attached to it, it is mostly security through obscurity. Refer to macros by starting a macro reference with an `@` character; for example `Trains to @terminus_a`. And yes, macros can refer to other macros.

The other signs, from `display_modpack` do not have the colour support but they do have macro support. Different signs have different default colours.

Q: Why does this exist when `display_modpack` does the same thing? Why does the modpack use both? <br/>
A: They have different authorship and they have different sets of signs. Plus `display_modpack` has the clocks as well. Also see the forum thread for a history of this mod.

Q: What if I make a circular macro reference? <br/>
A: It won't crash the server, because each macro is evaluated only once.

* [Forum thread](https://forum.minetest.net/viewtopic.php?t=13762)
* Mod author: Kaeza
* Contributions from many others
* Maintainer: VanessaE

### skinsdb
Allows players to set a skin from a selection provided by the server. The skin selection menu is available from an icon inside `unified_inventory`.

FIXME: Input sanitisation, update the mod!

* warning/TODO: this mod includes some commands, which, if given no or incorrect arguments can crash the server! 
* See skinsdb/README.md for more information
* 

### smartshop
A node that can sell up to 4 different items and receive payment by items as well. The typical method of payment is the minegeld notes from `currency`, but of course you can use it to buy, sell or trade. For buying and selling multiple items at once, use the exchange shop from `currency`. You can insert items into it with pneumatic tubes from behind; it will only accept items it sells from the pipe. You can take items out of it - for example, the money spent or the items bought - with a filter injector below that faces downwards. To take items out however, you may need to set a filter on the filter-injector.

* Mod author: AiTechEye
* LinuxForks maintainer: gpcf

###some_more_trains
FIXME: Install

### technic
A rather huge and all-encompassing technology and automation mod. It affects worldgen: it adds a number of metals to the world, as well as marble and granite and a new species of tree: the rubber tree. Using these natural resources of various metals and organic products like rubber and plastic you can make a large number of machines. The machines require power and can perform different tasks; they can all be connected with `pipeworks`. The machines can be powered by three voltages: Low, Medium and High Voltage (LV, MV and HV). Power generation is easiest with the LV hydro generators.

The machines can not only automate tasks for you but improve the yields on certain processes and enable you to do new things. For example, grinding ore before smelting it will double the amount of metal yielded, and tools can be repaired with the MV tool workshop. There are also hand tools to help with your tasks like the mining drill, mining laser and walking tractor (for tilling).

Technic also adds some extra utility and fun nodes that are `extranodes`. You can craft trampolines and fall dampeners, concrete and more.

This fork of technic is quite diverged from the mainstream and may be different from what you are used to if you have used mainstream technic. It includes a lot of additional features that have accumulated over the years. It is currently not particularly well-documented in all of its nooks and crannies. The best way to learn is to ask on the LinuxForks server. This fork of technic does not depend on `basic_materials`; it can add the recipes for unprocessed parafin and plastic itself in `extranodes` if they are not added by pipeworks.

* Original mod author: RealBadAngel
* Contributions by many others
* LinuxForks Maintainer: Smacker
* [Forum thread](https://forum.minetest.net/viewtopic.php?t=2538)
* For more information, see technic/README.md

### teleport_potion
Adds an item and a node for teleportation. The teleport potion, can be used for one-time teleportation at the cost of 4 diamonds. The teleport pad can be crafted out of 4 teleport potions. You can enter any coordinates into the teleport pad to enchant its location, then step onto the pad to teleport to the target.

* Mod author: TenPlus1
* [Forum thread](https://forum.minetest.net/viewtopic.php?f=9&t=9234)
* See teleport_potion/README.md for more information 

### textline
Adds a 3 node wide display that accepts text over a digiline. Operates similarly to the digiline LCD included with digilines but is a bit more readable.

You will need to write a script on a luacontroller to perform more advanced display operations that span a larger area than the 3x1 size of the textline on its own.

* Mod author: gbl08ma
* See textline/README.md for more information  

### tfl_s7_stock
Adds a set of two advtrain carriages based on the Transport for London (TfL) S7 stock used on the London Underground. There is no sound available for this one sorry :(. Also note that escaping the driver's seat may be difficult because of the size of entity boxes in advtrains: you need to right-click on the centre of the carriage to open the menu in advtrains.  

* Mod author: Mainote
* See tfl_s7_stock/README.md for more information

### timekeeper
A library for easy recurring timers, handled centrally. So far used just by `console`.

* Mod author: sorcerykid
* [Forum thread](https://forum.minetest.net/viewtopic.php?f=9&t=25142)
* [ContentDB](https://content.minetest.net/packages/sorcerykid/timekeeper/)
* See timekeeper/README.txt for more information.

### poshud
Adds the position, maximum lag and optionally mapblock coordinates as a HUD element. TODO: later versions include advtrains railwaytime.

* Mod author: orwell96
* Contributions by naturefreshmilk

### steel
Adds a steel derivative for crafting a few products: steel blocks that rust when near water, corrugated roofing, steel fences and grates & struts. The steel used can be recycled unless it is rusted.

* Original mod author: João Mato/minetesting
* Maintainers: mt-mod
* Contributors: Zeg9, VanessaE, wsor4035
* [Forum thread](https://forum.minetest.net/viewtopic.php?t=2014)

### towercrane
Adds a crane that can be deployed in any area that you own or any free area. It adds a temporary protection on the area it is deployed on that gets removed with the crane. To use the crane, you first configure how far up and across the crane extends its arm. The crane is then activated from the node on its base, giving you flying privilege limited to within the crane's area of effect.

This version includes a patch from gpcf that fixes a crash when the area can't be protected. TODO: This version of towercrane is actually incredibly old, and the above patched bug may already be fixed upstream. 

* Mod author: joe7575
* Patch by: gpcf
* See towercrane/README.md

### TNT
Safe TNT fork by gpcf. The TNT has a configurable minimum depth to keep the surface world safe for multiplayer. On LinuxForks, TNT is only allowed to be ignited under y = -200.

* Original mod authors: PilzAdam and ShadowNinja
* LinuxForks maintainer: gpcf

### trainblocks
Adds a set of railway-related blocks for showing information about what trains are found where.

* TODO: Switch to my fork

* German-style U-bahn, S-bahn and 'trains this way' signs.
* Coloured signs for subway lines numbered from 1-10 that match the feature of advtrains_subway where subway wagons that are assigned a line numbered 1-10 change their texture to display that line on the front of the train.
* Dark blue signs numbered 1-10 for identifying platforms/tracks at a railway station.

TODO: Blockhead has written a version with crafting recipes for the platform signs and additional signs, use it.

* Author: maxxmodding
* [Forum thread](https://forum.minetest.net/viewtopic.php?t=19743)
* [mainstream repo](https://github.com/maxhipp/trainblocks_bc): The author of the mod force pushed and changed the history from the linuxforks version. That force pushed version is here. 
* See trainblocks/README.md for more information.

### trash_can
Adds a wooden trash can and dumpster that you can empty with the click of a button. Items thrown on the ground near the trash can will automatically go into it.

There is another mod with this name on the minetest forums, but this is Evergreen's version.

* Mod author: Evergreen
* [Forum thread](https://forum.minetest.net/viewtopic.php?f=11&t=6315)
* [ContentDB](https://content.minetest.net/packages/Evergreen/trash_can/)
* See trash_can/README.txt for more information

### unified_inventory
Overhauls the default inventory screen from minetest and adds integrations of UI icons for features from other mods. Includes searching and a crafting guide, as well as additional features for users with privileges to set the time of day and creative users to give themselves items. Includes a crafting guide. Much more user-friendly than the default survival and creative inventories.

This older version of unified inventory has bags made from cotton rather than string.

* Mod author: RealBadAngel
* With contributions from many others
* See unified_inventory/README.md for more information

### walkway
Adds what are effectively moving travelators to the game, available as slopes and flat blocks, allowing you to move faster in theory. They don't play very nice with lag.

* Mod author: gpcf
* [Forum thread](https://forum.minetest.net/viewtopic.php?t=17987)

### wine
Specifically `wine_undo`. No longer just wine, adds a wide variety of alcoholic beverages to the game. Integrates well with `farming` (actually `farming_undo`) in this modpack. Adds the agave plant used to make tequila.

Alcoholic beverages are brewed in barrels and take to produce. The barrels support input and output through pipeworks. Different input materials will ferment to different kinds of drinks in the barrels.

* Original mod author: TenPlus1
* LinuxForks `wine_undo` maintainer: Felfa

### xban2
*Extended ban 2*. Adds a variety of features for moderators to record the history of a player misbehaving. You can leave notes on a player's recorded manually. Record entries are also added when players are kicked, banned or temporarily banned through the mod (`/xkick`, `/xban`, `/xtempban`) and you can view their record with `/xr <player>`.

This LinuxForks version of xban is maintained by gpcf and may have different features and bugfixes. I am not an expert.

* Original mod author: kaeza
* Contributions by many others
* LinuxForks maintainer: gpcf

## Credits
To all the many mod authors and contributors and maintainers on LinuxForks, thank you for writing, extending and bugfixing these mods. I have tried to credit the authors accurately and by their names in the minetest community above. If you want to be credited by your real name or have a problem with the attribution above, please tell me and I will rectify it. In such a large modpack, it's entirely possible I have made a mistake.

To the minetest engine team, thank you for making these mods possible.

To gpcf for hosting the LinuxForks server and making it a great co-operative and transparent place and publishing the mod archives he uses on his server.

To BuckarooBanzay for giving me the idea of managing a modpack with git submodules.

## GNU Free Documentation License

Version 1.3, 3 November 2008

Copyright (C) 2000, 2001, 2002, 2007, 2008 Free Software Foundation,
Inc. <https://fsf.org/>

Everyone is permitted to copy and distribute verbatim copies of this
license document, but changing it is not allowed.

#### 0. PREAMBLE

The purpose of this License is to make a manual, textbook, or other
functional and useful document "free" in the sense of freedom: to
assure everyone the effective freedom to copy and redistribute it,
with or without modifying it, either commercially or noncommercially.
Secondarily, this License preserves for the author and publisher a way
to get credit for their work, while not being considered responsible
for modifications made by others.

This License is a kind of "copyleft", which means that derivative
works of the document must themselves be free in the same sense. It
complements the GNU General Public License, which is a copyleft
license designed for free software.

We have designed this License in order to use it for manuals for free
software, because free software needs free documentation: a free
program should come with manuals providing the same freedoms that the
software does. But this License is not limited to software manuals; it
can be used for any textual work, regardless of subject matter or
whether it is published as a printed book. We recommend this License
principally for works whose purpose is instruction or reference.

#### 1. APPLICABILITY AND DEFINITIONS

This License applies to any manual or other work, in any medium, that
contains a notice placed by the copyright holder saying it can be
distributed under the terms of this License. Such a notice grants a
world-wide, royalty-free license, unlimited in duration, to use that
work under the conditions stated herein. The "Document", below, refers
to any such manual or work. Any member of the public is a licensee,
and is addressed as "you". You accept the license if you copy, modify
or distribute the work in a way requiring permission under copyright
law.

A "Modified Version" of the Document means any work containing the
Document or a portion of it, either copied verbatim, or with
modifications and/or translated into another language.

A "Secondary Section" is a named appendix or a front-matter section of
the Document that deals exclusively with the relationship of the
publishers or authors of the Document to the Document's overall
subject (or to related matters) and contains nothing that could fall
directly within that overall subject. (Thus, if the Document is in
part a textbook of mathematics, a Secondary Section may not explain
any mathematics.) The relationship could be a matter of historical
connection with the subject or with related matters, or of legal,
commercial, philosophical, ethical or political position regarding
them.

The "Invariant Sections" are certain Secondary Sections whose titles
are designated, as being those of Invariant Sections, in the notice
that says that the Document is released under this License. If a
section does not fit the above definition of Secondary then it is not
allowed to be designated as Invariant. The Document may contain zero
Invariant Sections. If the Document does not identify any Invariant
Sections then there are none.

The "Cover Texts" are certain short passages of text that are listed,
as Front-Cover Texts or Back-Cover Texts, in the notice that says that
the Document is released under this License. A Front-Cover Text may be
at most 5 words, and a Back-Cover Text may be at most 25 words.

A "Transparent" copy of the Document means a machine-readable copy,
represented in a format whose specification is available to the
general public, that is suitable for revising the document
straightforwardly with generic text editors or (for images composed of
pixels) generic paint programs or (for drawings) some widely available
drawing editor, and that is suitable for input to text formatters or
for automatic translation to a variety of formats suitable for input
to text formatters. A copy made in an otherwise Transparent file
format whose markup, or absence of markup, has been arranged to thwart
or discourage subsequent modification by readers is not Transparent.
An image format is not Transparent if used for any substantial amount
of text. A copy that is not "Transparent" is called "Opaque".

Examples of suitable formats for Transparent copies include plain
ASCII without markup, Texinfo input format, LaTeX input format, SGML
or XML using a publicly available DTD, and standard-conforming simple
HTML, PostScript or PDF designed for human modification. Examples of
transparent image formats include PNG, XCF and JPG. Opaque formats
include proprietary formats that can be read and edited only by
proprietary word processors, SGML or XML for which the DTD and/or
processing tools are not generally available, and the
machine-generated HTML, PostScript or PDF produced by some word
processors for output purposes only.

The "Title Page" means, for a printed book, the title page itself,
plus such following pages as are needed to hold, legibly, the material
this License requires to appear in the title page. For works in
formats which do not have any title page as such, "Title Page" means
the text near the most prominent appearance of the work's title,
preceding the beginning of the body of the text.

The "publisher" means any person or entity that distributes copies of
the Document to the public.

A section "Entitled XYZ" means a named subunit of the Document whose
title either is precisely XYZ or contains XYZ in parentheses following
text that translates XYZ in another language. (Here XYZ stands for a
specific section name mentioned below, such as "Acknowledgements",
"Dedications", "Endorsements", or "History".) To "Preserve the Title"
of such a section when you modify the Document means that it remains a
section "Entitled XYZ" according to this definition.

The Document may include Warranty Disclaimers next to the notice which
states that this License applies to the Document. These Warranty
Disclaimers are considered to be included by reference in this
License, but only as regards disclaiming warranties: any other
implication that these Warranty Disclaimers may have is void and has
no effect on the meaning of this License.

#### 2. VERBATIM COPYING

You may copy and distribute the Document in any medium, either
commercially or noncommercially, provided that this License, the
copyright notices, and the license notice saying this License applies
to the Document are reproduced in all copies, and that you add no
other conditions whatsoever to those of this License. You may not use
technical measures to obstruct or control the reading or further
copying of the copies you make or distribute. However, you may accept
compensation in exchange for copies. If you distribute a large enough
number of copies you must also follow the conditions in section 3.

You may also lend copies, under the same conditions stated above, and
you may publicly display copies.

#### 3. COPYING IN QUANTITY

If you publish printed copies (or copies in media that commonly have
printed covers) of the Document, numbering more than 100, and the
Document's license notice requires Cover Texts, you must enclose the
copies in covers that carry, clearly and legibly, all these Cover
Texts: Front-Cover Texts on the front cover, and Back-Cover Texts on
the back cover. Both covers must also clearly and legibly identify you
as the publisher of these copies. The front cover must present the
full title with all words of the title equally prominent and visible.
You may add other material on the covers in addition. Copying with
changes limited to the covers, as long as they preserve the title of
the Document and satisfy these conditions, can be treated as verbatim
copying in other respects.

If the required texts for either cover are too voluminous to fit
legibly, you should put the first ones listed (as many as fit
reasonably) on the actual cover, and continue the rest onto adjacent
pages.

If you publish or distribute Opaque copies of the Document numbering
more than 100, you must either include a machine-readable Transparent
copy along with each Opaque copy, or state in or with each Opaque copy
a computer-network location from which the general network-using
public has access to download using public-standard network protocols
a complete Transparent copy of the Document, free of added material.
If you use the latter option, you must take reasonably prudent steps,
when you begin distribution of Opaque copies in quantity, to ensure
that this Transparent copy will remain thus accessible at the stated
location until at least one year after the last time you distribute an
Opaque copy (directly or through your agents or retailers) of that
edition to the public.

It is requested, but not required, that you contact the authors of the
Document well before redistributing any large number of copies, to
give them a chance to provide you with an updated version of the
Document.

#### 4. MODIFICATIONS

You may copy and distribute a Modified Version of the Document under
the conditions of sections 2 and 3 above, provided that you release
the Modified Version under precisely this License, with the Modified
Version filling the role of the Document, thus licensing distribution
and modification of the Modified Version to whoever possesses a copy
of it. In addition, you must do these things in the Modified Version:

-   A. Use in the Title Page (and on the covers, if any) a title
    distinct from that of the Document, and from those of previous
    versions (which should, if there were any, be listed in the
    History section of the Document). You may use the same title as a
    previous version if the original publisher of that version
    gives permission.
-   B. List on the Title Page, as authors, one or more persons or
    entities responsible for authorship of the modifications in the
    Modified Version, together with at least five of the principal
    authors of the Document (all of its principal authors, if it has
    fewer than five), unless they release you from this requirement.
-   C. State on the Title page the name of the publisher of the
    Modified Version, as the publisher.
-   D. Preserve all the copyright notices of the Document.
-   E. Add an appropriate copyright notice for your modifications
    adjacent to the other copyright notices.
-   F. Include, immediately after the copyright notices, a license
    notice giving the public permission to use the Modified Version
    under the terms of this License, in the form shown in the
    Addendum below.
-   G. Preserve in that license notice the full lists of Invariant
    Sections and required Cover Texts given in the Document's
    license notice.
-   H. Include an unaltered copy of this License.
-   I. Preserve the section Entitled "History", Preserve its Title,
    and add to it an item stating at least the title, year, new
    authors, and publisher of the Modified Version as given on the
    Title Page. If there is no section Entitled "History" in the
    Document, create one stating the title, year, authors, and
    publisher of the Document as given on its Title Page, then add an
    item describing the Modified Version as stated in the
    previous sentence.
-   J. Preserve the network location, if any, given in the Document
    for public access to a Transparent copy of the Document, and
    likewise the network locations given in the Document for previous
    versions it was based on. These may be placed in the "History"
    section. You may omit a network location for a work that was
    published at least four years before the Document itself, or if
    the original publisher of the version it refers to
    gives permission.
-   K. For any section Entitled "Acknowledgements" or "Dedications",
    Preserve the Title of the section, and preserve in the section all
    the substance and tone of each of the contributor acknowledgements
    and/or dedications given therein.
-   L. Preserve all the Invariant Sections of the Document, unaltered
    in their text and in their titles. Section numbers or the
    equivalent are not considered part of the section titles.
-   M. Delete any section Entitled "Endorsements". Such a section may
    not be included in the Modified Version.
-   N. Do not retitle any existing section to be Entitled
    "Endorsements" or to conflict in title with any Invariant Section.
-   O. Preserve any Warranty Disclaimers.

If the Modified Version includes new front-matter sections or
appendices that qualify as Secondary Sections and contain no material
copied from the Document, you may at your option designate some or all
of these sections as invariant. To do this, add their titles to the
list of Invariant Sections in the Modified Version's license notice.
These titles must be distinct from any other section titles.

You may add a section Entitled "Endorsements", provided it contains
nothing but endorsements of your Modified Version by various
partiesâ€”for example, statements of peer review or that the text has
been approved by an organization as the authoritative definition of a
standard.

You may add a passage of up to five words as a Front-Cover Text, and a
passage of up to 25 words as a Back-Cover Text, to the end of the list
of Cover Texts in the Modified Version. Only one passage of
Front-Cover Text and one of Back-Cover Text may be added by (or
through arrangements made by) any one entity. If the Document already
includes a cover text for the same cover, previously added by you or
by arrangement made by the same entity you are acting on behalf of,
you may not add another; but you may replace the old one, on explicit
permission from the previous publisher that added the old one.

The author(s) and publisher(s) of the Document do not by this License
give permission to use their names for publicity for or to assert or
imply endorsement of any Modified Version.

#### 5. COMBINING DOCUMENTS

You may combine the Document with other documents released under this
License, under the terms defined in section 4 above for modified
versions, provided that you include in the combination all of the
Invariant Sections of all of the original documents, unmodified, and
list them all as Invariant Sections of your combined work in its
license notice, and that you preserve all their Warranty Disclaimers.

The combined work need only contain one copy of this License, and
multiple identical Invariant Sections may be replaced with a single
copy. If there are multiple Invariant Sections with the same name but
different contents, make the title of each such section unique by
adding at the end of it, in parentheses, the name of the original
author or publisher of that section if known, or else a unique number.
Make the same adjustment to the section titles in the list of
Invariant Sections in the license notice of the combined work.

In the combination, you must combine any sections Entitled "History"
in the various original documents, forming one section Entitled
"History"; likewise combine any sections Entitled "Acknowledgements",
and any sections Entitled "Dedications". You must delete all sections
Entitled "Endorsements".

#### 6. COLLECTIONS OF DOCUMENTS

You may make a collection consisting of the Document and other
documents released under this License, and replace the individual
copies of this License in the various documents with a single copy
that is included in the collection, provided that you follow the rules
of this License for verbatim copying of each of the documents in all
other respects.

You may extract a single document from such a collection, and
distribute it individually under this License, provided you insert a
copy of this License into the extracted document, and follow this
License in all other respects regarding verbatim copying of that
document.

#### 7. AGGREGATION WITH INDEPENDENT WORKS

A compilation of the Document or its derivatives with other separate
and independent documents or works, in or on a volume of a storage or
distribution medium, is called an "aggregate" if the copyright
resulting from the compilation is not used to limit the legal rights
of the compilation's users beyond what the individual works permit.
When the Document is included in an aggregate, this License does not
apply to the other works in the aggregate which are not themselves
derivative works of the Document.

If the Cover Text requirement of section 3 is applicable to these
copies of the Document, then if the Document is less than one half of
the entire aggregate, the Document's Cover Texts may be placed on
covers that bracket the Document within the aggregate, or the
electronic equivalent of covers if the Document is in electronic form.
Otherwise they must appear on printed covers that bracket the whole
aggregate.

#### 8. TRANSLATION

Translation is considered a kind of modification, so you may
distribute translations of the Document under the terms of section 4.
Replacing Invariant Sections with translations requires special
permission from their copyright holders, but you may include
translations of some or all Invariant Sections in addition to the
original versions of these Invariant Sections. You may include a
translation of this License, and all the license notices in the
Document, and any Warranty Disclaimers, provided that you also include
the original English version of this License and the original versions
of those notices and disclaimers. In case of a disagreement between
the translation and the original version of this License or a notice
or disclaimer, the original version will prevail.

If a section in the Document is Entitled "Acknowledgements",
"Dedications", or "History", the requirement (section 4) to Preserve
its Title (section 1) will typically require changing the actual
title.

#### 9. TERMINATION

You may not copy, modify, sublicense, or distribute the Document
except as expressly provided under this License. Any attempt otherwise
to copy, modify, sublicense, or distribute it is void, and will
automatically terminate your rights under this License.

However, if you cease all violation of this License, then your license
from a particular copyright holder is reinstated (a) provisionally,
unless and until the copyright holder explicitly and finally
terminates your license, and (b) permanently, if the copyright holder
fails to notify you of the violation by some reasonable means prior to
60 days after the cessation.

Moreover, your license from a particular copyright holder is
reinstated permanently if the copyright holder notifies you of the
violation by some reasonable means, this is the first time you have
received notice of violation of this License (for any work) from that
copyright holder, and you cure the violation prior to 30 days after
your receipt of the notice.

Termination of your rights under this section does not terminate the
licenses of parties who have received copies or rights from you under
this License. If your rights have been terminated and not permanently
reinstated, receipt of a copy of some or all of the same material does
not give you any rights to use it.

#### 10. FUTURE REVISIONS OF THIS LICENSE

The Free Software Foundation may publish new, revised versions of the
GNU Free Documentation License from time to time. Such new versions
will be similar in spirit to the present version, but may differ in
detail to address new problems or concerns. See
<https://www.gnu.org/licenses/>.

Each version of the License is given a distinguishing version number.
If the Document specifies that a particular numbered version of this
License "or any later version" applies to it, you have the option of
following the terms and conditions either of that specified version or
of any later version that has been published (not as a draft) by the
Free Software Foundation. If the Document does not specify a version
number of this License, you may choose any version ever published (not
as a draft) by the Free Software Foundation. If the Document specifies
that a proxy can decide which future versions of this License can be
used, that proxy's public statement of acceptance of a version
permanently authorizes you to choose that version for the Document.

#### 11. RELICENSING

"Massive Multiauthor Collaboration Site" (or "MMC Site") means any
World Wide Web server that publishes copyrightable works and also
provides prominent facilities for anybody to edit those works. A
public wiki that anybody can edit is an example of such a server. A
"Massive Multiauthor Collaboration" (or "MMC") contained in the site
means any set of copyrightable works thus published on the MMC site.

"CC-BY-SA" means the Creative Commons Attribution-Share Alike 3.0
license published by Creative Commons Corporation, a not-for-profit
corporation with a principal place of business in San Francisco,
California, as well as future copyleft versions of that license
published by that same organization.

"Incorporate" means to publish or republish a Document, in whole or in
part, as part of another Document.

An MMC is "eligible for relicensing" if it is licensed under this
License, and if all works that were first published under this License
somewhere other than this MMC, and subsequently incorporated in whole
or in part into the MMC, (1) had no cover texts or invariant sections,
and (2) were thus incorporated prior to November 1, 2008.

The operator of an MMC Site may republish an MMC contained in the site
under CC-BY-SA on the same site at any time before August 1, 2009,
provided the MMC is eligible for relicensing.

### ADDENDUM: How to use this License for your documents

To use this License in a document you have written, include a copy of
the License in the document and put the following copyright and
license notices just after the title page:

        Copyright (C)  YEAR  YOUR NAME.
        Permission is granted to copy, distribute and/or modify this document
        under the terms of the GNU Free Documentation License, Version 1.3
        or any later version published by the Free Software Foundation;
        with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
        A copy of the license is included in the section entitled "GNU
        Free Documentation License".

If you have Invariant Sections, Front-Cover Texts and Back-Cover
Texts, replace the "with â€¦ Texts." line with this:

        with the Invariant Sections being LIST THEIR TITLES, with the
        Front-Cover Texts being LIST, and with the Back-Cover Texts being LIST.

If you have Invariant Sections without Cover Texts, or some other
combination of the three, merge those two alternatives to suit the
situation.

If your document contains nontrivial examples of program code, we
recommend releasing these examples in parallel under your choice of
free software license, such as the GNU General Public License, to
permit their use in free software.
