POST_BODY = {
  :customCategories => {
    :title => "test modify #{(Time.new.to_f * 1000).round.to_s}",
    :isAssignable => true
  }
}.freeze

COURSE_ID = "9863320".freeze
PATH_COURSES_GRADEBOOK_CUSTOMCATEGORIES = "/courses/#{COURSE_ID}/gradebook/customCategories".freeze
FactoryGirl.define do
  factory :test_constant, :class => OpenStruct do
    url                  "https://api.learningstudio.com#{PATH_COURSES_GRADEBOOK_CUSTOMCATEGORIES}"
    post_body            POST_BODY.to_json
    teacher_username     "srinath.karkhani.teacher@pearson.com"
    teacher_password     "Shiv5YsX"
    resource_object_key  "customCategory"
    resource_id_key      "guid"
    resorce_single       "customCategory"
    resource_plural      "customCategories"
    custom_category_json POST_BODY.to_json
    custom_category_xml "<?xml version=\"1.0\" encoding=\"utf-8\"?><customCategories xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"><customCategory><title>Custom Category #{Time.now.to_i}</title><isAssignable>true</isAssignable></customCategory></customCategories>"
    course_id            COURSE_ID
    path_courses_gradebook_customcategories PATH_COURSES_GRADEBOOK_CUSTOMCATEGORIES
    path_courses_msofficedocuments_originaldocument '/courses/%s/msOfficeDocuments/%s/originalDocument'
    ms_officedocument_id "100491666984"
  end
end
