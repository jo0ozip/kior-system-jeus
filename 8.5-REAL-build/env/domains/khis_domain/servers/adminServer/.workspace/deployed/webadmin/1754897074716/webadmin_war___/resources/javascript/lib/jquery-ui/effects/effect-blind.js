/*!
 * jQuery UI Effects Blind 1.12.1
 * http://jqueryui.com
 *
 * Copyright jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 */

(function(e){typeof define=="function"&&define.amd?define(["jquery","../version","../effect"],e):e(jQuery)})(function(e){return e.effects.define("blind","hide",function(t,n){var r={up:["bottom","top"],vertical:["bottom","top"],down:["top","bottom"],left:["right","left"],horizontal:["right","left"],right:["left","right"]},i=e(this),s=t.direction||"up",o=i.cssClip(),u={clip:e.extend({},o)},a=e.effects.createPlaceholder(i);u.clip[r[s][0]]=u.clip[r[s][1]],t.mode==="show"&&(i.cssClip(u.clip),a&&a.css(e.effects.clipToBox(u)),u.clip=o),a&&a.animate(e.effects.clipToBox(u),t.duration,t.easing),i.animate(u,{queue:!1,duration:t.duration,easing:t.easing,complete:n})})});