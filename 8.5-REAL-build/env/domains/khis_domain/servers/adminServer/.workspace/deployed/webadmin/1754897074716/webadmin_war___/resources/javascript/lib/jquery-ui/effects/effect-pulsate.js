/*!
 * jQuery UI Effects Pulsate 1.12.1
 * http://jqueryui.com
 *
 * Copyright jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 */

(function(e){typeof define=="function"&&define.amd?define(["jquery","../version","../effect"],e):e(jQuery)})(function(e){return e.effects.define("pulsate","show",function(t,n){var r=e(this),i=t.mode,s=i==="show",o=i==="hide",u=s||o,a=(t.times||5)*2+(u?1:0),f=t.duration/a,l=0,c=1,h=r.queue().length;if(s||!r.is(":visible"))r.css("opacity",0).show(),l=1;for(;c<a;c++)r.animate({opacity:l},f,t.easing),l=1-l;r.animate({opacity:l},f,t.easing),r.queue(n),e.effects.unshift(r,h,a+1)})});