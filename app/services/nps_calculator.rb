class NpsCalculator

  def initialize(campaign:)
    @campaign = campaign
  end

  def percentage_promoters
    (promoter_scores.count.to_f / raw_scores.count).round(2)
  end

  def percentage_detractors
    (detractor_scores.count.to_f / raw_scores.count).round(2)
  end

  def percentage_passives
    (passive_scores.count.to_f / raw_scores.count).round(2)
  end

  def absolute_promoters 
    promoter_scores.count
  end

  def absolute_detractors 
    detractor_scores.count
  end

  def absolute_passives 
    passive_scores.count
  end

  def score
    return "There were no responses to this campaign" if no_responses?
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