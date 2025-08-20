/*!
 * jQuery UI Effects Scale 1.12.1
 * http://jqueryui.com
 *
 * Copyright jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 */

(function(e){typeof define=="function"&&define.amd?define(["jquery","../version","../effect","./effect-size"],e):e(jQuery)})(function(e){return e.effects.define("scale",function(t,n){var r=e(this),i=t.mode,s=parseInt(t.percent,10)||(parseInt(t.percent,10)===0?0:i!=="effect"?0:100),o=e.extend(!0,{from:e.effects.scaledDimensions(r),to:e.effects.scaledDimensions(r,s,t.direction||"both"),origin:t.origin||["middle","center"]},t);t.fade&&(o.from.opacity=1,o.to.opacity=0),e.effects.effect.size.call(this,o,n)})});