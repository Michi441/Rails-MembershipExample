class Users::RegistrationsController < Devise::RegistrationsController


    before_action :select_plan, only: :new


    ## Extend default Devise gem behaviour so that
    ## we are able to use the plan_id when a user signs up.
    ## save with a special Stripe Subscritption
    ## otherwise use the standard signup form
  def create
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_subscription
        else
          resource.save
        end
      end
    end
  end

  def delete
    @subscription = Stripe.Subscription.retrieve('')
    @subscription.delete
  end


  private
    def select_plan
      unless(params[:plan] == '1' || params[:plan] == '2')
        flash[:notice] = "Please select a membership"
        redirect_to root_path
      end
    end



end
