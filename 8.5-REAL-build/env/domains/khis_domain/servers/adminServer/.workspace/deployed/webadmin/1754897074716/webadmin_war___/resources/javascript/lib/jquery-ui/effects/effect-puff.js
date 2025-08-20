/*!
 * jQuery UI Effects Puff 1.12.1
 * http://jqueryui.com
 *
 * Copyright jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 */

(function(e){typeof define=="function"&&define.amd?define(["jquery","../version","../effect","./effect-scale"],e):e(jQuery)})(function(e){return e.effects.define("puff","hide",function(t,n){var r=e.extend(!0,{},t,{fade:!0,percent:parseInt(t.percent,10)||150});e.effects.effect.scale.call(this,r,n)})});