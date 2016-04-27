gluon-v14tov15-helper
============

Script to help transition from batman v14 to batman v15 - especially for meshing nodes.

realy simple one, checks via cronjob every hours if     batctl gwl    know some Gateways,
if not doing some magic with new Interface and logging in as client in your defined freifunk and force imidiate autoupdate
(if not turned off)

## migration helper
while this script also helps in other cases, where uplink node becomes incompatible - some call it migrationhelper.

## warning
There is one scenario where it cant help at all, this is also the case in general without this package.
Imagine a 2 nodes, one uplink - one meshing. The uplink node has autoupdater disabled (or for whatever reason wont update) .. so it runs legacy Firmware. The Meshing node get a update, doesnt matter if with this script or the normal way. The meshing node with actual fw is compatible with your freifunk-net but maybe no longer with his specific legacy node, which ends in loosing Internet/Freifunk connectivity at all for meshing node. This should only be a rare case.

## more detailed
you need to build a Firmware with gluon-v14tov15-helper added to your site.mk
and roll it out with batman v14 still there

if **all nodes** got this tool , you can start to build v15 and roll this out.

**at this time some of your fastd-servers (gateway, supernodes) have to speak batv14 and some v15
by the time you can remove more and more the old v14 servers**

That means that a node far away in mesh network (behind some meshing nodes) or nodes which are offline often for one or another reason
will get a possibility to get their update even if everybody else in your Freifunk Comunity is speaking the newer Batman
The Node simply login in the next Freifunk node as normal client.

This Method is to ensure to get all nodes to new batman-adv without loosing one, and without making complex migration plans for meshing nodes.

## Create a file "modules" , add the following content in your site directory:
```
GLUON_SITE_FEEDS="v14-to-v15-helper"
PACKAGES_V14-TO-V15-HELPER_REPO=https://github.com/viisauksena/gluon-v14tov15-helper.git
PACKAGES_V14-TO-V15-HELPER_COMMIT=ac405720a7ab5f....actual.comit....
PACKAGES_V14-TO-V15-HELPER_BRANCH=master
```
## you can add the package gluon-v14tov15-helper to your site.mk

## tested with Gluon 2016.1.3
TP 841N v10 and v9  - TP710v1

## side effect - Big Warning
We suggest to change fastd ports when upgrading : so newer nodes simply connect to "newer" fastd ports. And you only do start fastd on new ports where batman is v15 is ready, this effectivly make it impossible to connect to old fastd/batv14 for new nodes/batv15.
The same effect could be reached via changing secret fastd keys .. when updating to v15 on specific servers - while the "new" Firmware only have new keys ...

If you only use one fastd connection you have to run 2 different servers, one for legacy and one for new Firmware.

if you dont use fastd , ie. l2tp - you have to make good decissions also. While i dont know enough about the setups there - no advice here. 


