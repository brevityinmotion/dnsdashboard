resource "aws_dynamodb_table" "ipinfo-dynamodb-table" {
  name           = "brevity_ipinfo"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "queryid"
  range_key      = "timestamp"

// logversion,timestamp,zoneid,queryname,querytype,responsecode,protocol,edgelocation,resolverip,clientsubnet
  
  attribute {
    name = "queryid"
    type = "S"
  }
  
  attribute {
    name = "timestamp"
    type = "S"
  }

  tags = {
    Name        = "brevityinmotion"
  }
}