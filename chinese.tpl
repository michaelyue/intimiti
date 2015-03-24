<?php echo $header; ?>
<link href="catalog/view/javascript/magiczoom/magiczoomplus.css" rel="stylesheet" media="screen"/>
<script src="catalog/view/javascript/magiczoom/mzp-packed.js" type="text/javascript"></script>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-10'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <div class="row">
                <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
                <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-5'; ?>
                <?php } else { ?>
                <?php $class = 'col-sm-8'; ?>
                <?php } ?>
                <div class="<?php echo $class; ?>">
                    <?php if ($thumb || $images) { ?>
                    <ul class="thumbnails">
                        <?php if ($thumb) { ?>
                        <li><a class="thumbnail main_thumb_show MagicZoom MagicThumb" title="<?php echo $heading_title; ?>"><img
                                        src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>"
                                        alt="<?php echo $heading_title; ?>"/></a></li>

                        <li class="image-additional"><a class="thumbnail" href="javascript:;"
                                                        title="<?php echo $heading_title; ?>" >
                                <img class="img-responsive" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>"
                                     alt="<?php echo $heading_title; ?>"/>
                                <input class="thumbnail_value" type="hidden" value="<?php echo $thumb; ?>" ></a></li>

                        <?php } ?>
                        <?php if ($images) { ?>
                        <?php foreach ($images as $image) { ?>

                        <li class="image-additional"><a class="thumbnail" href="javascript:;"
                                                        title="<?php echo $heading_title; ?>" >
                                <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>"
                                        alt="<?php echo $heading_title; ?>"/>
                                <input class="thumbnail_value" type="hidden" value="<?php echo $image['popup']; ?>" ></a></li>


<!--

                        <li class="image-additional"><a class="thumbnail" href="<?php echo $image['popup']; ?>"
                                                        title="<?php echo $heading_title; ?>"> <img
                                        src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>"
                                        alt="<?php echo $heading_title; ?>"/></a></li>-->
                        <?php } ?>
                        <?php } ?>
                    </ul>
                    <?php } ?>
                </div>
                <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
                <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-7'; ?>
                <?php } else { ?>
                <?php $class = 'col-sm-4'; ?>
                <?php } ?>
                <div class="<?php echo $class; ?>">
                    <h3><?php echo $heading_title; ?></h3>
                    <ul class="list-unstyled">
                        <?php if ($reward) { ?>
                        <li><?php echo $text_reward; ?> <?php echo $reward; ?></li>
                        <?php } ?>
                    </ul>
                    <div id="product">
                        <?php if ($options) { ?>
                        <?php foreach ($options as $option) { ?>
                        <?php if ($option['type'] == 'radio') { ?>
                        <?php if ($option['option_id'] != 15) { ?>
                        <div class="form-group ">
                            <div id="input-option<?php echo $option['product_option_id']; ?>">
                                <li style="list-style:none" class="padd">
                                    <div class="catt"><label class="catb"><?php echo $option['name']; ?>：</label>
                                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                        <a class=""  onclick="changeAtt(this)" href="javascript:;">
                                            <?php echo $option_value['name']; ?>
                                            <input style="display:none"
                                                   type="radio"
                                                   name="option[<?php echo $option['product_option_id']; ?>]"
                                                   value="<?php echo $option_value['product_option_value_id']; ?>"/></a>
                                        <?php }?>
                                    </div>
                                </li>
                            </div>
                            <?php } ?>
                            <?php } ?>

                            <?php if ($option['type'] == 'image') { ?>
                            <div class="form-group">
                                <div id="input-option<?php echo $option['product_option_id']; ?>">
                                    <li style="list-style:none" class="padd">
                                        <div class="catt"><label class="catb"><?php echo $option['name']; ?>：</label>
                                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                            <a class="" style="padding-left:0px;padding-right:0px;" onclick="changeAtt(this)" href="javascript:;"
                                               title="<?php echo $option_value['name']; ?>">
                                                <img height="40px" width="40px" src="<?php echo $option_value['image']; ?>"><img/>
                                                <input
                                                        id="option[<?php echo $option['product_option_id']; ?>]"
                                                        style="display:none"
                                                        type="radio"
                                                        name="option[<?php echo $option['product_option_id']; ?>]"
                                                        value="<?php echo $option_value['product_option_value_id']; ?>"/></a>
                                            <?php }?>
                                        </div>
                                    </li>
                                </div>
                            </div>
                            <?php } ?>
                            <?php } ?>
                            <?php } ?>

                                    <div class="form-group purchase-choice">
                                        <?php foreach ($options as $option) { ?>
                                        <?php if ($option['type'] == 'radio') { ?>
                                        <?php if ($option['option_id'] == 15) { ?>


                                        <div id="input-option<?php echo $option['product_option_id']; ?>">
                                            <li style="list-style:none" class="padd">
                                                <div class="catt">

                                                <label class="catb">购买：</label>

                                                    <table class="table table-striped table-bordered">
                                                        <thead>
                                                        <tr>
                                                            <td align="center"> <?echo $text_subscription; ?> </td>
                                                            <td align="center"> <?echo $text_single; ?> </td>
                                                        <tr></thead>

                                                            <tbody>
                                                            <?php $row_year_buy = array();?>
                                                            <?php $exp_buy = array();?>
                                                            <?php foreach ($option['product_option_value'] as $option_value) { ?>

                                                            <?php $option_name = $option_value['name']; ?>
                                                            <?php if ($option_value['price']) { ?>
                                                            <?php $price_ori = str_replace($text_price_symbol,"",$price); $price_ori = str_replace(",","",$price_ori); $price_change = str_replace($text_price_symbol,"",$option_value['price']); $price_change = str_replace(",","",$price_change); ?>
                                                            <?php if ($option_value['price_prefix'] == "+") { ?>
                                                            <?php $price_new = $price_ori + $price_change; $price_new = number_format($price_new,2,".",""); $option_name = $option_name.$text_price_symbol.$price_new; ?>
                                                            <?php } else { ?>
                                                            <?php $price_new = $price_ori - $price_change; $price_new = number_format($price_new,2,".","");  $option_name = $option_name.$text_price_symbol.$price_new; ?>
                                                            <?php } ?>
                                                            <?php } else { ?>
                                                            <?php $option_name = $option_name . $price; ?>
                                                            <?php } ?>

                                                            <?php if ($option_value['option_value_id'] > 54){ ?>
                                                            <?php if ( $option_value['option_value_id'] > 54 &&
                                                            $option_value['option_value_id'] < 69) { ?>
                                                            <?php $exp_buy[] = array( 'name' => $option_name , 'id' =>
                                                            $option['product_option_id'], 'value' =>
                                                            $option_value['product_option_value_id'] ); ?>
                                                            <?php } elseif ($option_value['option_value_id'] > 68) { ?>
                                                            <?php $row_year_buy[] = array('name' => $option_name , 'id'
                                                            => $option['product_option_id'], 'value' =>
                                                            $option_value['product_option_value_id'] ); ?>
                                                            <?php } ?>
                                                            <?php } ?>
                                                            <?php } ?>
                                                        <tr>

                                                            <td width="200px">
                                                                <?php foreach ($row_year_buy as $row_value) { ?>
                                                                <label>
                                                                    <input type="radio"
                                                                           name="option[<?php echo $row_value['id']; ?>]"
                                                                           value="<?php echo $row_value['value']; ?>"/>
                                                                    <?php  echo $row_value['name']; ?>
                                                                </label><br/>
                                                                <?php } ?>
                                                            </td>

                                                            <td width="200px">
                                                                <br/>
                                                                <br/>
                                                                <br/>
                                                                <label>
                                                                    <input type="radio"
                                                                           name="option[<?php echo $exp_buy[0]['id']; ?>]"
                                                                           value="<?php echo $exp_buy[0]['value']; ?>"/>
                                                                    <?php  echo $exp_buy[0]['name']; ?>
                                                                </label>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                       </div>
                                          </li>
                                        </div>
                                        <input type="hidden" name="quantity" value="1"/>
                                        <input type="hidden" name="product_id" value="<?php echo $product_id; ?>"/>
                                        <br/>

                                        <button type="button" id="button-buy-rightnow"
                                                data-loading-text="<?php echo $text_loading; ?>"
                                                class="btn btn-success btn-lg"><?php echo $button_buy_rightnow; ?></button>

                                        <span style="margin-left: 20px;"></span>

                                        <button type="button" id="button-cart"
                                                data-loading-text="<?php echo $text_loading; ?>"
                                                class="btn btn-primary btn-lg "><?php echo $button_cart; ?></button>


                                        <?php if ($minimum > 1) { ?>
                                        <div class="alert alert-info"><i
                                                    class="fa fa-info-circle"></i> <?php echo $text_minimum; ?>
                                        </div>
                                        <?php } ?>

                                    </div>
                                    <?php } ?>
                                    <?php } ?>
                                    <?php } ?>

                                </div>
                        </div>


                    <?php if ($review_status) { ?>
                    <span><br/></span>

                    <div class="rating">
                        <p>
                            <?php for ($i = 1; $i <= 5; $i++) { ?>
                            <?php if ($rating < $i) { ?>
                            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                            <?php } else { ?>
                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i
                                            class="fa fa-star-o fa-stack-1x"></i></span>
                            <?php } ?>
                            <?php } ?>
                            <a href=""
                               onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a>
                            / <a href=""
                                 onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a>
                        </p>

                    </div>
                    <?php } ?>
                </div>
                </div>

            <div class="row">
                <div class="col-xs-12">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-description"
                                              data-toggle="tab"><?php echo $tab_description; ?></a></li>
                        <?php if ($attribute_groups) { ?>
                        <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
                        <?php } ?>
                        <?php if ($review_status) { ?>
                        <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
                        <?php } ?>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
                        <?php if ($attribute_groups) { ?>
                        <div class="tab-pane" id="tab-specification">
                            <table class="table table-bordered">
                                <?php foreach ($attribute_groups as $attribute_group) { ?>
                                <thead>
                                <tr>
                                    <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                <tr>
                                    <td><?php echo $attribute['name']; ?></td>
                                    <td><?php echo $attribute['text']; ?></td>
                                </tr>
                                <?php } ?>
                                </tbody>
                                <?php } ?>
                            </table>
                        </div>
                        <?php } ?>
                        <?php if ($review_status) { ?>
                        <div class="tab-pane" id="tab-review">
                            <form class="form-horizontal">
                                <div id="review"></div>
                                <h2><?php echo $text_write; ?></h2>
                                <?php if ($review_guest) { ?>
                                <div class="form-group required">
                                    <div class="col-sm-12">
                                        <label class="control-label"
                                               for="input-name"><?php echo $entry_name; ?></label>
                                        <input type="text" name="name" value="" id="input-name"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group required">
                                    <div class="col-sm-12">
                                        <label class="control-label"
                                               for="input-review"><?php echo $entry_review; ?></label>
                                            <textarea name="text" rows="5" id="input-review"
                                                      class="form-control"></textarea>

                                        <div class="help-block"><?php echo $text_note; ?></div>
                                    </div>
                                </div>
                                <div class="form-group required">
                                    <div class="col-sm-12">
                                        <label class="control-label"><?php echo $entry_rating; ?></label>
                                        &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                                        <input type="radio" name="rating" value="1"/>
                                        &nbsp;
                                        <input type="radio" name="rating" value="2"/>
                                        &nbsp;
                                        <input type="radio" name="rating" value="3"/>
                                        &nbsp;
                                        <input type="radio" name="rating" value="4"/>
                                        &nbsp;
                                        <input type="radio" name="rating" value="5"/>
                                        &nbsp;<?php echo $entry_good; ?></div>
                                </div>
                                <div class="form-group required">
                                    <div class="col-sm-12">
                                        <label class="control-label"
                                               for="input-captcha"><?php echo $entry_captcha; ?></label>
                                        <input type="text" name="captcha" value="" id="input-captcha"
                                               class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12"><img src="index.php?route=tool/captcha" alt=""
                                                                id="captcha"/></div>
                                </div>
                                <div class="buttons">
                                    <div class="pull-right">
                                        <button type="button" id="button-review"
                                                data-loading-text="<?php echo $text_loading; ?>"
                                                class="btn btn-primary"><?php echo $button_continue; ?></button>
                                    </div>
                                </div>
                                <?php } else { ?>
                                <?php echo $text_login; ?>
                                <?php } ?>
                            </form>
                        </div>
                        <?php } ?>
                    </div>
                </div>
            </div>

            <?php echo $content_bottom; ?>
        </div>
        <?php echo $column_right; ?>
    </div>
