/*!
 * jQuery UI Effects Drop 1.12.1
 * http://jqueryui.com
 *
 * Copyright jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 */

(function(e){typeof define=="function"&&define.amd?define(["jquery","../version","../effect"],e):e(jQuery)})(function(e){return e.effects.define("drop","hide",function(t,n){var r,i=e(this),s=t.mode,o=s==="show",u=t.direction||"left",a=u==="up"||u==="down"?"top":"left",f=u==="up"||u==="left"?"-=":"+=",l=f==="+="?"-=":"+=",c={opacity:0};e.effects.createPlaceholder(i),r=t.distance||i[a==="top"?"outerHeight":"outerWidth"](!0)/2,c[a]=f+r,o&&(i.css(c),c[a]=l+r,c.opacity=1),i.animate(c,{queue:!1,duration:t.duration,easing:t.easing,complete:n})})});