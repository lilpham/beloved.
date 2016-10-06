class Users::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super

  # end

  # POST /resource
  def create
    super
    if user_signed_in?
      WelcomeMailer.welcome_email(current_user).deliver_now

      thisweek_checklist = Checklist.create!(
        title: "This Week",
        description: "Goals to finish by Sunday!",
        user_id: current_user.id
        )

      checklist1 = Checklist.create!(
        title: "#{(current_user.wedding_date - 12.months).strftime("%B")}",
        description: "Your big to-do's for this month! Let's get started!",
        user_id: current_user.id
        )
      
      checklist1.tasks.create!([
        {name:"Book reception venue", deadline: current_user.wedding_date - 12.months, urgent: true},
        {name:"Book ceremony venue", deadline: current_user.wedding_date - 12.months, urgent: true},
        {name:"Book officiant", deadline: current_user.wedding_date - 12.months, urgent: true},
        ])


      checklist2 = Checklist.create!(
        title: "#{(current_user.wedding_date - 10.months).strftime("%B")}",
        description: "Your big to-do's for this month! Let's get started!",
        user_id: current_user.id
        )
      
      checklist2.tasks.create!([
        {name:"Block out hotel rooms for guests", deadline: current_user.wedding_date - 10.months, urgent: true},
        {name:"Choose wedding party! aka: your baes", deadline: current_user.wedding_date - 10.months, urgent: true},
        {name:"Book photographer", deadline: current_user.wedding_date - 10.months, urgent: true},
        {name:"Book videographer", deadline: current_user.wedding_date - 10.months, urgent: true},
        {name:"Book caterer", deadline: current_user.wedding_date - 10.months, urgent: true},
        ])

      checklist3 = Checklist.create!(
        title: "#{(current_user.wedding_date - 8.months).strftime("%B")}",
        description: "You've got a lot this month, but you'll thank us later if you nail them down!",
        user_id: current_user.id
        )
      
      checklist3.tasks.create!([
        {name:"Register for registry - woohoo! Gifts!", deadline: current_user.wedding_date - 8.months, urgent: true},
        {name:"Go wedding dress shopping!", deadline: current_user.wedding_date - 8.months, urgent: true},
        {name:"Look for Bridesmaids dresses(or let your bridesmaids pick their own!)", deadline: current_user.wedding_date - 8.months, urgent: true},
        {name:"Book florist", deadline: current_user.wedding_date - 8.months, urgent: true},
        {name:"Book band/dj for reception", deadline: current_user.wedding_date - 8.months, urgent: true},
        ])

      checklist4 = Checklist.create!(
        title: "#{(current_user.wedding_date - 6.months).strftime("%B")}",
        description: "You've got a lot this month, but you'll thank us later if you nail them down!",
        user_id: current_user.id
        )
      
      checklist4.tasks.create!([
        {name:"Book your baker - cake time!", deadline: current_user.wedding_date - 6.months, urgent: true},
        {name:"Send 'Save the Dates'", deadline: current_user.wedding_date - 6.months, urgent: true},
        {name:"Book ceremony musicians or ask a friend to play for your ceremony!", deadline: current_user.wedding_date - 6.months, urgent: true},
        ])

      checklist5 = Checklist.create!(
        title: "#{(current_user.wedding_date - 4.months).strftime("%B")}",
        description: "You've got a lot this month, but you'll thank us later if you nail them down!",
        user_id: current_user.id
        )
      
      checklist5.tasks.create!([
        {name:"Book rehearsal dinner venue", deadline: current_user.wedding_date - 4.months, urgent: true},
        {name:"Book honeymoon (hello, paradise)", deadline: current_user.wedding_date - 4.months, urgent: true},
        {name:"Rent/Purchase menswear attire", deadline: current_user.wedding_date - 4.months, urgent: true},
        {name:"Order wedding bands", deadline: current_user.wedding_date - 4.months, urgent: true},
        ])

      checklist6 = Checklist.create!(
        title: "#{(current_user.wedding_date - 2.months).strftime("%B")}",
        description: "You've got a lot this month, but you'll thank us later if you nail them down!",
        user_id: current_user.id
        )
      
      checklist6.tasks.create!([
        {name:"Schedule make-up trial OR practice your make-up (if you're doing your own)", deadline: current_user.wedding_date - 2.months, urgent: true},
        {name:"Schedule hair trial OR practice your hair (if you're doing your own)", deadline: current_user.wedding_date - 2.months, urgent: true},
        {name:"Send formal invites (it's go time!)", deadline: current_user.wedding_date - 2.months, urgent: true},
        ])

      checklist7 = Checklist.create!(
        title: "#{(current_user.wedding_date - 1.months).strftime("%B")}",
        description: "You're almost there! We can't wait!",
        user_id: current_user.id
        )
      
      checklist7.tasks.create!([
        {name:"Finalize ceremony program", deadline: current_user.wedding_date - 1.months, urgent: true},
        {name:"Apply for marriage license", deadline: current_user.wedding_date - 1.months, urgent: true},
        ])

      checklist8 = Checklist.create!(
        title: "#{(current_user.wedding_date + 1.month).strftime("%B")}",
        description: "You're almost there! We can't wait!",
        user_id: current_user.id
        )
      
      checklist8.tasks.create!([
        {name:"Send thank you cards", deadline: current_user.wedding_date + 1.month, urgent: true},
        {name:"Change your name", deadline: current_user.wedding_date + 1.month, urgent: true},
        ])
     

    end




  end

  private
  def user_params
    params.require(:user).permit(
    :name, :fiance_name, :wedding_date, :password, :notifications, :phone_number
    )
  end 

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:fiance_name])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
