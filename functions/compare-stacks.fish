function compare-stacks
  set a (echo $argv | awk '{print $1}')
  set b (echo $argv | awk '{print $2}')
  meld -u (aws cloudformation describe-stacks --region us-east-1 --stack-name $a | jq -r '.Stacks[].Parameters[] | .ParameterKey + "=" + .ParameterValue' | sort | grep -E 'Version|Ami' | psub) (aws cloudformation describe-stacks --region us-east-1 --stack-name $b | jq -r '.Stacks[].Parameters[] | .ParameterKey + "=" + .ParameterValue' | sort | grep -E 'Version|Ami' | psub)
end

