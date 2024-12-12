# -*- coding: utf-8 -*-
"""
You can start this script with a "instance run" like :
    bin/instance -O Plone run scripts/autopublish.py

"""
from plone import api
from zope.component import queryMultiAdapter
from zope.component.hooks import setSite
from zope.globalrequest import getRequest


import argparse
import logging
import sys
import transaction


logger = logging.getLogger('run_first_migration_step.py')
logger.setLevel(logging.INFO)
ch = logging.StreamHandler(sys.stdout)
ch.setLevel(logging.INFO)
formatter = logging.Formatter('%(asctime)s %(levelname)s %(name)s %(message)s',
                              '%Y-%m-%d %H:%M:%S')
ch.setFormatter(formatter)
logger.addHandler(ch)

parser = argparse.ArgumentParser(description='Run a script')
parser.add_argument('-c')  # use to bin/instance run script.py


def publish(app):
    portal = app["Plone"] # api.portal.get()
    setSite(portal)
    tool = api.portal.get_tool(name='portal_modifier')
    tool._delObject('RetainATRefs')
    tool._delObject('NotRetainATRefs')
    tool._delObject('SkipBlobs')
    tool._delObject('CloneBlobs')
    transaction.commit()
    logger.info("Migration done")

if __name__ == '__main__':
    args = parser.parse_args()
    publish(app)
