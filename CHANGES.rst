CHANGELOG
=========

6.0.9-9 (unreleased)
--------------------

- library.policy 2.0.6
  
  - BIBLI-81 : Improve installation (Faceted, Taxonomies)
    [boulch]


6.0.9-8 (2025-06-24)
--------------------

- library.policy 2.0.5

  - Remove obsolete `library.theme` completely
    All themes reside in https://github.com/IMIO/imio_library_themes/
    [laulaz]

  - Move viewlets registrations from obsolete `library.theme` to `library.policy`
    [laulaz]


6.0.9-7 (2025-06-23)
--------------------

- library.policy 2.0.4

  - Uninstall obsolete `library.theme` (it will later be removed)
    [boulch, laulaz]

  - Ensure unused `plone.patternslib` is not installed as it causes errors
    [boulch, laulaz]


6.0.9-6 (2025-06-18)
--------------------

- library.core 2.1.6

  - Fix collective.behavior.gallery.behaviors.folderish_gallery interface for patrimoine
    [boulch]


6.0.9-5 (2025-05-26)
--------------------

- library.policy 2.0.3

  - BIBLIBDC-125 : Set "banner" (instead of "preview") as default scale for collective.behavior.banner "banner_scale" [boulch]
    [boulch]

- Update to Plone 6.0.14
  [boulch]


6.0.9-4 (2025-02-04)
--------------------

- BIBLI-76 : Update plone.app.discussion from 4.0.2 to 4.1.2 (Fix recaptcha validation)
  [boulch]


6.0.9-3 (2025-01-14)
--------------------

- library.core 2.1.5

  - BIBLI-75 : Ignore displaying each items if not necessary to display it when rendering a "patrimoine" content
    [boulch]

- library.core 2.1.4

  - BIBLI-75 : Ignore displaying some items when rendering a "patrimoine" content
    [boulch]

- library.policy 2.0.2

  - Reinstall collective.behavior.gallery
    [boulch]

- library.core 2.1.3

  - Remove picture from comments. That don't work!
    [boulch]


6.0.9-2 (2024-12-17)
--------------------

- Update waitress 3.0.2
  [remdub]


6.0.9-1 (2024-12-16)
--------------------

- library.policy 2.0.1

  - BIBLI-73 : Let deprecated old library.theme. Need to be uninstall manually TTW.
    [boulch]

- Get released versions of library.policy and library.core for production
  [boulch]

- library.core 2.1.2

  - BIBLI-73 : Fix js for map
    [boulch, tlambert, laulaz]

- library.core 2.1.1

  - BIBLI-73 : Add monkeypatch to fix TTW resource calling
    [boulch]

- library.core 2.1.0

  - BIBLI-73 : Update to Plone6 (6.0.9)
    [boulch]

- library.policy 2.0.0

  - BIBLI-73 : Update to Plone6 (6.0.9)
    [boulch]

  - BIBLI-73 : Change default faceted view for "explorer" folders
    [boulch]

  - Migrate to Plone 6. Next steps!
    [boulch]

  - Migration to Plone6
    [boulch]

- Update to Plone 6.0.9
  [bsuttor]

- Update collective.plausible to 1.0a3
  [remdub]

- library.policy 1.1.17

  - WEB-4074 : Install collective.plausible
    [remdub]


5.2.3-10 (2023-12-15)
---------------------

- library.core 2.0.15

  - MBIBLIHAVA-3 : Fix "Impossible to add/save existing content tile" (view_template field : required must be False) issue : plone/plone.app.standardtiles#149
    [boulch]


5.2.3-9 (2023-11-21)
--------------------

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
