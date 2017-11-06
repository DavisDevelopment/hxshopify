package shopify.storefront;

import tannus.io.*;
import tannus.ds.*;
import tannus.async.*;

import graphql.ast.*;

import haxe.Serializer;
import haxe.Unserializer;

import Slambda.fn;

using Slambda;
using tannus.ds.ArrayTools;
using StringTools;
using tannus.ds.StringUtils;
using tannus.html.JSTools;

class CartModel extends Model {
/* === Instance Methods === */

    /**
      * bind [this] Model's fields
      */
    override function __pull():Void {
        fwds(
            'id', 'email', 'note',
            'paymentDue', 'ready', 'subtotalPrice',
            'totalPrice', 'totalTax', 'webUrl'
        );
        forward('customer', 'customer', CustomerModel.dcreate);
        forward('shippingAddress', 'shippingAddress', MailingAddressModel.dcreate);
        forward('lineItems', 'lineItemPage', function(o : Dynamic) {
            return PageOf.create(Obj.fromDynamic( o ), d -> CartLineItemModel.create( d ));
        });
        lineItems = lineItemPage.items.copy();
        function date(o : Dynamic):Null<Date> {
            if (o == null)
                return null;
            else
                return (untyped __js__('new Date'))( o );
        }
        forward('createdAt', 'createdAt', date);
        forward('completedAt', 'completedAt', date);
    }

    @:keep
    override function hxSerialize(s : Serializer):Void {
        super.hxSerialize( s );

        inline function w(x:Dynamic) s.serialize( x );

        w( id );
        w( email );
        w( note );
        w( paymentDue );
        w( ready );
        w( subtotalPrice );
        w( totalPrice );
        w( totalTax );
        w( webUrl );
        w( lineItemPage );
        w( completedAt );
        w( createdAt );
    }

    @:keep
    override function hxUnserialize(u : Unserializer):Void {
        super.hxUnserialize( u );
        inline function v():Dynamic return u.unserialize();

        id = v();
        email = v();
        note = v();
        paymentDue = v();
        ready = v();
        subtotalPrice = v();
        totalPrice = v();
        totalTax = v();
        webUrl = v();
        lineItemPage = v();
        completedAt = v();
        createdAt = v();
        if (lineItemPage != null) {
            lineItems = lineItemPage.items.copy();
        }
    }



/* === Instance Fields === */

    public var email : Null<String>;
    public var note : Null<String>;
    public var paymentDue : Null<String>;
    public var ready : Null<Bool>;
    public var subtotalPrice : Null<String>;
    public var totalPrice : Null<String>;
    public var totalTax : Null<String>;
    public var webUrl : Null<String>;
    public var lineItems : Array<CartLineItemModel>;
    public var lineItemPage : PageOf<CartLineItemModel>;
    public var completedAt : Null<Date>;
    public var createdAt : Null<Date>;
    public var customer : Null<CustomerModel>;
    public var shippingAddress : Null<MailingAddressModel>;

/* === Static Methods === */

    public static function create(o : Obj):CartModel {
        return new CartModel( o );
    }
}
