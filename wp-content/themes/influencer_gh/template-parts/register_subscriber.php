<div class="start__form">
    <div class="start__form__block">
        <form action="#" class="reg__form register_subscriber">
            <h4 class="reg__form__title h4 text-center">
                <?php _e('Start receiving orders from advertisers right now','influencer')?>
            </h4>
            <div class="reg__step__row">
                <input type="text" name="name" class="form-control name reg__input" placeholder="Name">
                <p class="name_message clear_messages"></p>
                <input type="hidden" name="action" value="register_subscriber">
            </div>
            <div class="reg__step__row">
                <input type="email" name="email" class="form-control email reg__input" placeholder="Your email">
                <p class="email_message clear_messages"></p>
            </div>
            <div class="reg__btn__block">
                <button class="btn btn-danger get__btn"> <?php _e('Submit','influencer')?> <i class="fas fa-long-arrow-alt-right"></i>
                </button>
                <p class="reg__form__desc">
                    <?php _e('Registration will take no more than 1 minute','influencer')?>
                </p>
            </div>
        </form>
    </div>
</div>