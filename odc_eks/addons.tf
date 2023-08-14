resource "aws_eks_addon" "vpc_cni" {
    count = var.addon_vpccni_enable ? 1 : 0

    cluster_name  = module.eks.cluster_id
    addon_name    = "vpc-cni"
    addon_version = var.addon_vpccni_version
    configuration_values = var.addon_vpccni_config == null ? null : jsonencode(var.addon_vpccni_config)

    # This will change to resolve_conflicts_{create,update} using separate vars
    # when we upgrade to aws provider v5.
    resolve_conflicts = var.addon_vpccni_resolve_update
}

resource "aws_eks_addon" "kube-proxy" {
    count = var.addon_kubeproxy_enable ? 1 : 0

    cluster_name  = module.eks.cluster_id
    addon_name    = "kube-proxy"
    addon_version = var.addon_kubeproxy_version
    configuration_values = var.addon_kubeproxy_config == null ? null : jsonencode(var.addon_kubeproxy_config)

    # This will change to resolve_conflicts_{create,update} using separate vars
    # when we upgrade to aws provider v5.
    resolve_conflicts = var.addon_kubeproxy_resolve_update
}

resource "aws_eks_addon" "coredns" {
    count = var.addon_coredns_enable ? 1 : 0

    cluster_name  = module.eks.cluster_id
    addon_name    = "coredns"
    addon_version = var.addon_coredns_version
    configuration_values = var.addon_coredns_config == null ? null : jsonencode(var.addon_coredns_config)

    # This will change to resolve_conflicts_{create,update} using separate vars
    # when we upgrade to aws provider v5.
    resolve_conflicts = var.addon_coredns_resolve_update
}