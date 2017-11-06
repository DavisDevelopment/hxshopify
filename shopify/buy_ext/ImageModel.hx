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

extern class ImageModel {
    public var created_at : String;
    public var updated_at : String;
    public var id : Int;
    public var width : Int;
    public var height : Int;
    public var position : Int;
    public var product_id : Int;
    public var src : String;
    public var variant_ids : Array<Int>;
    public var variants : Array<ImageVariantModel>;
}

extern class ImageVariantModel {
    public var name : String;
    public var dimension : String;
    public var src : String;
}
