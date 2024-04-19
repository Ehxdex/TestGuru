class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  def completed?
    current_question.nil?
  end
  
  def accept!(answer_ids)
    if correct_answer?
      self.correct_question += 1
    end
  
    self.current_question = next_question
    save!
  end
  
  private
  
  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
  
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end
  
  def correct_answers
    current_question.answers.correct
  end
  
  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
