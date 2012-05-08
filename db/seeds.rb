# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
Admin.create(
  :email => 'madison@holyfireministries.com', :password => 'holyfire1!', :password_confirmation => 'holyfire1!'
)

CommunityGroupLeader.create(
  :email => 'tyler@holyfireministries.com', :password => 'holyfire1!', :password_confirmation => 'holyfire1!'
)

Page.create(
  title: 'New Here?',
  parent: nil,
  permalink: 'new-here',
  description: 'New Here root item.',
  visible: true,
  order: 1
)

Page.create(
  title: 'Resources',
  parent: nil,
  permalink: 'resources',
  description: 'Resources root item.',
  visible: true,
  order: 3
)

Page.create(
  title: 'When & Where',
  parent: nil,
  permalink: 'when-and-where',
  description: 'When & Where root item.',
  visible: true,
  order: 2
)

Page.create(
  title: 'Give',
  parent: nil,
  permalink: 'give',
  description: 'Giving page root item.',
  visible: true,
  order: 4
)

Page.create(
  title: 'Contact',
  parent: nil,
  permalink: 'contact',
  description: 'Contact root item',
  visible: true,
  order: 5
)

Page.create(
  title: 'Home',
  permalink: 'home',
  description: 'Home page.',
  visible: false,
  parent: nil
)

Page.create(
  title: 'Welcome',
  permalink: 'welcome',
  description: 'General church welcome and information.',
  parent: 'New Here?',
  visible: true
)

Page.create(
  title: 'Our Story',
  permalink: 'our-story',
  description: 'Explains the of City Church.',
  parent: 'New Here?',
  visible: true
)

Page.create(
  title: 'The Gospel',
  permalink: 'the-gospel',
  description: 'Explains the gospel of Jesus Christ.',
  parent: 'New Here?',
  visible: true
)

Page.create(
  title: 'Community Groups',
  permalink: 'community-groups',
  description: 'A list of community group information.',
  parent: 'When & Where',
  visible: true
)

Page.create(
  title: 'Videos',
  permalink: 'videos',
  description: 'Link to Vimeo videos.',
  parent: 'Resources',
  visible: true,
  link: 'http://www.vimeo.com/user6107401/videos'
)
