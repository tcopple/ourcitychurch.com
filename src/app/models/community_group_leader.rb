class CommunityGroupLeader < User
  belongs_to :community_group, inverse_of: :leaders

  field :first, type: String
  field :last, type: String
end
