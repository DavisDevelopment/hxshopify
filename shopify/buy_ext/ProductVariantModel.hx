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

extern class ProductVariantModel {
    public function checkoutUrl(?quantity:Int):String;

    public var available : Bool;
    public var compareAtPrice : String;
    public var formattedPrice : String;
    public var grams : Float;
    public var id : String;
    public var image : Dynamic;
    public var optionValues : Array<OptionValue>;
    public var price : String;
    public var productId : String;
    public var productTitle : String;
    public var title : String;
}

typedef OptionValue = {
    name: String,
    option_id: Int,
    value: String
};