</div>
<script type="text/javascript"><!--
    $('select[name=\'recurring_id\'], input[name="quantity"]').change(function () {
        $.ajax({
            url: 'index.php?route=product/product/getRecurringDescription',
            type: 'post',
            data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
            dataType: 'json',
            beforeSend: function () {
                $('#recurring-description').html('');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();

                if (json['success']) {
                    $('#recurring-description').html(json['success']);
                }
            }
        });
    });
    //--></script>

<script type="text/javascript"><!--
    $('#button-buy-rightnow').on('click', function () {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function () {
                $('#button-buy-rightnow').button('loading');
            },
            complete: function () {
                $('#button-buy-rightnow').button('reset');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {

                    if (json['error']['option']) {

                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));
                            if (element.parent().hasClass('input-group')) {
                                element.parent().before('<div class="alert alert-danger alert-error"> <a href="#" class="close" data-dismiss="alert">&times;</a> ' + json['error']['option'][i] + '</div>');
                            } else {
                                element.before('<div class="alert alert-danger alert-error"> <a href="#" class="close" data-dismiss="alert">&times;</a> ' + json['error']['option'][i] + '</div>');
                            }

                            break;
                        }
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }

                if (json['success']) {

                    $(location).attr("href", "http://www.intimiti.cn/index.php?route=checkout/checkout");
                }
            }
        });
    });
    //--></script>

