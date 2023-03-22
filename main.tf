resource "aws_elasticache_cluster" "elasticache" {
  cluster_id        = "${var.env}-elasticache"
  engine            = var.engine
  node_type         = var.node_type
  num_cache_nodes   = var.num_cache_nodes
  engine_version    = var.engine_version
  port              = 6379
  subnet_group_name = aws_elasticache_subnet_group.main.name

  tags = merge(
    var.tags,
    { Name = "${var.env}-elasticache" }
  )
}

resource "aws_elasticache_subnet_group" "main" {
  name       = "${var.env}-rds"
  subnet_ids = var.subnet_ids

  tags = merge(
    var.tags,
    { Name = "${var.env}-subnet-group" }
  )
}
