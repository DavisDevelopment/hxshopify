package shopify.buy_ext;

import tannus.ds.*;
import tannus.io.*;
import tannus.html.*;
import tannus.http.*;

import haxe.Json;

using Slambda;
using tannus.ds.ArrayTools;
using StringTools;
using tannus.ds.StringUtils;

extern class CartLineItemModel {
    public var id : String;
    public var compareAtPrice: String;
    public var grams : Float;
    public var image : Dynamic;
    public var imageVariant : Array<Dynamic>;
    public var line_price : String;
    public var price : String;
    public var product_id : String;
    public var quantity : Int;
    public var title : String;
    public var variant_id : String;
    public var variant_title : String;
}
