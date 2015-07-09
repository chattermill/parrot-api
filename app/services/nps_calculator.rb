class NpsCalculator

  def initialize(campaign:)
    @campaign = campaign
  end

  def percentage_promoters
    return 0 if no_responses?
    (promoter_scores.count.to_f / raw_scores.count).round(2)
  end

  def percentage_detractors
    return 0 if no_responses?
    (detractor_scores.count.to_f / raw_scores.count).round(2)
  end

  def percentage_passives
    return 0 if no_responses?
    (passive_scores.count.to_f / raw_scores.count).round(2)
  end

  def number_of_promoters 
    return 0 if no_responses?
    promoter_scores.count
  end

  def number_of_detractors 
    return 0 if no_responses?
    detractor_scores.count
  end

  def number_of_passives
    return 0 if no_responses?
    passive_scores.count
  end

  def score
    return 0 if no_responses?
    (percentage_promoters - percentage_detractors).round(2)
  end


  private

  attr_reader :campaign

  def no_responses?
    campaign.survey_responses.empty?
  end
  
  def raw_scores
    campaign.survey_responses.map(&:score)
  end

  def promoter_scores
    raw_scores.select { |score| score >= 9 }
  end

  def detractor_scores
    raw_scores.select { |score| score <= 6 }
  end

  def passive_scores
    raw_scores - detractor_scores - promoter_scores
  end
end