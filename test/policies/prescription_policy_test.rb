require 'test_helper'

class PrescriptionPolicyTest < ActiveSupport::TestCase
  def test_scope
  end

 def show?
def show?
    # Admins can view any prescription
    return true if user.admin?

    # If the current user owns the prescription through the token
    # or the prescription belongs to the patient's user
    user.patients.include?(record.patient) || record.token.user == user
  end
end

  def test_create
  end

  def test_update
  end

  def test_destroy
  end
end
