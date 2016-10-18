class RemovePaperclipFromTickets < ActiveRecord::Migration[5.0]
  def change
    remove_attachment :tickets, :proof_img1
    remove_attachment :tickets, :proof_img2
    remove_attachment :tickets, :proof_img3
    remove_attachment :tickets, :proof_img4
    remove_attachment :tickets, :proof_img5
  end
end
