/*!
 * jQuery UI Effects Highlight 1.12.1
 * http://jqueryui.com
 *
 * Copyright jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 */

(function(e){typeof define=="function"&&define.amd?define(["jquery","../version","../effect"],e):e(jQuery)})(function(e){return e.effects.define("highlight","show",function(t,n){var r=e(this),i={backgroundColor:r.css("backgroundColor")};t.mode==="hide"&&(i.opacity=0),e.effects.saveStyle(r),r.css({backgroundImage:"none",backgroundColor:t.color||"#ffff99"}).animate(i,{queue:!1,duration:t.duration,easing:t.easing,complete:n})})});