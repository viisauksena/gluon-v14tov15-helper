gluon-v14tov15-helper
============

Script to help transition from batman v14 to batman v15 - especially for meshing nodes.

realy simple one, checks via cronjob every 6 hours if     batctl gwl    know some Gateways,
if not doing some magic with new Interface and logging in as client in your defined freifunk and force imidiate autoupdate
(if not turned off)

That means that a node far away in mesh network (behind some meshing nodes) or nodes which are offline often for one or another reason
will get a possibility to get their update even if everybody else in your Freifunk Comunity is speaking the newer Batman

You will have some v14 and some v15 speaking gateways for some days.
This will work as long, as there is a v14 speaking Gateway in your network. 

This Method is to ensure to get all nodes to new batman-adv without loosing one. 

Create a file "modules" , add the following content in your site directory:

GLUON_SITE_FEEDS="v14-to-v15-helper"<br>
PACKAGES_V14-TO-V15-HELPER_REPO=https://github.com/viisauksena/gluon-v14tov15-helper.git<br>
PACKAGES_V14-TO-V15-HELPER_COMMIT=1237fac742e2659bbd76d3e88833ec30805501d2<br>

With this done you can add the package gluon-v14tov15-helper to your site.mk

This skript is tested with Gluon 2016.1
