<div class="modal fade" id="bloggerRegistrationPopup" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="reg__form__title h5 text-center">
                    <?php
                    _e('Start receiving orders from advertisers right now', 'influencer');
                    ?>
                </h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="#" class="bloger-registration">
                    <input type="text" placeholder="<?php _e('Your name', 'influencer') ?>"
                           name="your_name" class="your_name reg__input form-control">
                    <span class="your_name_message clear_messages"></span>
                    <input type="email" name="email" class="reg__input form-control email"
                           placeholder="<?php _e('Your email', 'influencer') ?>">
                    <span class="email_message clear_messages"></span>
                    <input type="hidden" name="action" value="bloger_register">
                    <select class="countrySelect2" name="your_country"  >
                        <option value=""></option>
                    </select>

                    <input type="text" placeholder="<?php _e('Phone', 'influencer') ?>"
                           name="phone" class="phone reg__input form-control">
                    <span class="phone_message clear_messages"></span>
                    <div>
                        <select class="select2" name="networks[]" multiple="multiple">
                            <option value="Youtube">Youtube</option>
                            <option value="Instagram">Instagram</option>
                            <option value="Twitter">Twitter</option>
                            <option value="Pinterest">Pinterest</option>
                            <option value="Facebook">Facebook</option>
                        </select>
                    </div>
                    <input type="submit" value="More" class="btn btn-danger get__btn">
                </form>


            </div>
        </div>
    </div>
</div>

