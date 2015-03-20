/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

"use strict";

// Include required modules
var addons = require("../../../../lib/addons");
var endurance = require("../../../../lib/endurance");
var tabs = require("../../../lib/tabs");

const BASE_URL = collector.addHttpResource("../../../../data/");
const TEST_DATA = BASE_URL + "pages/test_swf_iframes_nosound.htm";

const TIMEOUT_PAGE = 50000;

function setupModule(aModule) {
  aModule.controller = mozmill.getBrowserController();

  aModule.enduranceManager = new endurance.EnduranceManager(aModule.controller);
  aModule.tabBrowser = new tabs.tabBrowser(aModule.controller);

  aModule.tabBrowser.closeAllTabs();

  // Skip test if we don't have Flash plugin enabled
  var isFlashActive = addons.getInstalledAddons(function (aAddon) {
    if (aAddon.isActive && aAddon.type === "plugin" && aAddon.name === "Shockwave Flash")
      return true;
  });

  if (!isFlashActive[0]) {
    testFlashIframe.__force_skip__ = "No enabled Flash plugin detected";
    teardownModule.__force_skip__ = "No enabled Flash plugin detected";
  }
}

function teardownModule(aModule) {
  aModule.tabBrowser.closeAllTabs();
}

/*
 * Test opening flash content loaded in an iframe
 */
function testFlashIframe() {
  enduranceManager.run(function () {
    enduranceManager.loop(function () {
      // If entity > 1 then open a new tab
      if (enduranceManager.currentEntity > 1) {
        tabBrowser.openTab();
      }

      // Load the test page in the currently opened tab
      enduranceManager.addCheckpoint("Load a web page with flash content in an iframe");
      controller.open(TEST_DATA);
      controller.waitForPageLoad(TIMEOUT_PAGE);
      enduranceManager.addCheckpoint("Web page has been loaded");
    });

    tabBrowser.closeAllTabs();
  });
}
