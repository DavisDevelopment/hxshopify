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

class MailingAddressModel extends Model {
    override function __pull():Void {
        fwds(
            'id',
            'address1',
            'address2',
            'city',
            'company',
            'country',
            'countryCode',
            'firstName',
            'formattedArea',
            'lastName',
            'latitude',
            'longitude',
            'name',
            'phone',
            'province',
            'provinceCode',
            'zip'
        );
    }

    public function toMailingAddressInput():Dynamic {
        return {
            address1: address1,
            address2: address2,
            city: city,
            company: company,
            country: country,
            firstName: firstName,
            lastName: lastName,
            phone: phone,
            province: province,
            zip: zip
        };
    }

    @:keep
    override function hxSerialize(s : Serializer):Void {
        super.hxSerialize( s );
        inline function w(x:Dynamic) s.serialize(x);

        w( id );
        w( address1 );
        w( address2 );
        w( city );
        w( company );
        w( country );
        w( countryCode );
        w( firstName );
        w( formattedArea );
        w( lastName );
        w( latitude );
        w( longitude );
        w( name );
        w( phone );
        w( province );
        w( provinceCode );
        w( zip );
    }

    @:keep
    override function hxUnserialize(u : Unserializer):Void {
        super.hxUnserialize( u );
        inline function v():Dynamic return u.unserialize();

        id = v();
        address1 = v();
        address2 = v();
        city = v();
        company = v();
        country = v();
        countryCode = v();
        firstName = v();
        formattedArea = v();
        lastName = v();
        latitude = v();
        longitude = v();
        name = v();
        phone = v();
        province = v();
        provinceCode = v();
        zip = v();
    }

/* === Instance Fields === */

    public var address1 : String;
    public var address2 : String;
    public var city : String;
    public var company : String;
    public var country : String;
    public var countryCode : String;
    public var firstName : String;
    public var formattedArea : String;
    public var lastName : String;
    public var latitude : Float;
    public var longitude : Float;
    public var name : String;
    public var phone : String;
    public var province : String;
    public var provinceCode : String;
    public var zip : String;

/* === Statics === */

    public static function create(o : Obj):MailingAddressModel {
        return new MailingAddressModel( o );
    }
    public static function dcreate(o : Dynamic):MailingAddressModel return create(Obj.fromDynamic( o ));
}
