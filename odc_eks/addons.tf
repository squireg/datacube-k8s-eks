resource "aws_eks_addon" "vpc_cni" {
    count = var.addon_vpccni_enable ? 1 : 0

    cluster_name  = module.eks.cluster_id
    addon_name    = "vpc-cni"
    addon_version = addon_vpccni_version
    configuration_values = jsonencode(var.addon_vpccni_config)

    # This will change to resolve_conflicts_{create,update} using separate vars
    # when we upgrade to aws provider v5.
    resolve_conflicts = var.addon_vpccni_resolve_update
}