<script type="text/javascript"><!--
    $('#button-cart').on('click', function () {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function () {
                $('#button-cart').button('loading');
            },
            complete: function () {
                $('#button-cart').button('reset');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().before('<div class="alert alert-danger alert-error"> <a href="#" class="close" data-dismiss="alert">&times;</a> ' + json['error']['option'][i] + '</div>');
                            } else {
                                element.before('<div class="alert alert-danger alert-error"> <a href="#" class="close" data-dismiss="alert">&times;</a> ' + json['error']['option'][i] + '</div>');
                            }

                            break;
                        }
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }

                if (json['success']) {
                    $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('#cart-total').html(json['total']);

                    $('html, body').animate({scrollTop: 0}, 'slow');

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            }
        });
    });
    //--></script>
<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });

    $('.time').datetimepicker({
        pickDate: false
    });

    $('.thumbnail').mousemove( function () {
        var hrefValue = $(this).find('.thumbnail_value').val();
        $('ul.thumbnails > li > a.main_thumb_show > img').attr('src',hrefValue);
    });
/*
    $('.thumbnail').on('click', function () {
        var hrefValue = $(this).find('.thumbnail_value').val();
        $('ul.thumbnails > li > a.main_thumb_show > img').attr('src',hrefValue);
    });
*/
    $('button[id^=\'button-upload\']').on('click', function () {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        timer = setInterval(function () {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function () {
                        $(node).button('loading');
                    },
                    complete: function () {
                        $(node).button('reset');
                    },
                    success: function (json) {
                        $('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').attr('value', json['code']);
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
    //--></script>
<script type="text/javascript"><!--
    $('#review').delegate('.pagination a', 'click', function (e) {
        e.preventDefault();

        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');
    });

    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

    $('#button-review').on('click', function () {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
            beforeSend: function () {
                $('#button-review').button('loading');
            },
            complete: function () {
                $('#button-review').button('reset');
                $('#captcha').attr('src', 'index.php?route=tool/captcha#' + new Date().getTime());
                $('input[name=\'captcha\']').val('');
            },
            success: function (json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                }

                if (json['success']) {
                    $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').prop('checked', false);
                    $('input[name=\'captcha\']').val('');
                }
            }
        });
    });

    $(document).ready(function () {
       /* $('.thumbnails').magnificPopup({
            type: 'image',
            delegate: 'a',
            gallery: {
                enabled: true
            }
        });*/

    });

    function changeAtt(t) {

        for (var i = 0; i < t.parentNode.childNodes.length; i++) {
            if (t.parentNode.childNodes[i].className == 'cattsel') {
                t.parentNode.childNodes[i].className = '';
            }
        }
        t.className = "cattsel";
        t.lastChild.checked = 'checked';
    }

    //--></script>
<?php echo $footer; ?>
