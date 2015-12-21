require 'nokogiri'
require File.expand_path("../../../test_helper", __FILE__)
require 'learning_studio_core/basic_service'

module LearningStudioCore
  class BasicServiceTest < MiniTest::Unit::TestCase

    def setup
      @oauth_config = FactoryGirl.build(:oauth_config)
      @test_constants = FactoryGirl.build(:test_constant)
      @factory = LearningStudioAuthentication::Service::OAuthServiceFactory.new(@oauth_config)
      @service = LearningStudioCore::BasicService.new(@factory)
    end

    def test_system_datetime_oauth1
      system_datetime_oauth1_test()
    end

    def test_system_datetime_with_oauth1_in_xml
      @service.data_format = BasicService::DataFormat::XML
      system_datetime_oauth1_test()
    end

    def test_system_datetime_oauth2_assertion()
      @service.use_oauth2(@test_constants.teacher_username)
      system_datetime_test()
    end

    def test_system_datetime_with_xml_oauth2_assertion
      @service.data_format = BasicService::DataFormat::XML
      test_system_datetime_oauth2_assertion()
    end

    def test_system_datetime_oauth2_password
      @service.use_oauth2(@test_constants.teacher_username, @test_constants.teacher_password)
      system_datetime_test()
    end

    def test_system_datetime_with_xml_oauth2_password
      @service.data_format = BasicService::DataFormat::XML
      test_system_datetime_oauth2_assertion()
    end

    # # Not worth doing this everytime
    # def test_system_date_time_with_expiration_oauth2_password()
    #   @service.use_oauth2(@test_constants.teacher_username, @test_constants.teacher_password)
    #   system_datetime_test()
    #   sleep(90 * 60) # 91 minutes
    #   system_datetime_test()
    # end

    def test_system_datetime_millis_oauth1
      @service.use_oauth1()
      system_datetime_millis_test()
    end

    def test_system_datetime_millis_with_xml_oauth1
      @service.data_format = BasicService::DataFormat::XML
      test_system_datetime_millis_oauth1()
    end

    def test_system_datetime_millis_oauth2_assertion
      @service.use_oauth2(@test_constants.teacher_username)
      system_datetime_millis_test()
    end

    def test_system_datetime_millis__with_xml_oauth2_assertion
      @service.data_format = BasicService::DataFormat::XML
      test_system_datetime_millis_oauth2_assertion()
    end

    def test_system_datetime_millis_oauth2_password
      @service.use_oauth2(@test_constants.teacher_username, @test_constants.teacher_password)
      system_datetime_millis_test()
    end

    def test_system_datetime_millis__with_xml_oauth2_password
      @service.data_format = BasicService::DataFormat::XML
      test_system_datetime_millis_oauth2_password()
    end

    def test_create_custom_gradebook_category_oauth1
      @service.use_oauth1
      custom_gradebook_category_id = create_custom_gradebook_category_test
      teardown_custom_gradebook_category(custom_gradebook_category_id)
    end

    def test_create_custom_gradebook_category_with_xml_oauth1
      begin
        @service.data_format = BasicService::DataFormat::XML
        test_create_custom_gradebook_category_oauth1()
        raise RuntimeError, "Expected Assertion Error"
      rescue MiniTest::Assertion => e
        pass
      end
    end

    def test_create_custom_gradebook_category_oauth2_assertion
      @service.use_oauth2(@test_constants.teacher_username)
      custom_gradebook_category_id = create_custom_gradebook_category_test
      teardown_custom_gradebook_category(custom_gradebook_category_id)
    end

    def test_create_custom_gradebook_category_with_xml_oauth2_assertion
      begin
        @service.data_format = BasicService::DataFormat::XML
        test_create_custom_gradebook_category_oauth2_assertion()
        raise RuntimeError, "Expected Assertion Error"
      rescue MiniTest::Assertion => e
        pass
      end
    end

    def test_update_custom_gradebook_category_oauth1
      custom_gradebook_category_id = setup_custom_gradebook_category()
      begin
        @service.use_oauth1
        update_custom_gradebook_category_test(custom_gradebook_category_id)
      ensure
        teardown_custom_gradebook_category(custom_gradebook_category_id)
      end
    end

    def test_update_custom_gradebook_category_with_xml_oauth1
      custom_gradebook_category_id = setup_custom_gradebook_category()
      begin
        @service.use_oauth1
        @service.data_format = BasicService::DataFormat::XML
        update_custom_gradebook_category_test(custom_gradebook_category_id)
      rescue MiniTest::Assertion => e
        pass
      ensure
        teardown_custom_gradebook_category(custom_gradebook_category_id)
      end
    end

    def test_update_custom_gradebook_category_oauth2_assertion
      custom_gradebook_category_id = setup_custom_gradebook_category()
      begin
        @service.use_oauth2(@test_constants.teacher_username)
        update_custom_gradebook_category_test(custom_gradebook_category_id)
      ensure
        teardown_custom_gradebook_category(custom_gradebook_category_id)
      end
    end

    def test_update_custom_gradebook_category_with_xml_oauth2_assertion
      custom_gradebook_category_id = setup_custom_gradebook_category()
      begin
        @service.data_format = BasicService::DataFormat::XML
        @service.use_oauth2(@test_constants.teacher_username)
        update_custom_gradebook_category_test(custom_gradebook_category_id)
        raise RuntimeError('Expected Assertion Error')
      rescue MiniTest::Assertion => e
        pass
      ensure
        teardown_custom_gradebook_category(custom_gradebook_category_id)
      end
    end

    def test_update_custom_gradebook_category_oauth2_password
      custom_gradebook_category_id = setup_custom_gradebook_category()
      begin
        @service.use_oauth2(@test_constants.teacher_username, @test_constants.teacher_password)
        update_custom_gradebook_category_test(custom_gradebook_category_id)
      ensure
        teardown_custom_gradebook_category(custom_gradebook_category_id)
      end
    end

    def test_update_custom_gradebook_category_with_xml_oauth2_password
      custom_gradebook_category_id = setup_custom_gradebook_category()
      begin
        @service.data_format = BasicService::DataFormat::XML
        @service.use_oauth2(@test_constants.teacher_username, @test_constants.teacher_password)
        update_custom_gradebook_category_test(custom_gradebook_category_id)
        raise RuntimeError('Expected Assertion Error')
      rescue MiniTest::Assertion => e
        pass
      ensure
        teardown_custom_gradebook_category(custom_gradebook_category_id)
      end
    end

    def test_delete_custom_gradebook_category_oauth1
      custom_gradebook_category_id = setup_custom_gradebook_category()
      @service.use_oauth1
      delete_custom_gradebook_category_test(custom_gradebook_category_id)
    end

    def test_delete_custom_gradebook_category_with_xml_oauth1
      @service.data_format = BasicService::DataFormat::XML
      test_delete_custom_gradebook_category_oauth1()
    end

    def test_delete_custom_gradebook_category_oauth2_assertion
      custom_gradebook_category_id = setup_custom_gradebook_category()
      @service.use_oauth2(@test_constants.teacher_username)
      delete_custom_gradebook_category_test(custom_gradebook_category_id)
    end

    def test_delete_custom_gradebook_category_with_xml_oauth2_assertion
      @service.data_format = BasicService::DataFormat::XML
      test_delete_custom_gradebook_category_oauth2_assertion()
    end

    def test_delete_custom_gradebook_category_oauth2_password
      custom_gradebook_category_id = setup_custom_gradebook_category()
      @service.use_oauth2(@test_constants.teacher_username, @test_constants.teacher_password)
      delete_custom_gradebook_category_test(custom_gradebook_category_id)
    end

    def test_delete_custom_gradebook_category_with_xml_oauth2_password
      @service.data_format = BasicService::DataFormat::XML
      test_delete_custom_gradebook_category_oauth2_password()
    end

    def test_get_custom_gradebook_category_oauth1
      custom_gradebook_category_id = setup_custom_gradebook_category()
      begin
        @service.use_oauth1
        get_custom_gradebook_category_test(custom_gradebook_category_id)
      ensure
        teardown_custom_gradebook_category(custom_gradebook_category_id)
      end
    end

    def test_get_custom_gradebook_category_with_xml_oauth1
      @service.data_format = BasicService::DataFormat::XML
      test_get_custom_gradebook_category_oauth1
    end

    def test_get_custom_gradebook_category_oauth1_repeat
      custom_gradebook_category_id = setup_custom_gradebook_category()
      begin
        @service.use_oauth1
        get_custom_gradebook_category_test(custom_gradebook_category_id)
        LearningStudioCore::TestHelper.delay_in_seconds(3)
        get_custom_gradebook_category_test(custom_gradebook_category_id)
        LearningStudioCore::TestHelper.delay_in_seconds(3)
        get_custom_gradebook_category_test(custom_gradebook_category_id)
      ensure
        teardown_custom_gradebook_category(custom_gradebook_category_id)
      end
    end

    def test_get_custom_gradebook_category_with_xml_oauth1_repeat
      custom_gradebook_category_id = setup_custom_gradebook_category()
      begin
        @service.data_format = BasicService::DataFormat::XML
        @service.use_oauth1
        get_custom_gradebook_category_test(custom_gradebook_category_id)
        LearningStudioCore::TestHelper.delay_in_seconds(3)
        get_custom_gradebook_category_test(custom_gradebook_category_id)
        LearningStudioCore::TestHelper.delay_in_seconds(3)
        get_custom_gradebook_category_test(custom_gradebook_category_id)
      ensure
        teardown_custom_gradebook_category(custom_gradebook_category_id)
      end
    end

    def test_get_custom_gradebook_category_oauth2_assertion
      custom_gradebook_category_id = setup_custom_gradebook_category()
      begin
        @service.use_oauth2(@test_constants.teacher_username)
        get_custom_gradebook_category_test(custom_gradebook_category_id)
      ensure
        teardown_custom_gradebook_category(custom_gradebook_category_id)
      end
    end

    def test_get_custom_gradebook_category_with_xml_oauth2_assertion
      custom_gradebook_category_id = setup_custom_gradebook_category()
      begin
        @service.data_format = BasicService::DataFormat::XML
        @service.use_oauth2(@test_constants.teacher_username)
        get_custom_gradebook_category_test(custom_gradebook_category_id)
      ensure
        teardown_custom_gradebook_category(custom_gradebook_category_id)
      end
    end

    def test_get_custom_gradebook_category_oauth2_assertion_repeat
      custom_gradebook_category_id = setup_custom_gradebook_category()
      begin
        @service.use_oauth2(@test_constants.teacher_username)
        get_custom_gradebook_category_test(custom_gradebook_category_id)
        LearningStudioCore::TestHelper.delay_in_seconds(3)
        get_custom_gradebook_category_test(custom_gradebook_category_id)
        LearningStudioCore::TestHelper.delay_in_seconds(3)
        get_custom_gradebook_category_test(custom_gradebook_category_id)
      ensure
        teardown_custom_gradebook_category(custom_gradebook_category_id)
      end
    end

    def test_get_custom_gradebook_category_with_xml_oauth2_assertion_repeat
      custom_gradebook_category_id = setup_custom_gradebook_category()
      begin
        @service.data_format = BasicService::DataFormat::XML
        @service.use_oauth2(@test_constants.teacher_username)
        get_custom_gradebook_category_test(custom_gradebook_category_id)
        LearningStudioCore::TestHelper.delay_in_seconds(3)
        get_custom_gradebook_category_test(custom_gradebook_category_id)
        LearningStudioCore::TestHelper.delay_in_seconds(3)
        get_custom_gradebook_category_test(custom_gradebook_category_id)
      ensure
        teardown_custom_gradebook_category(custom_gradebook_category_id)
      end
    end

    def test_get_custom_gradebook_category_oauth2_password
      custom_gradebook_category_id = setup_custom_gradebook_category()
      begin
        @service.use_oauth2(@test_constants.teacher_username, @test_constants.teacher_password)
        get_custom_gradebook_category_test(custom_gradebook_category_id)
      ensure
        teardown_custom_gradebook_category(custom_gradebook_category_id)
      end
    end

    def test_get_custom_gradebook_category_with_xml_oauth2_password
      custom_gradebook_category_id = setup_custom_gradebook_category()
      begin
        @service.data_format = BasicService::DataFormat::XML
        @service.use_oauth2(@test_constants.teacher_username, @test_constants.teacher_password)
        get_custom_gradebook_category_test(custom_gradebook_category_id)
      ensure
        teardown_custom_gradebook_category(custom_gradebook_category_id)
      end
    end

    def test_get_custom_gradebook_category_oauth2_password_repeat
      custom_gradebook_category_id = setup_custom_gradebook_category()
      begin
        @service.use_oauth2(@test_constants.teacher_username, @test_constants.teacher_password)
        get_custom_gradebook_category_test(custom_gradebook_category_id)
        LearningStudioCore::TestHelper.delay_in_seconds(3)
        get_custom_gradebook_category_test(custom_gradebook_category_id)
        LearningStudioCore::TestHelper.delay_in_seconds(3)
        get_custom_gradebook_category_test(custom_gradebook_category_id)
      ensure
        teardown_custom_gradebook_category(custom_gradebook_category_id)
      end
    end

    def test_get_custom_gradebook_category_with_xml_oauth2_password_repeat
      custom_gradebook_category_id = setup_custom_gradebook_category()
      begin
        @service.data_format = BasicService::DataFormat::XML
        @service.use_oauth2(@test_constants.teacher_username, @test_constants.teacher_password)
        get_custom_gradebook_category_test(custom_gradebook_category_id)
        LearningStudioCore::TestHelper.delay_in_seconds(3)
        get_custom_gradebook_category_test(custom_gradebook_category_id)
        LearningStudioCore::TestHelper.delay_in_seconds(3)
        get_custom_gradebook_category_test(custom_gradebook_category_id)
      ensure
        teardown_custom_gradebook_category(custom_gradebook_category_id)
      end
    end

    def test_destroy()
      @service.destroy!
      assert_nil @service.data_format, 'Preferred format should be missing'
      assert_raises(NoMethodError, "Should fail without OAuth selected") { create_custom_gradebook_category_test() }

      @service.use_oauth1
      assert_raises(NoMethodError, "Should fail with OAuth selected") { create_custom_gradebook_category_test() }
    end

    def test_with_string_content
      custom_gradebook_category_id = setup_custom_gradebook_category()
      begin
        @service.use_oauth2(@test_constants.teacher_username)
        relative_url = "#{@test_constants.path_courses_gradebook_customcategories}/#{custom_gradebook_category_id}"
        response = @service.get(relative_url)
        refute response.binary_content?, "Binary Content not expected"
        assert_nil response.binary_content, "Binary Content should be null"
        refute_nil response.content(), "String Content should not be null"
      ensure
        teardown_custom_gradebook_category(custom_gradebook_category_id)
      end
    end

    def test_with_binary_content
      custom_gradebook_category_id = setup_custom_gradebook_category()
      begin
        @service.use_oauth2(@test_constants.teacher_username)
        relative_url = @test_constants.path_courses_msofficedocuments_originaldocument % [@test_constants.course_id, @test_constants.ms_officedocument_id]
        response = @service.get(relative_url)
        assert response.binary_content?, "Binary Content is expected"
        refute_nil response.binary_content, "Binary Content should not be null"
        assert_nil response.content, "String Content should be null"
      ensure
        teardown_custom_gradebook_category(custom_gradebook_category_id)
      end
    end

    private
    def system_datetime_oauth1_test
      @service.use_oauth1
      system_datetime_test()
    end

    def system_datetime_test
      response = @service.system_datetime()
      refute response.error?, "Should not be in an error state - #{response}"
      assert BasicService::HTTPStatusCode::OK == response.status_code, "System Date Time status should be 200 OK"
    end

    def system_datetime_millis_test
      millis = @service.system_datetime_millis()
      assert millis > 0, "Time should exist"
    end

    def create_custom_gradebook_category_test
      custom_category = @service.data_format == BasicService::DataFormat::XML ? \
        @test_constants.custom_category_xml : @test_constants.custom_category_json
      relative_url = @test_constants.path_courses_gradebook_customcategories
      response = @service.post(relative_url, custom_category)
      refute response.error?, "Should not be in an error state - #{response}"
      assert BasicService::HTTPStatusCode::CREATED == response.status_code,\
        "Custom category creation status should be 201 Created"
      if @service.data_format == BasicService::DataFormat::XML
        parse_xml_tag(response.content, ["customCategory", "guid"])
      else
        json_elem = JSON.parse(response.content)
      end
      refute_nil json_elem, "Response JSON should not be nil"
      custom_category_json = json_elem["customCategory"]
      refute_nil custom_category_json, "Custom Category should exist"
      guid = custom_category_json["guid"]
      refute_nil guid, "GUID should exists in customCategory response"
      guid
    end

    def setup_custom_gradebook_category()
      @service.data_format = BasicService::DataFormat::JSON
      @service.use_oauth1()
      response = @service.post(@test_constants.path_courses_gradebook_customcategories, @test_constants.custom_category_json)
      refute response.error?, "Should not be in an error state - #{response}"
      assert BasicService::HTTPStatusCode::CREATED == response.status_code,\
        "Custom category creation status should be 201 Created"
      LearningStudioCore::TestHelper.delay_in_seconds(3)
      if @service.data_format == BasicService::DataFormat::JSON
        custom_category = JSON.parse(response.content)
        custom_category['customCategory']['guid']
      else
        parse_xml_tag(response.content, ['customCategory', 'guid'])
      end
    end

    def teardown_custom_gradebook_category(custom_category_id)
      LearningStudioCore::TestHelper.delay_in_seconds(3)
      @service.data_format = BasicService::DataFormat::JSON
      @service.use_oauth1()
      relative_url = "#{@test_constants.path_courses_gradebook_customcategories}/#{custom_category_id}"
      response = @service.delete(relative_url)
      assert BasicService::HTTPStatusCode::NO_CONTENT == response.status_code ||\
        BasicService::HTTPStatusCode::NOT_FOUND == response.status_code,\
        'Custom Category deletion status should be 204 No Content or 404 Not Found'
      LearningStudioCore::TestHelper.delay_in_seconds(3)
    end

    def update_custom_gradebook_category_test(custom_category_id)
      custom_category = @service.data_format == BasicService::DataFormat::XML ? \
        @test_constants.custom_category_xml : @test_constants.custom_category_json
      relative_url = "#{@test_constants.path_courses_gradebook_customcategories}/#{custom_category_id}"
      response = @service.put(relative_url, custom_category)
      refute response.error?, "Should not be in an error state - #{response}"
      assert BasicService::HTTPStatusCode::NO_CONTENT == response.status_code,\
        'Custom category creation status should be 204 No Content'
    end

    def delete_custom_gradebook_category_test(custom_category_id)
      relative_url = "#{@test_constants.path_courses_gradebook_customcategories}/#{custom_category_id}"
      response = @service.delete(relative_url)
      refute response.error?, "Should not be in an error state - #{response}"
      assert BasicService::HTTPStatusCode::NO_CONTENT == response.status_code ||\
        "Custom category creation status should be 204 No Content"
    end

    def get_custom_gradebook_category_test(custom_category_id)
      relative_url = "#{@test_constants.path_courses_gradebook_customcategories}/#{custom_category_id}"
      response = @service.get(relative_url)
      refute response.error?, "Should not be in an error state - #{response}"
      assert BasicService::HTTPStatusCode::OK == response.status_code,\
        "Custom category creation status should be 200 OK"
      if @service.data_format == BasicService::DataFormat::JSON
        json_data = JSON.parse(response.content)
        refute_nil json_data
        custom_categories = json_data['customCategories']
        assert custom_categories.length > 0, "Custom Categories should exist"
      else
        assert response.content.include?('<customCategory>'),\
          "Custom Categories should exist"
      end
    end

    def parse_xml_tag(xml, tags)
      Nokogiri::XML(xml).xpath(tags.join("/")).text
    end
  end
end
