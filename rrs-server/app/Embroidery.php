<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Embroidery extends Model
{
    //
    protected $fillable = [
        'artpack_num','rep_name','turn_time','account_name','account_num','customer_name','reference_tapes','package_type','style_preference','course_location','csr_name','manipulate_logo','num_designs','description','threads'
    ];
}
