/*!
 * jQuery UI Effects Shake 1.12.1
 * http://jqueryui.com
 *
 * Copyright jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 */

(function(e){typeof define=="function"&&define.amd?define(["jquery","../version","../effect"],e):e(jQuery)})(function(e){return e.effects.define("shake",function(t,n){var r=1,i=e(this),s=t.direction||"left",o=t.distance||20,u=t.times||3,a=u*2+1,f=Math.round(t.duration/a),l=s==="up"||s==="down"?"top":"left",c=s==="up"||s==="left",h={},p={},d={},v=i.queue().length;e.effects.createPlaceholder(i),h[l]=(c?"-=":"+=")+o,p[l]=(c?"+=":"-=")+o*2,d[l]=(c?"-=":"+=")+o*2,i.animate(h,f,t.easing);for(;r<u;r++)i.animate(p,f,t.easing).animate(d,f,t.easing);i.animate(p,f,t.easing).animate(h,f/2,t.easing).queue(n),e.effects.unshift(i,v,a+1)})});