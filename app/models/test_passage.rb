class TestPassage < ApplicationRecord
  SUCCESS_RATE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  def completed?
    current_question.nil?
  end
  
  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def success_calculation
    (correct_questions.to_f * 100 / test.questions.count).round
  end

  def question_number
    test.questions.index(current_question) + 1
  end

  def questions_count
    test.questions.count
  end

  def test_passed?
    in_time? && success_calculation >= SUCCESS_RATE if completed?
  end

  def time_duration
    (Time.current - self.created_at).to_i
  end

  def time_remains
    (test.timer * 60) - time_duration
  end
  
  private
  
  def set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end
  
  def correct_answers
    current_question.answers.correct
  end
  
  def next_question
    if current_question
      test.questions.order(:id).where('id > ?', current_question.id).first
    else
      test.questions.first
    end
  end

  def in_time?
    test_timer = test.timer * 60
    test_timer.zero? || time_duration <= test_timer
  end
end
