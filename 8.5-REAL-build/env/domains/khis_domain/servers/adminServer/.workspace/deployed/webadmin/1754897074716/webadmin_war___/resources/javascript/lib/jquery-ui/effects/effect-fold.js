/*!
 * jQuery UI Effects Fold 1.12.1
 * http://jqueryui.com
 *
 * Copyright jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 */

(function(e){typeof define=="function"&&define.amd?define(["jquery","../version","../effect"],e):e(jQuery)})(function(e){return e.effects.define("fold","hide",function(t,n){var r=e(this),i=t.mode,s=i==="show",o=i==="hide",u=t.size||15,a=/([0-9]+)%/.exec(u),f=!!t.horizFirst,l=f?["right","bottom"]:["bottom","right"],c=t.duration/2,h=e.effects.createPlaceholder(r),p=r.cssClip(),d={clip:e.extend({},p)},v={clip:e.extend({},p)},m=[p[l[0]],p[l[1]]],g=r.queue().length;a&&(u=parseInt(a[1],10)/100*m[o?0:1]),d.clip[l[0]]=u,v.clip[l[0]]=u,v.clip[l[1]]=0,s&&(r.cssClip(v.clip),h&&h.css(e.effects.clipToBox(v)),v.clip=p),r.queue(function(n){h&&h.animate(e.effects.clipToBox(d),c,t.easing).animate(e.effects.clipToBox(v),c,t.easing),n()}).animate(d,c,t.easing).animate(v,c,t.easing).queue(n),e.effects.unshift(r,g,4)})});