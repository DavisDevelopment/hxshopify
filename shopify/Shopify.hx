package shopify;

import tannus.ds.*;
import tannus.io.*;
import tannus.html.*;
import tannus.http.*;

import haxe.Json;

import shopify.buy.*;
import shopify.buy_ext.Buy.ConfigAttrs;
import shopify.buy.Buy;

using Slambda;
using tannus.ds.ArrayTools;
using StringTools;
using tannus.ds.StringUtils;

class Shopify {
/* === Static Methods === */

    public static function buildClient(config : ConfigAttrs):Client {
        return Buy.buildClient( config );
    }

/* === Static Fields === */
}
