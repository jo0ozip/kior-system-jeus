/*!
 * jQuery UI Effects Bounce 1.12.1
 * http://jqueryui.com
 *
 * Copyright jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 */

(function(e){typeof define=="function"&&define.amd?define(["jquery","../version","../effect"],e):e(jQuery)})(function(e){return e.effects.define("bounce",function(t,n){var r,i,s,o=e(this),u=t.mode,a=u==="hide",f=u==="show",l=t.direction||"up",c=t.distance,h=t.times||5,p=h*2+(f||a?1:0),d=t.duration/p,v=t.easing,m=l==="up"||l==="down"?"top":"left",g=l==="up"||l==="left",y=0,b=o.queue().length;e.effects.createPlaceholder(o),s=o.css(m),c||(c=o[m==="top"?"outerHeight":"outerWidth"]()/3),f&&(i={opacity:1},i[m]=s,o.css("opacity",0).css(m,g?-c*2:c*2).animate(i,d,v)),a&&(c/=Math.pow(2,h-1)),i={},i[m]=s;for(;y<h;y++)r={},r[m]=(g?"-=":"+=")+c,o.animate(r,d,v).animate(i,d,v),c=a?c*2:c/2;a&&(r={opacity:0},r[m]=(g?"-=":"+=")+c,o.animate(r,d,v)),o.queue(n),e.effects.unshift(o,b,p+1)})});