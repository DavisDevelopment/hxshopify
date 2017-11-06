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

extern class ProductModel {
    public var title : String;
    public var description : String;
    public var id : String;
    public var images : Array<ImageModel>;
    public var options : Array<ProductOptionModel>;
    public var selections : Array<String>;
    public var selectedVariant : ProductVariantModel;
    public var variants : Array<ProductVariantModel>;
}
