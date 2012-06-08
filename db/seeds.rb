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
  menu_title: 'New Here?',
  parent: nil,
  permalink: 'new-here',
  visible: true,
  order: 1
)

Page.create(
  menu_title: 'Resources',
  parent: nil,
  permalink: 'resources',
  visible: true,
  order: 3
)

Page.create(
  menu_title: 'When & Where',
  parent: nil,
  permalink: 'when-and-where',
  visible: true,
  order: 2
)

Page.create(
  menu_title: 'Give',
  parent: nil,
  permalink: 'give',
  visible: true,
  order: 4
)

Page.create(
  menu_title: 'Contact',
  parent: nil,
  permalink: 'contact',
  visible: true,
  order: 5
)

Page.create(
  menu_title: 'Home',
  permalink: 'home',
  visible: false,
  parent: nil
)

Page.create(
  menu_title: 'Welcome',
  permalink: 'welcome',
  parent: 'New Here?',
  visible: true
)

Page.create(
  menu_title: 'Our Story',
  permalink: 'our-story',
  parent: 'New Here?',
  visible: true
)

Page.create(
  menu_title: 'The Gospel',
  permalink: 'the-gospel',
  parent: 'New Here?',
  visible: true
)

Page.create(
  menu_title: 'Community Groups',
  permalink: 'community-groups',
  parent: 'When & Where',
  visible: true
)

Page.create(
  menu_title: 'Videos',
  permalink: 'videos',
  parent: 'Resources',
  visible: true,
  link: 'http://www.vimeo.com/user6107401/videos'
)
