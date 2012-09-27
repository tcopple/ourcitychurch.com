class CommunityGroupLeader < User
  has_one :community_group, inverse_of: :leaders

  field :first, type: String
  field :last, type: String
  field :email, type: String
end
