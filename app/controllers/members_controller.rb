class MembersController < ApplicationController
  before_action :set_member, only: %i[ show edit update destroy ]

  # GET /members/1 or /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # POST /members or /members.json
  def create
    family = Family.find(member_params[:family_id])

    raw, hashed = Devise.token_generator.generate(User, :reset_password_token)
    @user = User.new({
      email: member_params[:email],
      password: 'password',
      password_confirmation: 'password',
      name: member_params[:name],
      member_attributes: {role: member_params[:role], family: family}
    })
    @user.reset_password_token = hashed
    @user.reset_password_sent_at = Time.now.utc

    respond_to do |format|
      if @user.save
        # @user.send_reset_password_instructions
        @member = @user.member
        format.html { redirect_to family, notice: "Member was successfully created with email #{@user.email} and password 'password'." }
        format.json { render :show, status: :created, location: @member }
        # send out reset password email
      else
        format.html { render :new, locals: {family: family.id}, status: :unprocessable_entity }
        format.json { render json: @user.errors.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(:family_id, :email, :role, :user_id, :name)
    end
end
