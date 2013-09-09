module DataMigration
  module MigrationFiles
    class AddCameronBradley < Base

      def up
        cameron = User.find_or_initialize_by_name('Cameron Bradley')
        cameron.hooroo_email = 'cameron@hooroo.com'
        cameron.avatar_email = 'cameronbradley.git@gmail.com'
        cameron.emails = [ 'cameron@hooroo.com' ]
        cameron.save!

        github = Services::Github.new(username: 'cameronb')
        UserService.create!(user: cameron, service: github)
      end

      def down
      end

    end
  end
end
