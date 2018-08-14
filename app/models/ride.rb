class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if self.user.tickets>=self.attraction.tickets
      enough_tickets=true
    else
      enough_tickets=false
      #return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    end

    if self.user.height>=self.attraction.min_height
      tall_enough=true
    else
      tall_enough=false
      #return "Sorry. You are not tall enough to ride the #{attraction.name}."
    end

    if !tall_enough && !enough_tickets
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !tall_enough
      return "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif  !enough_tickets
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else
      self.user.update(:tickets => self.user.tickets-self.attraction.tickets, :nausea => self.user.nausea+self.attraction.nausea_rating, :happiness => self.user.happiness+self.attraction.happiness_rating)
    end




  end
end
