<div class="modal fade" id="advertiserRegistrationPopup" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="reg__form__title h5 text-center">
                    <?php
                    _e('Start receiving orders from advertisers right now','influencer');
                    ?>
                </h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="#" class="reg__form registration_form" >
                    <h4 class="reg__form__title h6">
                        <?php _e('Start advertising with bloggers right now','influencer');?>
                    </h4>
                    <div class="reg__step__row  registration_form_step_1 active">
                        <input type="email" name="email" class="reg__input form-control email"
                               placeholder="<?php _e('Your email', 'influencer') ?>">
                        <p class="email_message clear_messages"></p>
                        <input type="hidden" name="action" value="register_form">
                    </div>

                    <div class="reg__step__row  registration_form_step_2">
                        <div class=""><span><?php _e('Who you are ?', 'influencer'); ?> </span>
                            <label class="">
                                <input type="radio" class="" name="profession"
                                       value="brend" checked><span> <?php _e('Brend', 'influencer'); ?></span>
                            </label>
                            <label>
                                <input type="radio" name="profession" class=" profession"
                                       value="agency"><span> <?php _e('Agency', 'influencer'); ?></span>
                            </label>
                            <input type="text" class="reg__input form-control company_name"
                                   placeholder="<?php _e('Brand / Agency Name', 'influencer') ?>"
                                   name="company_name">
                            <p class="company_name_message clear_messages"></p>
                            <input class="reg__input form-control  your_website" type="text"
                                   placeholder="<?php _e('Your website', 'influencer') ?>" name="your_website">
                        </div>
                    </div>

                    <div class="reg__step__row  registration_form_step_3">

                        <input type="text" placeholder="<?php _e('Your name', 'influencer') ?>"
                               name="your_name" class="reg__input form-control your_name">
                        <p class="your_name_message clear_messages"></p>
                        <select class="countrySelect2" name="your_country"  >
                            <option value=""></option>
                        </select>
                        <input type="tel" placeholder="<?php _e('Phone', 'influencer') ?>"
                               name="phone" class="reg__input form-control phone" value="+374">
                    </div>

                    <div class="reg__btn__block">
                        <input type="submit" value="More" class="btn btn-danger get__btn">
                        <!--                            <i class="fas fa-long-arrow-alt-right"></i>-->
                        <p class="reg__form__desc">
                            <?php
                            _e('Registration will take no more than 1 minute','influencer');
                            ?>
                        </p>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

