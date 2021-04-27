class MembersController < ApplicationController
  before_action :set_member, only: %i[ show edit update destroy ]

  # GET /members or /members.json
  def index
    @members = Member.all
  end

  # GET /members/1 or /members/1.json
  def show
  end

  # GET /members/new
  def new
    @family = Family.find(params[:family])
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members or /members.json
  def create
    family = Family.find(member_params[:family_id])
    # @user = User.new(email: 'teddy', password: 'password', password_confirmation: 'password', member_attributes: member_params)
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        # @member = @user.member
        format.html { redirect_to family, notice: "Member was successfully created." }
        format.json { render :show, status: :created, location: @member }
        # send out reset password email
      else
        binding.pry
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: "Member was successfully updated." }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: "Member was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(:family_id, :email, :role, :user_id)
    end
end
