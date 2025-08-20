/*!
 * jQuery UI Effects Clip 1.12.1
 * http://jqueryui.com
 *
 * Copyright jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 */

(function(e){typeof define=="function"&&define.amd?define(["jquery","../version","../effect"],e):e(jQuery)})(function(e){return e.effects.define("clip","hide",function(t,n){var r,i={},s=e(this),o=t.direction||"vertical",u=o==="both",a=u||o==="horizontal",f=u||o==="vertical";r=s.cssClip(),i.clip={top:f?(r.bottom-r.top)/2:r.top,right:a?(r.right-r.left)/2:r.right,bottom:f?(r.bottom-r.top)/2:r.bottom,left:a?(r.right-r.left)/2:r.left},e.effects.createPlaceholder(s),t.mode==="show"&&(s.cssClip(i.clip),i.clip=r),s.animate(i,{queue:!1,duration:t.duration,easing:t.easing,complete:n})})});