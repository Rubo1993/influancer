<div class="reg__block ">
    <form action="#" class="reg__form tab-content registration_form" >
        <h4 class="reg__form__title h6">
            <?php _e('Start advertising with bloggers right now','influencer');?>
        </h4>

        <div class="reg__step__row tab-pane registration_form_step_1 active">
            <input type="email" name="email" class="reg__input form-control email"
                   placeholder="<?php _e('Your email', 'influencer') ?>">
            <p class="email_message clear_messages"></p>
            <input type="hidden" name="action" value="register_form">
        </div>

        <div class="reg__step__row tab-pane registration_form_step_2">
            <div class=""><span><?php _e('Who you are ?', 'influencer'); ?> </span>
                <label class="">
                    <input type="radio" name="profession"
                           value="brend" checked><span> <?php _e('Brend', 'influencer'); ?></span>
                </label>
                <label>
                    <input type="radio" name="profession" class=" profession"
                           value="agency"><span> <?php _e('Agency', 'influencer'); ?></span>
                </label>
                <input type="text" class="reg__input form-control company_name"
                       placeholder="<?php _e('Brand / Agency Name', 'influencer') ?>"
                       name="company_name">

                <input class="reg__input form-control  your_website" type="text"
                       placeholder="<?php _e('Your website', 'influencer') ?>" name="your_website">
            </div>
        </div>

        <div class="reg__step__row tab-pane registration_form_step_3">

            <input type="text" placeholder="<?php _e('Your name', 'influencer') ?>"
                   name="your_name" class="reg__input form-control your_name">
            <select class="countrySelect2" name="your_country"  >
                <option value=""></option>
            </select>
            <input type="tel" placeholder="<?php _e('Phone', 'influencer') ?>"
                   name="phone" class="reg__input form-control phone" value="+374">

            <!--            <input type="password" placeholder="--><?php //_e('Password', 'influencer') ?><!--"-->
            <!--                   name="password" class="reg__input form-control password">-->
            <!--            <p class="password_message clear_messages"></p>-->
        </div>

        <div class="reg__btn__block">
            <input type="submit" value="More" class="btn btn-danger get__btn">
            <!--                            <i class="fas fa-long-arrow-alt-right"></i>-->
            <p class="reg__form__desc">
                <?php _e('Registration will take no more than 1 minute','influencer');?>
            </p>
        </div>
    </form>
    <ul class="reg__step__block">
        <li class="reg__step__list step_one_slid active"></li>
        <li class="reg__step__list step_two_slid "></li>
        <li class="reg__step__list step_three_slid"></li>
    </ul>
</div>