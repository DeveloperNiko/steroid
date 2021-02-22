<input type="hidden" name="wholesale_recalculate" value="0" />
<a data-toggle="modal" data-target="#fn_wholesale_discount_recalculate" class="hidden"></a>
<div id="fn_wholesale_discount_recalculate" class="modal fade show" role="document">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="card-header">
                <div class="heading_modal"></div>
            </div>
            <div class="modal-body">
                <button type="submit" class="btn btn_small btn_blue fn_recalculate_wholesale_confirm mx-h">
                    {include file='svg_icon.tpl' svgId='checked'}
                    <span>{$btr->index_yes|escape}</span>
                </button>

                <button type="button" class="btn btn_small btn-danger fn_recalculate_wholesale_dismiss mx-h" data-dismiss="modal">
                    {include file='svg_icon.tpl' svgId='delete'}
                    <span>{$btr->index_no|escape}</span>
                </button>
            </div>
        </div>
    </div>
</div>

{literal}
    <script>
        $(function() {

            var confirm = false;

            {/literal}

            var confirm_recalculate_dicounts = '{$btr->simplamarket__wholesale_discount_recalculate}';

            {literal}

            $(".fn_fast_button").submit(function(e) {
                if (confirm === true) {
                    return;
                }

                e.preventDefault();
                $('#fn_wholesale_discount_recalculate .heading_modal').text(confirm_recalculate_dicounts);
                $('[data-target="#fn_wholesale_discount_recalculate"]').trigger('click');
            });

            $(document).on("click", ".fn_recalculate_wholesale_confirm", function () {
                $('input[name="wholesale_recalculate"]').val(1);
                confirm = true;
                $(".fn_fast_button").submit();
            });

            $(document).on("click", ".fn_recalculate_wholesale_dismiss", function () {
                $('input[name="wholesale_recalculate"]').val(0);
                confirm = true;
                $(".fn_fast_button").submit();
            });
        });

    </script>
{/literal}