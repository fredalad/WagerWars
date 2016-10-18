class AddAttachmentAcptTeamImg1AcptTeamImg2AcptTeamImg3AcptTeamImg4AcptTeamImg5ChlgTeamImg1ChlgTeamImg3ChlgTeamImg4ChlgTeamImg5ToTickets < ActiveRecord::Migration
  def self.up
    change_table :tickets do |t|
      t.attachment :acpt_team_img1
      t.attachment :acpt_team_img2
      t.attachment :acpt_team_img3
      t.attachment :acpt_team_img4
      t.attachment :acpt_team_img5

      t.attachment :chlg_team_img1
      t.attachment :chlg_team_img2
      t.attachment :chlg_team_img3
      t.attachment :chlg_team_img4
      t.attachment :chlg_team_img5
    end
  end

  def self.down
    remove_attachment :tickets, :acpt_team_img1
    remove_attachment :tickets, :acpt_team_img2
    remove_attachment :tickets, :acpt_team_img3
    remove_attachment :tickets, :acpt_team_img4
    remove_attachment :tickets, :acpt_team_img5

    remove_attachment :tickets, :chlg_team_img1
    remove_attachment :tickets, :chlg_team_img2
    remove_attachment :tickets, :chlg_team_img3
    remove_attachment :tickets, :chlg_team_img4
    remove_attachment :tickets, :chlg_team_img5
  end
end
