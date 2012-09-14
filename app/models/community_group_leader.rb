class CommunityGroupLeader < User
  has_one :community_group

  field :first, type: String
  field :last, type: String
  field :email, type: String
end
