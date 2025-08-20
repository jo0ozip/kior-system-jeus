/*!
 * jQuery UI Effects Explode 1.12.1
 * http://jqueryui.com
 *
 * Copyright jQuery Foundation and other contributors
 * Released under the MIT license.
 * http://jquery.org/license
 */

(function(e){typeof define=="function"&&define.amd?define(["jquery","../version","../effect"],e):e(jQuery)})(function(e){return e.effects.define("explode","hide",function(t,n){function y(){g.push(this),g.length===f*l&&b()}function b(){c.css({visibility:"visible"}),e(g).remove(),n()}var r,i,s,o,u,a,f=t.pieces?Math.round(Math.sqrt(t.pieces)):3,l=f,c=e(this),h=t.mode,p=h==="show",d=c.show().css("visibility","hidden").offset(),v=Math.ceil(c.outerWidth()/l),m=Math.ceil(c.outerHeight()/f),g=[];for(r=0;r<f;r++){o=d.top+r*m,a=r-(f-1)/2;for(i=0;i<l;i++)s=d.left+i*v,u=i-(l-1)/2,c.clone().appendTo("body").wrap("<div></div>").css({position:"absolute",visibility:"visible",left:-i*v,top:-r*m}).parent().addClass("ui-effects-explode").css({position:"absolute",overflow:"hidden",width:v,height:m,left:s+(p?u*v:0),top:o+(p?a*m:0),opacity:p?0:1}).animate({left:s+(p?0:u*v),top:o+(p?0:a*m),opacity:p?1:0},t.duration||500,t.easing,y)}})});