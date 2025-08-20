/*!
 * jQuery UI Tabbable 1.12.1
 * http://jqueryui.com
 *
 * Copyright jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 */

(function(e){typeof define=="function"&&define.amd?define(["jquery","./version","./focusable"],e):e(jQuery)})(function(e){return e.extend(e.expr[":"],{tabbable:function(t){var n=e.attr(t,"tabindex"),r=n!=null;return(!r||n>=0)&&e.ui.focusable(t,r)}})});