gluon-v14tov15-helper
=====================

This is a script to help the transition for nodes that only have a mesh connection into a new incompatible mesh-protocol, in this README from B.A.T.M.A.N. v14 to B.A.T.M.A.N. v15.

A really simple one, checks via cronjob every hours with `batctl gwl` if it can reach some gateways. If not, it will do some magic by creating a new Interface and logging in as client into a fixed, defined open Freifunk WiFi and force an immediate autoupdate (if autoupdate is not turned off).

## Migration helper
This script also helps in other cases, where an uplink node becomes incompatible - so some call it "migrationhelper".

## Warning
There is one scenario where it cant help at all, this is also the case in general without this package.
Imagine a mesh cloud with two nodes: one uplink, one mesh-only. The uplink node has the autoupdater disabled (or for whatever reason won't update) .. so it runs an old legacy Firmware. The Meshing node gets an update, it doesnt matter if by this script or the normal way. The meshing node with the actual firmware is compatible with your Freifunk-net but cannot mesh no longer with this specific uplink-legacy-node, which will end in loosing Internet- and Freifunk-connectivity completely for the meshing node. If additionally you **use an "SSID-changer"** script (for example https://github.com/Freifunk-Nord/gluon-ssid-changer), that changes the SSID to "FF_OFFLINE_NODENAME", then this scenario should only be a rare case. 

## Detailed instructions
1. You need to build a Firmware with `gluon-v14tov15-helper` added to your site.mk
and roll it out with `gluon-mesh-batman-adv-14` still there:

    #### Create a file `modules` , add the following content in your site directory:
  
        GLUON_SITE_FEEDS="v14-to-v15-helper"
        PACKAGES_V14-TO-V15-HELPER_REPO=https://github.com/viisauksena/gluon-v14tov15-helper.git
        PACKAGES_V14-TO-V15-HELPER_COMMIT=ac405720a7ab5f....actual.comit....
        PACKAGES_V14-TO-V15-HELPER_BRANCH=master

    #### You can add the package `gluon-v14tov15-helper` to your `site.mk`

2. If **all nodes** got updated with the new firware that in cludes this tool, you can start to build a firmware with v15 and roll this out.

3. **At this time some of your fastd-servers (gateway, supernodes) have to speak batman v14 and some v15
by the time you can remove more and more the old v14 servers**

Now a node deep inside the mesh network (behind some meshing nodes) or nodes which are offline often for one or another reason will get a possibility to get their update even if everybody else in your Freifunk community is already updated to the new incompatible protocol.
The node simply will login into the next reacheable Freifunk node as a normal client.

This Method is to ensure to get all nodes to a new incompatible protocol without loosing one, (and without having to make complex migration plans for meshing nodes).


## Tested with Gluon 2016.1.3
TP 841N v10 and v9  - TP710v1

## Side effect - Big Warning
We suggest to change the fastd port also, when upgrading, so newer nodes simply connect to a "newer" fastd port also. And you only do start fastd on the new port where batman is v15 is ready, this effectively makes it impossible to connect to old fastd/batv14 for new nodes/batv15.  
The same effect could be reached via changing the secret fastd keys on the servers that are updating to batman v15. The "new" Firmware then has to only include the new fastd keys.

If you only use one fastd connection you have to run 2 different servers, one for legacy and one for the new Firmware.

If you don't use fastd, ie. l2tp - you have to make good decisions also. While we don't know enough about the setups there - no advice here. 


