gluon-v14tov15-helper
============

Script to help transition from batman v14 to batman v15 - especially for meshing nodes.

realy simple one, checks via cronjob every hours if     batctl gwl    know some Gateways,
if not doing some magic with new Interface and logging in as client in your defined freifunk and force imidiate autoupdate
(if not turned off)

## more detailed
you need to build a Firmware with gluon-v14tov15-helper to your site.mk
and roll it out with batman v14 still there

if **all nodes** got this tool , you can start to build v15 and roll this out.

**at this time some of your fastd-servers (gateway, supernodes) have to speak batv14 and some v15
by the time you can remove more and more the old v14 servers**

That means that a node far away in mesh network (behind some meshing nodes) or nodes which are offline often for one or another reason
will get a possibility to get their update even if everybody else in your Freifunk Comunity is speaking the newer Batman
The Node simply login in the next Frefiunk node as normal client.

This Method is to ensure to get all nodes to new batman-adv without loosing one. 

## Create a file "modules" , add the following content in your site directory:
```
GLUON_SITE_FEEDS="v14-to-v15-helper"<br>
PACKAGES_V14-TO-V15-HELPER_REPO=https://github.com/viisauksena/gluon-v14tov15-helper.git<br>
PACKAGES_V14-TO-V15-HELPER_COMMIT=b8410a4621ba8b61896802218f6c9a4ad6df5821<br>
PACKAGES_V14-TO-V15-HELPER_BRANCH=master<br>
```
or if you like the debugversion
```
GLUON_SITE_FEEDS="v14-to-v15-helper"<br>
PACKAGES_V14-TO-V15-HELPER_REPO=https://github.com/viisauksena/gluon-v14tov15-helper.git<br>
PACKAGES_V14-TO-V15-HELPER_COMMIT=40c7797c6bf69f0049cd53fe6ec5f3f1e2024576<br>
PACKAGES_V14-TO-V15-HELPER_BRANCH=debugmode<br>
```
## you can add the package gluon-v14tov15-helper to your site.mk

## tested with Gluon 2016.1 
TP 841N v10 and v9  - TP710v1


## this will NOT work with single-gateway-comunitys, fastD-limit=1, l2tp

## side effect
you will minimize v14servers - because nodes otherwise could accidently connect on all fastd connections to v14 - even when upgraded already to v15

TODO -> check fastd, after checking gateway? or make more fancy stuff in gateway background? (this solution minimize config trouble on gateway, simply v14 or v15)
