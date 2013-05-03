class RetrospectiveMailer< ActionMailer::Base
  default :from => 'core@iba.com.br'

  def retrospective_resume(id)
    @retrospective = Retrospective.find(id)
    @worst = Retrospective.where(:id => id).first
    mail(to: 'danilo.moura.lima@gmail.com', subject: "Items da retrospectiva: #{@retrospective.name}")
  end
end
