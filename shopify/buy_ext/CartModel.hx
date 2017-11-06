package shopify.buy_ext;

import tannus.ds.*;
import tannus.io.*;
import tannus.html.*;
import tannus.http.*;

import haxe.Json;
import haxe.extern.Rest;

import js.Promise;

using Slambda;
using tannus.ds.ArrayTools;
using StringTools;
using tannus.ds.StringUtils;

extern class CartModel {
    public function clearLineItems():Promise<CartModel>;
    public function createLineItemsFromVariants(items : Rest<{variant:ProductVariantModel, quantity:Int}>):Promise<CartModel>;
    public function removeLineItem(id : String):Promise<CartModel>;
    public function updateLineItem(id:String, quantity:Int):Promise<CartModel>;
    public function updateModel():Promise<CartModel>;

    public var checkoutUrl : String;
    public var id : String;
    public var lineItemCount : Int;
    public var lineItems:Array<CartLineItemModel>;
    public var subtotal:String;
}
