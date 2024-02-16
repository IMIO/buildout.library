CHANGELOG
=========

6.0.9-1 (unreleased)
---------------------

- Update to Plone 6.0.9
  [bsuttor]


5.2.3-10 (2023-12-15)
---------------------

- library.core 2.0.15

  - MBIBLIHAVA-3 : Fix "Impossible to add/save existing content tile" (view_template field : required must be False) issue : plone/plone.app.standardtiles#149
    [boulch]


5.2.3-9 (2023-11-21)
--------------------

- Update Plone from 5.2.12 to 5.2.14
  [boulch]

- BIBLI-67 : collective.z3cform.select2 3.0.0b9

  - Fix "current filters" removing when used with multi-select2
    [laulaz]


5.2.3-8 (2023-10-24)
--------------------

- BIBLI-63 : collective.z3cform.select2 3.0.0b8

  - Fix duplicate taxonomy select2 fields
    [laulaz]

- BIBLI-67 : collective.z3cform.select2 3.0.0b7

  - Fix selected URL values display in faceted select2 widget
    [laulaz]

  - Fix "current filters" faceted widget when used with multi-select2
    [laulaz]


5.2.3-7 (2023-09-05)
--------------------

- library.theme 1.1.8

  - BIBLI-65 : Add css to add arrow on select2 widgets
    [boulch]

- BIBLI-63 : Downgrade collective.z3cform.select2 to 3.0.0b4 to fix double displaying of taxonomy fields
  [boulch]


5.2.3-6 (2023-08-24)
--------------------

- library.policy 1.1.16

  - clear configure_faceted (in upgrades.py). Manually done on each instance due to missing taxonomies
    [boulch]

- library.policy 1.1.15

  - MBIBLIWLHA-6 : Change value of Plone.thumb_scale_listing to display bigger picture in library folders views
    [boulch]


5.2.3-5 (2023-07-12)
--------------------

- library.theme 1.1.7

  - Add css to correctly display new select2 widgets in faceted view "explorer"
    [boulch, tlambert]

- library.policy 1.1.14

  - Create upgrade step to reimport faceted "explorer" config (Fix select2 widgets)
    [boulch]


5.2.3-4 (2023-06-14)
--------------------

- Update Plone from 5.2.8 to 5.2.12
  [boulch]

- Update Plone from 5.2.5 to 5.2.8
  [boulch]

- library.policy 1.1.13

  - Add collective.big.bang dependency
    [boulch]


5.2.3-3-quick (2021-10-29)
--------------------------

- Fix rundeck links.
  [bsuttor]

5.2.3-2 (2021-10-27)
--------------------

- Remove useless (since Plone 5.2.2) Products.PloneHotfix20200121 = 1.1
  Removing this Hotfix with Plone 5.2.5 fix a char encoging in navigation menu.
  [boulch]


5.2.3-1 (2021-09-16)
--------------------

- library.core 2.0.14

  - Add an honeypot field to comment form 
    [boulch]

- iaweb.mosaic 1.1.0

  - MWEBIMI-25: Hide slides after the first one to improve page loading
    [mpeeters]

- library.policy 1.1.12

  - Add iaweb.mosaic as a requirement (to add slider in bibliotheca). 
    [boulch]

- Initial release
