/*!
 * jQuery UI Focusable 1.12.1
 * http://jqueryui.com
 *
 * Copyright jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 */

(function(e){typeof define=="function"&&define.amd?define(["jquery","./version"],e):e(jQuery)})(function(e){function t(e){var t=e.css("visibility");while(t==="inherit")e=e.parent(),t=e.css("visibility");return t!=="hidden"}return e.ui.focusable=function(n,r){var i,s,o,u,a,f=n.nodeName.toLowerCase();return"area"===f?(i=n.parentNode,s=i.name,!n.href||!s||i.nodeName.toLowerCase()!=="map"?!1:(o=e("img[usemap='#"+s+"']"),o.length>0&&o.is(":visible"))):(/^(input|select|textarea|button|object)$/.test(f)?(u=!n.disabled,u&&(a=e(n).closest("fieldset")[0],a&&(u=!a.disabled))):"a"===f?u=n.href||r:u=r,u&&e(n).is(":visible")&&t(e(n)))},e.extend(e.expr[":"],{focusable:function(t){return e.ui.focusable(t,e.attr(t,"tabindex")!=null)}}),e.ui.focusable});