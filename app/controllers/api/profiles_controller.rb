class Api::ProfilesController < ApplicationController

    def create
        @profile = Profile.new(profile_params)

        if @profile.save
            puts "consolelog profile created"
            # render "/api/users/show"
            render json: {}
        else
            puts "profile creation failed"
            render json: @profile.errors.full_messages, status: 422
        end
    end

    def destroy
        @profile = Profile.find(params[:id])

        if @profile && @profile.destroy
            puts "profile destroyed"
            render json: {}
        else
            puts "destroy failed"
        end
    end

    def show
        @profile = Profile.find(params[id])

        if @profile
            
        else
            puts "no profile found"
        end
    end

    private
    def profile_params
        params.require(:profile).permit(:name, :user_id)
    end

end