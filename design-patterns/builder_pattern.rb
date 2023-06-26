class Party
  attr_accessor :title, :members, :supplies, :mission
  def initialize
    @title = title
    @members = []
    @supplies = []
    @mission = mission
  end

  def add_member(member)
    @members << member
  end

  def add_supply(supply)
    @supplies << supply
  end

  def state_mission
    puts "Our mission is to #{@mission}"
  end

  def report
    puts "We are a #{@title} party."
    puts "Our members are:#{@members}"
    puts "We are supplied with:#{@supplies}"
    state_mission
  end
end

class PartyBuilder
  def assign_title
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def recruit_members
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def supply_members
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def assign_mission
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def get_party
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class HuntingPartyBuilder < PartyBuilder
  def initialize
    @party = Party.new
  end

  def assign_title
    @party.title = "hunting"
  end

  def recruit_members
    @party.add_member("Ranger")
    @party.add_member("Hunter")
    @party.add_member("Forager")
  end

  def supply_members
    @party.add_supply("bows")
    @party.add_supply("arrows")
    @party.add_supply("water skins")
    @party.add_supply("hunting knives")
    @party.add_supply("tent")
  end

  def assign_mission
    @party.mission = "hunt the white stag."
  end

  def get_party
    @party
  end
end

class DiplomacyPartyBuilder < PartyBuilder
  def initialize
    @party = Party.new
  end

  def assign_title
    @party.title = "diplomacy"
  end

  def recruit_members
    @party.add_member("Politician")
    @party.add_member("Bard")
    @party.add_member("Assassin")
  end

  def supply_members
    @party.add_supply("letters of introduction")
    @party.add_supply("fine clothes")
    @party.add_supply("ink and paper")
    @party.add_supply("gifts")
    @party.add_supply("bottle of poison")
  end

  def assign_mission
    @party.mission = "gain the local lord's trust at any cost."
  end

  def get_party
    @party
  end
end

class SailingPartyBuilder < PartyBuilder
  def initialize
    @party = Party.new
  end

  def assign_title
    @party.title = "sailing"
  end

  def recruit_members
    @party.add_member("Captain")
    @party.add_member("Boatswain")
    @party.add_member("Stowaway")
  end

  def supply_members
    @party.add_supply("rope")
    @party.add_supply("sextant")
    @party.add_supply("compass")
    @party.add_supply("barrels")
    @party.add_supply("vitamin C")
  end

  def assign_mission
    @party.mission = "cross the Eastern Ocean before the winds change."
  end

  def get_party
    @party
  end
end

class PartyDirector
  def initialize(party_builder)
    @party_builder = party_builder
  end

  def build_party
    @party_builder.assign_title
    @party_builder.recruit_members
    @party_builder.supply_members
    @party_builder.assign_mission
  end
end

def create_all_parties
  parties = {
    hunting: HuntingPartyBuilder.new,
    diplomacy: DiplomacyPartyBuilder.new,
    sailing: SailingPartyBuilder.new
  }

  parties.each_value do |v|
    party_builder = v
    party_director = PartyDirector.new(party_builder)
    party_director.build_party
    party = party_builder.get_party
    party.report
    puts "\n"
  end
end

create_all_parties