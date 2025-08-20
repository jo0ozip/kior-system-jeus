/*!
 * jQuery UI Form Reset Mixin 1.12.1
 * http://jqueryui.com
 *
 * Copyright jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 */

(function(e){typeof define=="function"&&define.amd?define(["jquery","./form","./version"],e):e(jQuery)})(function(e){return e.ui.formResetMixin={_formResetHandler:function(){var t=e(this);setTimeout(function(){var n=t.data("ui-form-reset-instances");e.each(n,function(){this.refresh()})})},_bindFormResetHandler:function(){this.form=this.element.form();if(!this.form.length)return;var e=this.form.data("ui-form-reset-instances")||[];e.length||this.form.on("reset.ui-form-reset",this._formResetHandler),e.push(this),this.form.data("ui-form-reset-instances",e)},_unbindFormResetHandler:function(){if(!this.form.length)return;var t=this.form.data("ui-form-reset-instances");t.splice(e.inArray(this,t),1),t.length?this.form.data("ui-form-reset-instances",t):this.form.removeData("ui-form-reset-instances").off("reset.ui-form-reset")}}});