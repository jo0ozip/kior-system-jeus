/*!
 * jQuery UI Effects Slide 1.12.1
 * http://jqueryui.com
 *
 * Copyright jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 */

(function(e){typeof define=="function"&&define.amd?define(["jquery","../version","../effect"],e):e(jQuery)})(function(e){return e.effects.define("slide","show",function(t,n){var r,i,s=e(this),o={up:["bottom","top"],down:["top","bottom"],left:["right","left"],right:["left","right"]},u=t.mode,a=t.direction||"left",f=a==="up"||a==="down"?"top":"left",l=a==="up"||a==="left",c=t.distance||s[f==="top"?"outerHeight":"outerWidth"](!0),h={};e.effects.createPlaceholder(s),r=s.cssClip(),i=s.position()[f],h[f]=(l?-1:1)*c+i,h.clip=s.cssClip(),h.clip[o[a][1]]=h.clip[o[a][0]],u==="show"&&(s.cssClip(h.clip),s.css(f,h[f]),h.clip=r,h[f]=i),s.animate(h,{queue:!1,duration:t.duration,easing:t.easing,complete:n})})});