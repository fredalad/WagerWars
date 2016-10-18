class AddAttachmentProofImg1ProofImg2ProofImg3ProofImg4ProofImg5ToTickets < ActiveRecord::Migration
  def self.up
    change_table :tickets do |t|
      t.attachment :proof_img1
      t.attachment :proof_img2
      t.attachment :proof_img3
      t.attachment :proof_img4
      t.attachment :proof_img5
    end
  end

  def self.down
    remove_attachment :tickets, :proof_img1
    remove_attachment :tickets, :proof_img2
    remove_attachment :tickets, :proof_img3
    remove_attachment :tickets, :proof_img4
    remove_attachment :tickets, :proof_img5
  end
end
