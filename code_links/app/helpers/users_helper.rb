module UsersHelper
  def tutor?
    current_user.account_type.eql?("Tutor")
  end

  def tutors
    @tutors = []
    @users = User.all
    if @users
      @users.each do |u|
        if u.account_type.eql?("Tutor")
          @tutors.push u
        end
      end
    end
    @tutors
  end

  def guardians
    @guardians = []
    @users = User.all
    if @users
      User.all.each do |u|
        unless u.account_type.eql?("Tutor")
          @guardians.push u
        end
      end
    end
    @guardians
  end



end
