class Project < ActiveRecord::Base

	has_many :pictures

	validates :title, presence: true
	validates :place, presence: true
	validates :description, presence: true

	has_attached_file :image, styles: { medium: "320x240#"}
	validates_attachment :image, presence: true,
                            content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                            size: { less_than: 5.megabytes }

  validate :showcase_boolean_limit

  protected

  def showcase_boolean_limit
  	if Project.where(:showcase => true).count > 3
  	errors.add :showcase, "Je kan maar 3 projecten uitlichten, verwijder eerst het vinkje bij het te verwijderen project."
		end
  end


end
