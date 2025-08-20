/*!
 * jQuery UI Labels 1.12.1
 * http://jqueryui.com
 *
 * Copyright jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 */

(function(e){typeof define=="function"&&define.amd?define(["jquery","./version","./escape-selector"],e):e(jQuery)})(function(e){return e.fn.labels=function(){var t,n,r,i,s;return this[0].labels&&this[0].labels.length?this.pushStack(this[0].labels):(i=this.eq(0).parents("label"),r=this.attr("id"),r&&(t=this.eq(0).parents().last(),s=t.add(t.length?t.siblings():this.siblings()),n="label[for='"+e.ui.escapeSelector(r)+"']",i=i.add(s.find(n).addBack(n))),this.pushStack(i))}});