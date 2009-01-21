/**
 * Add site-wide settings such as BLANK_IMAGE_URL
 */

Ext.BLANK_IMAGE_URL = 'images/default/s.gif';

Ext.onReady(function() {
  Ext.QuickTips.init();
  
  MyApp.OS.launch();
});