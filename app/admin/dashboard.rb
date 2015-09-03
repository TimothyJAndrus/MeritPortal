ActiveAdmin.register_page "Dashboard" do

  # menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
  #
  # content title: proc{ I18n.t("active_admin.dashboard") } do
  #   div class: "blank_slate_container", id: "dashboard_default_message" do
  #     span class: "blank_slate" do
  #       span I18n.t("active_admin.dashboard_welcome.welcome")
  #       small I18n.t("active_admin.dashboard_welcome.call_to_action")
  #     end
  #   end


    menu :priority => 1
    content :title => proc{ I18n.t("active_admin.dashboard") } do

      columns do

        column do
          panel "Mentors" do
            table_for Mentor.all do |m|
              column( "Name") {|m| m.name}
              column( "Approved?") { |m| status_tag (m.approved? ? "Approved" : "Not Approved"), (m.approved? ? :ok : :error)}
              column( "Edit" ) {|m| link_to "Approve Mentor", edit_mentor_path(m.id)} #TO_DO set conditional to be able to get rid of mentor
            end
          end
        end
      end


    #Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         # Post.recent(5).map do |post|
    #         #   li link_to(post.title, admin_post_path(post))
    #         "hello"
    #         end
    #       end
    #     end
    #   end
    #
    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end

  end # content
end
