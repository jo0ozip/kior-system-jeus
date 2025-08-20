/*!
 * jQuery UI Effects Fade 1.12.1
 * http://jqueryui.com
 *
 * Copyright jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 */

(function(e){typeof define=="function"&&define.amd?define(["jquery","../version","../effect"],e):e(jQuery)})(function(e){return e.effects.define("fade","toggle",function(t,n){var r=t.mode==="show";e(this).css("opacity",r?0:1).animate({opacity:r?1:0},{queue:!1,duration:t.duration,easing:t.easing,complete:n})})});