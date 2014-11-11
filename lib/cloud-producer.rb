require 'cfndsl'
require 'json'
require 'AWS'

## cfndsl bible  https://github.com/stevenjack/cfndsl/blob/master/lib/cfndsl/aws_types.yaml

class CloudProducer

  attr_reader :region

  def initialize(params = {})
    @region = params.fetch(:region, 'ap-souteast-2')
    @cfn = AWS::CloudFormation.new(:region => 'ap-southeast-2')
  end

  def parse_template template_path
    model = CfnDsl::eval_file_with_extras(template_path)
    JSON.pretty_generate(JSON.parse(model.to_json))  
  end

  def delete_stack stack_name
    stack = @cfn.stacks[stack_name].delete
  end

  def create_stack
    template = CloudProducer.new.parse_template 'template.rb'
    stack = @cfn.stacks.create(stack_name, template)
  end
end



