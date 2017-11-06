package shopify.storefront;

import tannus.io.*;
import tannus.ds.*;
import tannus.async.*;

import graphql.ast.*;

import shopify.ShopifyGlobals._ as us;
import Slambda.fn;

import haxe.Serializer;
import haxe.Unserializer;

using Slambda;
using tannus.ds.ArrayTools;
using StringTools;
using tannus.ds.StringUtils;
using tannus.html.JSTools;

class CustomerModel extends Model {
    /* Constructor Function */
    public function new(o:Obj, ?token:CustomerAccessTokenModel):Void {
        super( o );
        accessToken = token;
    }

/* === Instance Methods === */

    override function __pull():Void {
        fwds(
            'id',
            'acceptsMarketing',
            'displayName',
            'email',
            'firstName',
            'lastName',
            'phone',
            {property:'updatedAt', transform: _date},
            {property:'createdAt', transform: _date}
        );
        forward('defaultAddress', 'defaultAddress', MailingAddressModel.dcreate);
    }

    @:keep
    override function hxSerialize(s : Serializer):Void {
        inline function w(x:Dynamic) s.serialize( x );

        w( id );
        w( accessToken );
        w( acceptsMarketing );
        w( defaultAddress );
        w( displayName );
        w( email );
        w( firstName );
        w( lastName );
        w( phone );
        w( updatedAt );
        w( createdAt );
    }

    @:keep
    override function hxUnserialize(u : Unserializer):Void {
        super.hxUnserialize( u );
        inline function v():Dynamic return u.unserialize();

        id = v();
        accessToken = v();
        acceptsMarketing = v();
        defaultAddress = v();
        displayName = v();
        email = v();
        firstName = v();
        lastName = v();
        phone = v();
        updatedAt = v();
        createdAt = v();
    }

/* === Instance Fields === */

    public var accessToken : Null<CustomerAccessTokenModel>;
    public var acceptsMarketing : Null<Bool>;
    public var defaultAddress : Null<MailingAddressModel>;
    public var displayName : Null<String>;
    public var email : Null<String>;
    public var firstName : Null<String>;
    public var lastName : Null<String>;
    public var phone : Null<String>;
    public var updatedAt : Null<Date>;
    public var createdAt : Null<Date>;

/* === Statics === */

    public static function create(o:Obj, ?token:CustomerAccessTokenModel):CustomerModel {
        return new CustomerModel(o, token);
    }
    public static function dcreate(o:Dynamic, ?token:CustomerAccessTokenModel):CustomerModel {
        return new CustomerModel(Obj.fromDynamic(o), token);
    }
}
