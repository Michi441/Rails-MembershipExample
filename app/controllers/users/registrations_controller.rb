class Users::RegistrationsController < Devise::RegistrationsController



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



end
