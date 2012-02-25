class Task < ActiveRecord::Base
  belongs_to :project

  POINTS =  (1..19).to_a

  after_create :send_to_pusher

  Pusher.app_id = '16005'
  Pusher.key = '5362e0e1944084bd05cc'
  Pusher.secret = 'e7b6b405cc50bc5c8547'


  def send_to_pusher
    Pusher['agile-open'].trigger!('task:create', self.to_json)
  end

end
