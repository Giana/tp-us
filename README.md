# TP-Us

TP-Us is a script for FiveM QBCore providing commands for teleporting yourself and/or someone else to specified coordinates.

<h1>INSTALLATION GUIDE</h1>

1. Drop the tp-us folder into your [standalone] folder (or whichever other ensured folder you want to use)
2. Use "add_ace" in your server.cfg to give desired access to the commands
   1. Ex: add_ace group.admin "tper" allow
   2. Ex. add_ace identifier.steam:xxxxxxxxxxxxxxx "tper" allow
   3. For more info: https://forum.cfx.re/t/basic-aces-principals-overview-guide/90917

<h1>FEATURES</h1>

- /tpme [x] [y] [z] used to teleport yourself
  - Ex. /tpme -70.15 -1762.1 29.56
- /tpyou [id] [x] [y] [z] used to teleport someone by server ID
  - Ex. /tpyou 4 -70.15 -1762.1 29.56
- /tpus [id] [x] [y] [z] used to teleport yourself + someone by server ID
    - Ex. /tpus 4 -70.15 -1762.1 29.56

**IMAGES**
-----
![/tpme Command](https://i.ibb.co/82FxtCt/tpmecommand.gif)

**DEPENDENCIES**
-----
- QBCore - https://github.com/qbcore-framework
